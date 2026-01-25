import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tempo/blocs/permission_cubit.dart';
import 'package:tempo/blocs/tone_calibration_cubit.dart';
import 'package:tempo/components/error_with_retry_component.dart';
import 'package:tempo/components/permission_wrapper_component.dart';

class ToneCalibrationScreen extends StatelessWidget {
  const ToneCalibrationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return PermissionWrapperComponent(
      permission: Permission.microphone(),
      grantedBuilder: (context) => const _Calibrator(),
    );
  }
}

class _Calibrator extends StatelessWidget {
  const _Calibrator();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ToneCalibrationCubit(),
      child: BlocBuilder<ToneCalibrationCubit, ToneCalibrationState>(
        buildWhen:
            (previous, current) => current.maybeWhen(
              initializing: () => true,
              displayingInstructions: () => true,
              errorInitializing: (_) => true,
              waitingCalibration: () => true,
              calibrating: () => true,
              orElse: () => false,
            ),
        builder: (context, state) {
          return PopScope(
            canPop: false,
            child: Scaffold(
              appBar: AppBar(
                title: const Text('Microphone calibration'),
                automaticallyImplyLeading: false,
              ),
              body: SafeArea(
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: state.maybeMap(
                    waitingCalibration: (_) {
                      return const _Intro();
                    },
                    displayingInstructions: (_) {
                      return const _Instructions();
                    },
                    calibrating: (_) {
                      return const _Calibrating();
                    },
                    errorInitializing:
                        (error) => ErrorWithRetryComponent(
                          errorMessage: error.message,
                          onRetry: context.read<ToneCalibrationCubit>().reload,
                        ),
                    orElse:
                        () => const Center(child: CircularProgressIndicator()),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

class _Calibrating extends StatelessWidget {
  const _Calibrating();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(
          child: Center(
            child: BlocBuilder<ToneCalibrationCubit, ToneCalibrationState>(
              builder: (context, state) {
                return Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SizedBox.square(
                      dimension: 150,
                      child: AnimatedCircularProggressIndicator(
                        color: state.maybeWhen(
                          calibrating:
                              () => Theme.of(context).colorScheme.primary,
                          analyzing: () => Colors.orangeAccent,
                          badCalibration: () => Colors.redAccent,
                          orElse: () => Colors.greenAccent,
                        ),
                        value: state.maybeWhen(
                          calibrated: (_) => 1.0,
                          badCalibration: () => 1.0,
                          orElse: () => null,
                        ),
                        fill: state.maybeWhen(
                          calibrated: (_) => true,
                          badCalibration: () => true,
                          orElse: () => false,
                        ),
                      ),
                    ),
                    const SizedBox(height: 40),
                    _AutoDottedText(
                      text: state.maybeWhen(
                        orElse: () => 'Calibrating',
                        analyzing: () => 'Analyzing',
                        calibrated: (offset) => 'Calibrated',
                        badCalibration: () => 'Calibration failed',
                      ),
                      showDots: state.maybeWhen(
                        analyzing: () => true,
                        calibrating: () => true,
                        orElse: () => false,
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
        ),
        const SizedBox(height: 40),
        Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            BlocBuilder<ToneCalibrationCubit, ToneCalibrationState>(
              builder: (context, state) {
                return ElevatedButton(
                  onPressed: state.maybeWhen(
                    badCalibration:
                        () =>
                            context
                                .read<ToneCalibrationCubit>()
                                .displayInstructions,
                    calibrated:
                        (offset) => () async {
                          await context
                              .read<ToneCalibrationCubit>()
                              .stopCalibration();

                          if (context.mounted) {
                            Navigator.of(context).pop(offset);
                          }
                        },
                    orElse:
                        () =>
                            context
                                .read<ToneCalibrationCubit>()
                                .startCalibration,
                  ),

                  child: Container(
                    width: double.infinity,
                    alignment: Alignment.center,
                    child: Text(
                      state.maybeWhen(
                        calibrated: (_) => 'Go to tuner',
                        errorCalibrating: (_) => 'Try again',
                        badCalibration: () => 'Try again',
                        orElse: () => 'Cancel',
                      ),
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ],
    );
  }
}

class AnimatedCircularProggressIndicator extends StatefulWidget {
  const AnimatedCircularProggressIndicator({
    super.key,
    this.color,
    this.value,
    this.fill = false,
  });

  final Color? color;
  final double? value;
  final bool fill;

  @override
  State<AnimatedCircularProggressIndicator> createState() =>
      _AnimatedCircularProggressIndicatorState();
}

class _AnimatedCircularProggressIndicatorState
    extends State<AnimatedCircularProggressIndicator>
    with TickerProviderStateMixin {
  @override
  void initState() {
    super.initState();

    _valueController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );

    _colorController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );

    _colorTween = ColorTween(begin: widget.color, end: widget.color);

    _colorTweenAnimation = _colorTween.animate(_colorController);

    _colorController.forward();

    _fillController = AnimationController(
      vsync: this,
      value: widget.fill ? 1 : 0,
      duration: const Duration(milliseconds: 300),
    );

    _fillAnimation = CurvedAnimation(
      parent: _fillController,
      curve: Curves.easeIn,
    );
  }

  late AnimationController _colorController;
  late AnimationController _valueController;
  late AnimationController _fillController;
  late ColorTween _colorTween;
  late CurvedAnimation _fillAnimation;
  late Animation<Color?> _colorTweenAnimation;

  @override
  void didUpdateWidget(covariant AnimatedCircularProggressIndicator oldWidget) {
    super.didUpdateWidget(oldWidget);

    _handleAnimationChanges(oldWidget);
  }

  Future<void> _handleAnimationChanges(
    AnimatedCircularProggressIndicator oldWidget,
  ) async {
    if (widget.fill != oldWidget.fill) {
      if (widget.fill) {
        await _valueController.animateTo(
          1,
          duration: const Duration(milliseconds: 300),
        );

        await _fillController.forward();
      } else {
        await _fillController.animateTo(
          0,
          duration: const Duration(milliseconds: 400),
        );

        _valueController.reset();
      }
    }

    if (widget.color != oldWidget.color) {
      final originalColor =
          // ignore: use_build_context_synchronously
          (context.mounted ? Theme.of(context).colorScheme.primary : null);

      _colorTween = ColorTween(
        begin: _colorTweenAnimation.value ?? _colorTween.end ?? originalColor,
        end: widget.color ?? originalColor,
      );

      _colorTweenAnimation = _colorTween.animate(_colorController);

      _colorController.reset();
      await _colorController.forward();
    }

    if (widget.value != oldWidget.value && !widget.fill) {
      await _valueController.animateTo(
        widget.value ?? 0,
        duration: const Duration(milliseconds: 300),
      );
    }
  }

  @override
  void dispose() {
    _colorController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final strokeWidth = (constraints.maxWidth * 0.15);

        return AnimatedBuilder(
          animation: Listenable.merge([
            _colorTweenAnimation,
            _valueController,
            _fillAnimation,
          ]),
          builder: (context, _) {
            return CircularProgressIndicator(
              strokeWidth:
                  strokeWidth +
                  ((constraints.maxWidth / 2) - strokeWidth) *
                      _fillAnimation.value,
              strokeAlign: -1,
              strokeCap: StrokeCap.round,
              color: _colorTweenAnimation.value,
              value:
                  _valueController.value == 0 ? null : _valueController.value,
            );
          },
        );
      },
    );
  }
}

class _AutoDottedText extends StatefulWidget {
  const _AutoDottedText({required this.text, required this.showDots});

  final String text;
  final bool showDots;

  @override
  State<_AutoDottedText> createState() => _AutoDottedTextState();
}

class _AutoDottedTextState extends State<_AutoDottedText> {
  @override
  void initState() {
    super.initState();

    _startTimer();
  }

  @override
  void didUpdateWidget(covariant _AutoDottedText oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (!widget.showDots) {
      dots = ' ';

      timer?.cancel();

      if (context.mounted) {
        setState(() {});
      }

      return;
    }

    if (widget.text != oldWidget.text) {
      _startTimer();
    }
  }

  void _startTimer() {
    dots = '.';

    timer?.cancel();

    timer = Timer.periodic(const Duration(milliseconds: 500), (_) {
      if (dots.length >= 3) {
        dots = '.';
      } else {
        dots += '.';
      }

      if (context.mounted) {
        setState(() {});
      }
    });
  }

  @override
  void dispose() {
    timer?.cancel();

    super.dispose();
  }

  Timer? timer;

  String dots = '.';

  @override
  Widget build(BuildContext context) {
    final style = Theme.of(context).textTheme.titleLarge;

    return Text.rich(
      TextSpan(
        children: [
          TextSpan(
            text: dots,
            style: style?.copyWith(color: Colors.transparent),
          ),
          TextSpan(text: widget.text, style: style),
          TextSpan(
            text: dots,
            style: style?.copyWith(
              color: Theme.of(context).colorScheme.primary,
            ),
          ),
        ],
      ),
      semanticsLabel: widget.text,
    );
  }
}

class _Instructions extends StatelessWidget {
  const _Instructions();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(
          child: SingleChildScrollView(
            physics: const ClampingScrollPhysics(),
            child: Column(
              children: [
                Icon(
                  Icons.music_note,
                  size: 100,
                  color: Theme.of(context).colorScheme.primary,
                ),
                const SizedBox(height: 40),
                Card(
                  child: Padding(
                    padding: const EdgeInsets.only(
                      left: 20,
                      right: 20,
                      top: 20,
                      bottom: 40,
                    ),
                    child: Column(
                      children: [
                        Text(
                          'Instructions:',
                          style: Theme.of(context).textTheme.titleLarge,
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(height: 30),
                        const Text(
                          '1. Move to a quiet place',
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(height: 20),
                        const Text(
                          '2. Unplug any headphones, let the sound come out of your speakers',
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(height: 20),
                        const Text(
                          '3. Make sure your device\'s volume is all the way up (we\'re not gonna jump scare you, I promise)',
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(height: 20),
                        const Text(
                          '4. (Optional) If you\'re NOT using a phone, bring your microphone closer to your speaker',
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 40),
        Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            const Text(
              'When you\'re ready, press the button below.',
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: context.read<ToneCalibrationCubit>().startCalibration,

              child: const Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.mic_rounded),
                  SizedBox(width: 4),
                  Text('Start calibration!'),
                ],
              ),
            ),
            const SizedBox(height: 10),
            TextButton(
              onPressed: () async {
                await context.read<ToneCalibrationCubit>().stopCalibration();

                if (context.mounted) {
                  Navigator.of(context).pop();
                }
              },

              child: Container(
                width: double.infinity,
                alignment: Alignment.center,
                child: const Text('Cancel'),
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class _Intro extends StatelessWidget {
  const _Intro();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.music_note,
                size: 100,
                color: Theme.of(context).colorScheme.primary,
              ),
              const SizedBox(height: 20),
              Text(
                'If you feel your tuning isn\'t quite right, you can try recalibrating your microphone.',
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.bodyLarge,
              ),
            ],
          ),
        ),
        const SizedBox(height: 40),
        Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            const Text(
              'When you\'re ready, press the button below.',
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed:
                  context.read<ToneCalibrationCubit>().displayInstructions,

              child: Container(
                width: double.infinity,
                alignment: Alignment.center,
                child: const Text('Let\'s go!'),
              ),
            ),
            const SizedBox(height: 10),
            TextButton(
              onPressed: () async {
                await context.read<ToneCalibrationCubit>().stopCalibration();

                if (context.mounted) {
                  Navigator.of(context).pop();
                }
              },

              child: Container(
                width: double.infinity,
                alignment: Alignment.center,
                child: const Text('Cancel'),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
