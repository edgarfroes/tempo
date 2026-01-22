import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tempo/screens/tap_to_bpm/tap_to_bpm_bloc.dart';

class TapToBpmScreen extends StatelessWidget {
  const TapToBpmScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => TapToBpmBloc(),
      child: Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: 40),
            Expanded(
              child: Stack(
                children: [
                  const TapContainer(),
                  const Center(child: MainText()),
                  const Positioned(
                    bottom: 20,
                    left: 0,
                    right: 0,
                    child: Center(child: AverageBPM()),
                  ),
                  Positioned.fill(
                    child: BlocBuilder<TapToBpmBloc, TapToBpmState>(
                      buildWhen:
                          (previous, current) => current.maybeWhen(
                            initial: () => true,
                            waitingNextTap: (_) => true,
                            success: (_) => true,
                            orElse: () => false,
                          ),
                      builder: (context, state) {
                        return Listener(
                          behavior: HitTestBehavior.translucent,
                          onPointerDown: (_) {
                            context.read<TapToBpmBloc>().add(
                              state.maybeWhen(
                                waitingNextTap:
                                    (_) => const TapToBpmEvent.nextTap(),
                                orElse: () => const TapToBpmEvent.firstTap(),
                              ),
                            );
                          },
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 20),
            Container(
              constraints: const BoxConstraints(minHeight: 20),
              alignment: Alignment.center,
              child: const Countdown(),
            ),
          ],
        ),
      ),
    );
  }
}

class AverageBPM extends StatelessWidget {
  const AverageBPM({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TapToBpmBloc, TapToBpmState>(
      buildWhen:
          (previous, current) =>
              previous != current &&
              current.maybeWhen(
                changedAverageBPM: (_) => true,
                didFirstTap: () => true,
                orElse: () => false,
              ),
      builder: (context, state) {
        return state.maybeWhen(
          changedAverageBPM:
              (bpm) => Text.rich(
                TextSpan(
                  children: [
                    const TextSpan(text: 'Avg. '),
                    TextSpan(
                      text: '$bpm',
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                    const TextSpan(
                      text: ' BPM',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
          orElse: SizedBox.shrink,
        );
      },
    );
  }
}

class Countdown extends StatefulWidget {
  const Countdown({super.key});

  @override
  State<Countdown> createState() => _CountdownState();
}

class _CountdownState extends State<Countdown> with TickerProviderStateMixin {
  @override
  void dispose() {
    _controller.dispose();

    super.dispose();
  }

  late final AnimationController _controller = AnimationController(
    value: 0,
    duration: Duration.zero,
    vsync: this,
  );

  void _startAnimation(Duration duration) {
    _controller
      ..reset()
      ..animateTo(1, duration: duration);
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<TapToBpmBloc, TapToBpmState>(
      listener: (context, state) {
        state.whenOrNull(
          startedCountdown: _startAnimation,
          resetedCountdown: _startAnimation,
          finishedCountdown: _controller.reset,
          initial: _controller.reset,
        );
      },
      child: LayoutBuilder(
        builder: (context, constraints) {
          return AnimatedBuilder(
            animation: _controller,
            builder: (context, child) {
              if (!_controller.isAnimating) {
                return const SizedBox.shrink();
              }

              return Container(
                height: 20,
                width:
                    (1 - _controller.value) *
                    math.min(400, constraints.maxWidth),
                decoration: BoxDecoration(
                  color: Colors.deepOrange,
                  borderRadius: BorderRadius.circular(20),
                ),
              );
            },
          );
        },
      ),
    );
  }
}

class TapContainer extends StatelessWidget {
  const TapContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TapToBpmBloc, TapToBpmState>(
      buildWhen:
          (previous, current) => current.maybeWhen(
            startingTapFeedback: () => true,
            finishedTapFeedback: () => true,
            orElse: () => false,
          ),
      builder: (context, state) {
        return AnimatedContainer(
          clipBehavior: Clip.antiAlias,
          duration: const Duration(milliseconds: 50),
          width: double.infinity,
          decoration: BoxDecoration(
            color: state.whenOrNull(
              startingTapFeedback:
                  () => Colors.deepOrange.withValues(alpha: 0.1),
            ),
            borderRadius: BorderRadius.circular(20),
            border: Border.all(
              color: Colors.deepOrange,
              width: 4,
              style: BorderStyle.solid,
            ),
          ),
        );
      },
    );
  }
}

class MainText extends StatelessWidget {
  const MainText({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TapToBpmBloc, TapToBpmState>(
      buildWhen:
          (previous, current) => current.maybeMap(
            initial: (_) => true,
            waitingNextTap: (_) => true,
            success: (_) => true,
            orElse: () => false,
          ),
      builder: (context, state) {
        return state.maybeWhen(
          waitingNextTap: (bpm) {
            if (bpm != null) {
              return CurrentBPMText(bpm: bpm);
            }

            return const TapIndicator(text: 'Tap again');
          },
          success: (bpm) => CurrentBPMText(bpm: bpm),
          orElse: () {
            return const TapIndicator(text: 'Tap to start');
          },
        );
      },
    );
  }
}

class TapIndicator extends StatelessWidget {
  const TapIndicator({super.key, required this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          text,
          style: TextStyle(
            fontSize: 24,
            color: Colors.white.withValues(alpha: 0.8),
          ),
        ),
        const SizedBox(height: 4),
        const Icon(Icons.touch_app),
      ],
    );
  }
}

class CurrentBPMText extends StatelessWidget {
  const CurrentBPMText({super.key, required this.bpm});

  final int bpm;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          bpm.toString(),
          style: const TextStyle(
            fontSize: 100,
            fontWeight: FontWeight.bold,
            height: 1,
          ),
          textScaler: TextScaler.noScaling,
        ),
        const Text('BPM', style: TextStyle(fontWeight: FontWeight.bold)),
      ],
    );
  }
}
