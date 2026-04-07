import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tempo/blocs/meter_cubit.dart';
import 'package:tempo/blocs/permission_cubit.dart';
import 'package:tempo/blocs/tuner_cubit.dart';
import 'package:tempo/components/permission_wrapper.dart';

class TunerScreen extends StatelessWidget {
  const TunerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return PermissionWrapper(
      permission: Permission.microphone(),
      grantedBuilder: (context) => const _Tuner2(),
    );
  }
}

class _Tuner2 extends StatelessWidget {
  const _Tuner2();

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => TunerCubit()),
        BlocProvider(
          create:
              (context) =>
                  MeterCubit(refreshRate: const MeterRefreshRate.fast()),
        ),
      ],
      child: BlocListener<TunerCubit, TunerState>(
        listener: (context, state) {
          state.mapOrNull(
            tuning: (data) {
              if (data.isTuned) {
                // TODO: add a haptic feedback.
              }
            },
          );
        },
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Stack(
            children: [
              const Positioned(left: 0, top: 0, child: _SoundMeter()),
              Positioned.fill(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    BlocBuilder<TunerCubit, TunerState>(
                      buildWhen:
                          (previous, current) => current.maybeMap(
                            tuning: (_) => true,
                            stopped: (_) => true,
                            orElse: () => false,
                          ),
                      builder: (context, state) {
                        final key = state.mapOrNull(
                          tuning: (data) => data.key,
                          stopped: (data) => data.lastKey,
                        );

                        final octave = state.mapOrNull(
                          tuning: (data) => '${data.octave}',
                          stopped: (data) => data.lastOctave?.toString(),
                        );
                        return AnimatedDefaultTextStyle(
                          duration: const Duration(milliseconds: 100),
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: state.maybeMap(
                              tuning:
                                  (data) =>
                                      data.isTuned ? _tunedColor : _tuningColor,
                              stopped:
                                  (data) =>
                                      data.lastKey != null
                                          ? Colors.white.withValues(alpha: 0.1)
                                          : Colors.white,
                              orElse: () => Colors.white,
                            ),
                          ),
                          child: Semantics(
                            label:
                                key != null && octave != null
                                    ? key + octave
                                    : '',
                            excludeSemantics: true,

                            child: Text.rich(
                              textAlign: TextAlign.start,
                              TextSpan(
                                children: [
                                  TextSpan(
                                    text: octave ?? ' ',
                                    style: const TextStyle(
                                      fontSize: 30,
                                      color: Colors.transparent,
                                    ),
                                  ),
                                  if (key != null && key.length > 1)
                                    const TextSpan(
                                      text: '#',
                                      style: TextStyle(
                                        fontSize: 90,
                                        color: Colors.transparent,
                                      ),
                                    ),
                                  TextSpan(
                                    text: key ?? ' ',
                                    style: const TextStyle(fontSize: 90),
                                  ),
                                  TextSpan(
                                    text: octave ?? ' ',
                                    style: const TextStyle(fontSize: 30),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                    LayoutBuilder(
                      builder: (context, constraints) {
                        const rulerItems = [
                          _SmallBar(),
                          _SmallBar(),
                          _MediumBar(),
                          _SmallBar(),
                          _SmallBar(),
                          _SmallBar(),
                          _SmallBar(),
                          _MediumBar(),
                          _SmallBar(),
                          _SmallBar(),
                          _SmallBar(),
                          _SmallBar(),
                          _LargeBar(),
                          _SmallBar(),
                          _SmallBar(),
                          _SmallBar(),
                          _SmallBar(),
                          _MediumBar(),
                          _SmallBar(),
                          _SmallBar(),
                          _SmallBar(),
                          _SmallBar(),
                          _MediumBar(),
                          _SmallBar(),
                          _SmallBar(),
                        ];

                        return SizedBox(
                          width: constraints.maxWidth,
                          child: Stack(
                            alignment: Alignment.centerLeft,
                            children: [
                              const Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                mainAxisSize: MainAxisSize.max,
                                children: rulerItems,
                              ),

                              BlocBuilder<TunerCubit, TunerState>(
                                builder: (context, state) {
                                  return state.maybeMap(
                                    tuning: (data) {
                                      final position =
                                          (rulerItems.length *
                                              (data.position + 1)) /
                                          2;

                                      final isTuned = state.maybeMap(
                                        tuning: (data) => data.isTuned,
                                        orElse: () => false,
                                      );

                                      final isStopped = state.maybeMap(
                                        stopped: (data) => true,
                                        orElse: () => false,
                                      );

                                      return AnimatedPositioned(
                                        duration: const Duration(
                                          milliseconds: 100,
                                        ),
                                        left:
                                            isTuned
                                                ? (constraints.maxWidth -
                                                        _tuningBarWidth) /
                                                    2
                                                : (position *
                                                    (constraints.maxWidth -
                                                        _tuningBarWidth) /
                                                    24),
                                        child: _TuningBar(
                                          isTuned: isTuned,
                                          isStopped: isStopped,
                                        ),
                                      );
                                    },
                                    stopped: (data) {
                                      if (data.lastPosition == null) {
                                        return const SizedBox.shrink();
                                      }

                                      final position =
                                          (rulerItems.length *
                                              (data.lastPosition! + 1)) /
                                          2;

                                      return AnimatedPositioned(
                                        duration: const Duration(
                                          milliseconds: 100,
                                        ),
                                        left:
                                            (position *
                                                (constraints.maxWidth -
                                                    _tuningBarWidth) /
                                                24),
                                        child: const _TuningBar(
                                          isTuned: false,
                                          isStopped: true,
                                        ),
                                      );
                                    },
                                    orElse: SizedBox.shrink,
                                  );
                                },
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

const _soundMeterWidth = 30.0;

class _SoundMeter extends StatelessWidget {
  const _SoundMeter();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TunerCubit, TunerState>(
      builder: (context, state) {
        return BlocBuilder<MeterCubit, MeterState>(
          builder: (context, meterState) {
            return Container(
              width: _soundMeterWidth,
              height: 60,
              decoration: BoxDecoration(
                color: Colors.white.withAlpha(100),
                borderRadius: const BorderRadius.all(Radius.circular(50)),
              ),
              clipBehavior: Clip.antiAlias,
              child: Stack(
                children: [
                  Container(
                    alignment: Alignment.topCenter,
                    padding: const EdgeInsets.only(top: 8),
                    child: const Icon(
                      Icons.mic,
                      color: Colors.white,
                      applyTextScaling: false,
                      size: _soundMeterWidth - 10,
                    ),
                  ),
                  AnimatedPositioned(
                    duration: meterState.refreshRate,
                    bottom: 0,
                    left: 0,
                    right: 0,
                    height:
                        meterState.maxDecibels == 0
                            ? 0
                            : (meterState.decibels / meterState.maxDecibels) *
                                60,
                    child: ColoredBox(
                      color:
                          meterState.decibels < state.tuningThresholdInDecibels
                              ? Colors.white
                              : state.maybeMap(
                                tuning:
                                    (data) =>
                                        data.isTuned
                                            ? _tunedColor
                                            : _tuningColor,
                                orElse: () => Colors.white,
                              ),
                    ),
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }
}

const _barWidth = 2.0;
const _tuningBarWidth = _barWidth * 2;
final _barColor = Colors.white.withValues(alpha: 0.3);
const _tuningColor = Colors.deepOrangeAccent;
const _tunedColor = Colors.greenAccent;

class _TuningBar extends StatelessWidget {
  const _TuningBar({required this.isTuned, required this.isStopped});

  final bool isTuned;
  final bool isStopped;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 100),
      height: isTuned ? 300 : 200,
      width: _tuningBarWidth,
      decoration: BoxDecoration(
        color:
            isStopped
                ? Colors.transparent
                : (isTuned ? _tunedColor : _tuningColor),
        borderRadius: const BorderRadius.all(Radius.circular(_barWidth)),
      ),
    );
  }
}

const _barMaxHeight = 200.0;

class _SmallBar extends StatelessWidget {
  const _SmallBar();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TunerCubit, TunerState>(
      buildWhen:
          (previous, current) =>
              current.maybeMap(
                tuning: (data) => data.isTuned,
                orElse: () => null,
              ) !=
              previous.maybeMap(
                tuning: (data) => data.isTuned,
                orElse: () => null,
              ),
      builder: (context, state) {
        return AnimatedContainer(
          duration: const Duration(milliseconds: 100),
          height: _barMaxHeight / 3,
          width: _barWidth,
          decoration: BoxDecoration(
            color:
                state.mapOrNull(
                  tuning: (data) => data.isTuned ? _tunedColor : _barColor,
                ) ??
                _barColor,
            borderRadius: const BorderRadius.all(Radius.circular(_barWidth)),
          ),
        );
      },
    );
  }
}

class _MediumBar extends StatelessWidget {
  const _MediumBar();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TunerCubit, TunerState>(
      buildWhen:
          (previous, current) =>
              current.maybeMap(
                tuning: (data) => data.isTuned,
                orElse: () => null,
              ) !=
              previous.maybeMap(
                tuning: (data) => data.isTuned,
                orElse: () => null,
              ),
      builder: (context, state) {
        return AnimatedContainer(
          duration: const Duration(milliseconds: 100),
          height: _barMaxHeight * 0.75,
          width: _barWidth,
          decoration: BoxDecoration(
            color:
                state.mapOrNull(
                  tuning: (data) => data.isTuned ? _tunedColor : _barColor,
                ) ??
                _barColor,
            borderRadius: const BorderRadius.all(Radius.circular(_barWidth)),
          ),
        );
      },
    );
  }
}

class _LargeBar extends StatelessWidget {
  const _LargeBar();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: _barMaxHeight,
      width: _barWidth,
      decoration: BoxDecoration(
        color: _barColor,
        borderRadius: const BorderRadius.all(Radius.circular(_barWidth)),
      ),
    );
  }
}
