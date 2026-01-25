import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tempo/blocs/permission_cubit.dart';
import 'package:tempo/blocs/tuner_cubit.dart';
import 'package:tempo/components/error_with_retry_component.dart';
import 'package:tempo/components/permission_wrapper_component.dart';
import 'package:tempo/screens/tone_calibration_screen.dart';

class TunerScreen extends StatelessWidget {
  const TunerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return PermissionWrapperComponent(
      permission: Permission.microphone(),
      grantedBuilder: (context) => const _Tuner(),
    );
  }
}

class _Tuner extends StatelessWidget {
  const _Tuner();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => TunerCubit(),
      child: BlocBuilder<TunerCubit, TunerState>(
        buildWhen:
            (previous, current) => current.maybeMap(
              initializing: (value) => true,
              initialized: (value) => true,
              errorInitializing: (value) => true,
              orElse: () => false,
            ),
        builder: (context, state) {
          return state.maybeMap(
            initializing:
                (_) => const Center(child: CircularProgressIndicator()),
            errorInitializing: (error) {
              return ErrorWithRetryComponent(
                errorMessage: error.message,
                onRetry: context.read<TunerCubit>().reload,
              );
            },
            orElse: () {
              return BlocBuilder<TunerCubit, TunerState>(
                buildWhen:
                    (previous, current) => current.maybeMap(
                      initialized: (_) => true,
                      tuning: (_) => true,
                      stopped: (_) => true,
                      orElse: () => false,
                    ),
                builder: (context, state) {
                  return Column(
                    children: [
                      Expanded(
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              state.maybeMap(
                                orElse: () => '',
                                tuning: (data) => data.key,
                              ),
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 90,
                              ),
                            ),
                            const SizedBox(height: 30),
                            ToneMeter(
                              position: state.maybeMap(
                                tuning: (data) => data.position,
                                orElse: () => null,
                              ),
                              isTuned: state.maybeMap(
                                tuning: (data) => data.isTuned,
                                orElse: () => false,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 30),
                      ElevatedButton(
                        onPressed: () async {
                          final cubit = context.read<TunerCubit>();

                          await cubit.pauseAudioCapture();

                          await Future.delayed(
                            const Duration(milliseconds: 300),
                          );

                          if (!context.mounted) {
                            return;
                          }

                          final calibrationOffset = await Navigator.of(
                            context,
                          ).push(
                            MaterialPageRoute(
                              builder:
                                  (context) => const ToneCalibrationScreen(),
                            ),
                          );

                          if (calibrationOffset is double) {
                            cubit.setCalibration(calibrationOffset);
                          }

                          await cubit.startAudioCapture();
                        },
                        child: const Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(Icons.mic_rounded),
                            SizedBox(width: 4),
                            Text('Calibrate'),
                          ],
                        ),
                      ),
                    ],
                  );
                },
              );
            },
          );
        },
      ),
    );
  }
}

class ToneMeter extends StatefulWidget {
  const ToneMeter({super.key, required this.position, required this.isTuned});

  final double? position;
  final bool isTuned;

  @override
  State<ToneMeter> createState() => _ToneMeterState();
}

class _ToneMeterState extends State<ToneMeter> with TickerProviderStateMixin {
  late final AnimationController _controller;

  @override
  void initState() {
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 30),
    );

    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();

    super.dispose();
  }

  @override
  void didUpdateWidget(covariant ToneMeter oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (widget.isTuned) {
      _controller.animateTo(0.5, duration: const Duration(milliseconds: 30));
      setState(() {
        _displayMeter = true;
      });

      return;
    }

    if (widget.position == null) {
      setState(() {
        _displayMeter = false;
      });

      return;
    }

    if (!_displayMeter) {
      setState(() {
        _displayMeter = true;
      });
    }

    _controller.animateTo(
      (widget.position! + 1) / 2,
      duration: const Duration(milliseconds: 40),
    );
  }

  var _displayMeter = false;

  @override
  Widget build(BuildContext context) {
    const meterHeight = 300.0;
    const meterWidth = 30.0;

    return Stack(
      alignment: Alignment.center,
      children: [
        LayoutBuilder(
          builder: (context, constraints) {
            final width = constraints.maxWidth;

            if (!_displayMeter) {
              return SizedBox(width: width, height: meterHeight);
            }

            return AnimatedBuilder(
              animation: _controller,
              builder: (context, child) {
                return SizedBox(
                  height: meterHeight,
                  child: Stack(
                    children: [
                      Positioned(
                        left: _controller.value * (width - meterWidth),
                        child: Container(
                          height: meterHeight,
                          width: meterWidth,
                          decoration: BoxDecoration(
                            color:
                                _controller.value == 0.5
                                    ? Colors.green
                                    : Colors.deepOrange,

                            borderRadius: const BorderRadius.all(
                              Radius.circular(3),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
            );
          },
        ),
        Center(
          child: Container(
            width: meterWidth + 4,
            height: meterHeight + 4,
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.white.withAlpha(100),
                width: 1,
                style: BorderStyle.solid,
              ),
              borderRadius: const BorderRadius.all(Radius.circular(5)),
            ),
          ),
        ),
      ],
    );
  }
}
