import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tempo/blocs/meter_cubit.dart';
import 'package:tempo/blocs/permission_cubit.dart';
import 'package:tempo/components/permission_wrapper.dart';

class MeterScreen extends StatelessWidget {
  const MeterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return PermissionWrapper(
      permission: Permission.microphone(),
      grantedBuilder: (context) => const _Meter(),
    );
  }
}

class _Meter extends StatelessWidget {
  const _Meter();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: BlocProvider(
        create:
            (context) => MeterCubit(
              refreshRate: const MeterRefreshRate.fast(),
              peakFadeDuration: const Duration(seconds: 3),
            ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(height: 8),
            Expanded(
              child: LayoutBuilder(
                builder: (context, constraints) {
                  return Stack(
                    alignment: Alignment.bottomCenter,
                    children: [
                      BlocBuilder<MeterCubit, MeterState>(
                        buildWhen:
                            (previous, current) =>
                                previous.maxDecibels != current.maxDecibels,
                        builder: (context, state) {
                          return Positioned(
                            left: 0,
                            top: 0,
                            bottom: 0,
                            child: MeterRuler(maxDecibels: state.maxDecibels),
                          );
                        },
                      ),
                      BlocBuilder<MeterCubit, MeterState>(
                        buildWhen:
                            (previous, current) =>
                                previous.peak != current.peak,
                        builder: (context, state) {
                          final bottom =
                              state.maxDecibels == 0
                                  ? constraints.maxHeight
                                  : constraints.maxHeight *
                                      state.peak /
                                      state.maxDecibels;

                          return AnimatedPositioned(
                            duration: const Duration(milliseconds: 100),
                            bottom: bottom,
                            left: 0,
                            right: 0,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Text(
                                  '${state.peak.truncate()} dB',
                                  style: const TextStyle(
                                    color: Colors.red,
                                    fontSize: 10,
                                  ),
                                ),
                                Container(
                                  alignment: Alignment.bottomRight,
                                  height: 1,
                                  color: Colors.red.withValues(alpha: 0.3),
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                      BlocBuilder<MeterCubit, MeterState>(
                        buildWhen:
                            (previous, current) =>
                                previous.decibels != current.decibels,
                        builder: (context, state) {
                          final top =
                              state.maxDecibels == 0
                                  ? constraints.maxHeight
                                  : constraints.maxHeight -
                                      (constraints.maxHeight *
                                          state.decibels /
                                          state.maxDecibels);

                          return AnimatedPositioned(
                            duration: const Duration(milliseconds: 100),
                            top: top,
                            left: 0,
                            right: 0,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Container(
                                  alignment: Alignment.topRight,
                                  height: 1,
                                  color: Colors.green.withValues(alpha: 0.3),
                                ),
                                Text(
                                  '${state.decibels.truncate()} dB',
                                  style: const TextStyle(
                                    color: Colors.green,
                                    fontSize: 10,
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                      BlocBuilder<MeterCubit, MeterState>(
                        buildWhen:
                            (previous, current) =>
                                previous.decibels != current.decibels,
                        builder: (context, state) {
                          final height =
                              state.maxDecibels == 0
                                  ? 0.0
                                  : constraints.maxHeight *
                                      state.decibels /
                                      state.maxDecibels;

                          return AnimatedPositioned(
                            duration: const Duration(milliseconds: 100),
                            height: math.max(0, height),
                            width: 100,
                            child: Container(
                              decoration: BoxDecoration(
                                color:
                                    state.decibels > state.maxDecibels * 0.9
                                        ? Colors.red
                                        : Colors.green,
                                borderRadius: BorderRadius.circular(8),
                              ),
                            ),
                          );
                        },
                      ),
                    ],
                  );
                },
              ),
            ),
            const SizedBox(height: 8),
            BlocBuilder<MeterCubit, MeterState>(
              buildWhen:
                  (previous, current) => previous.decibels != current.decibels,
              builder: (context, state) {
                return Text(
                  '${state.decibels.truncate()} dB',
                  style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

class MeterRuler extends StatelessWidget {
  const MeterRuler({super.key, required this.maxDecibels});

  final double maxDecibels;

  @override
  Widget build(BuildContext context) {
    final textStyle = TextStyle(
      color: Colors.white.withValues(alpha: 0.5),
      fontWeight: FontWeight.bold,
      fontSize: 10,
    );

    return Flex(
      direction: Axis.vertical,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Text('${maxDecibels.truncate()} dB', style: textStyle),
        Text('-', style: textStyle),
        Text('${(maxDecibels / 1.5).truncate()} dB', style: textStyle),
        Text('-', style: textStyle),
        Text('${(maxDecibels / 2).truncate()} dB', style: textStyle),
        Text('-', style: textStyle),
        Text('${(maxDecibels / 2.5).truncate()} dB', style: textStyle),
        Text('-', style: textStyle),
        Text('0 dB', style: textStyle),
      ],
    );
  }
}
