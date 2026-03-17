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
    return Scaffold(
      body: BlocProvider(
        create: (context) => TunerCubit(),
        child: BlocBuilder<TunerCubit, TunerState>(
          buildWhen:
              (previous, current) => current.maybeMap(
                initializing: (value) => true,
                initialized: (value) => true,
                errorInitializing: (value) => true,
                unsupported: (value) => true,
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
              unsupported: (_) {
                return ErrorWithRetryComponent(
                  errorMessage:
                      'Unfortunately your device does not support this feature.',
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

                            await cubit.stopAudioCapture();

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
  late final AnimationController _positionController;
  late final AnimationController _opacityController;

  @override
  void initState() {
    _positionController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 30),
    );

    _opacityController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 100),
    );

    super.initState();
  }

  @override
  void dispose() {
    _positionController.dispose();

    super.dispose();
  }

  @override
  void didUpdateWidget(covariant ToneMeter oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (widget.isTuned) {
      _positionController.animateTo(
        0.5,
        duration: const Duration(milliseconds: 30),
      );

      _opacityController.animateTo(1);

      return;
    }

    if (widget.position == null) {
      _opacityController.animateTo(
        0,
        duration: const Duration(milliseconds: 500),
      );

      return;
    }

    _positionController.animateTo(
      (widget.position! + 1) / 2,
      duration: const Duration(milliseconds: 30),
    );

    _opacityController.animateTo(1);
  }

  @override
  Widget build(BuildContext context) {
    const meterHeight = 300.0;
    const meterWidth = 30.0;

    return Stack(
      alignment: Alignment.center,
      children: [
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 50 / 2),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _MeterLine(
                meterHeight: meterHeight,
                text: '-50c',
                alignment: CrossAxisAlignment.start,
              ),
              _MeterLine(
                meterHeight: meterHeight,
                text: '+50c',
                alignment: CrossAxisAlignment.end,
              ),
            ],
          ),
        ),
        LayoutBuilder(
          builder: (context, constraints) {
            final width = constraints.maxWidth;

            return AnimatedBuilder(
              animation: Listenable.merge([
                _positionController,
                _opacityController,
              ]),
              builder: (context, child) {
                final left = _positionController.value * (width - meterWidth);

                return SizedBox(
                  height: meterHeight,
                  child: Stack(
                    children: [
                      Positioned(
                        left: left,
                        child: Opacity(
                          opacity: _opacityController.value,
                          child: Container(
                            height: meterHeight,
                            width: meterWidth,
                            decoration: BoxDecoration(
                              color:
                                  _positionController.value == 0.5
                                      ? Colors.green
                                      : Colors.deepOrange,

                              borderRadius: const BorderRadius.all(
                                Radius.circular(3),
                              ),
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

class _MeterLine extends StatelessWidget {
  const _MeterLine({
    required this.meterHeight,
    required this.text,
    required this.alignment,
  });

  final double meterHeight;
  final String text;
  final CrossAxisAlignment alignment;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: meterHeight,
      child: Column(
        crossAxisAlignment: alignment,
        children: [
          Text(
            text,
            style: const TextStyle(fontSize: 11, fontWeight: FontWeight.bold),
          ),
          Container(height: 10),
          Expanded(
            child: Container(width: 1, color: Colors.white.withAlpha(60)),
          ),
        ],
      ),
    );
  }
}
