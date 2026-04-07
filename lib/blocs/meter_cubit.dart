import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:tempo/entities/audio_listener.dart';
import 'package:tempo/locator.dart';
import 'package:tempo/repositories/audio_capture/audio_capture_repository.dart';

part 'meter_cubit.freezed.dart';

class MeterCubit extends Cubit<MeterState> {
  MeterCubit({
    MeterRefreshRate refreshRate = const MeterRefreshRate.slow(),
    this.peakFadeDuration = const Duration(seconds: 2),
  }) : _refreshSpeed = refreshRate,
       super(
         const MeterState(
           decibels: 0.0,
           maxDecibels: 0,
           peak: 0.0,
           refreshRate: Duration(seconds: 1),
         ),
       ) {
    _init = super.state;

    _initialize();
  }

  late final MeterState _init;
  final Duration peakFadeDuration;

  final _audioCaptureRepository = locator.get<AudioCaptureRepository>();

  final _peakStopwatch = Stopwatch()..start();

  final MeterRefreshRate _refreshSpeed;
  double _decibels = 0;
  final double _maxDecibels = 100;
  double _peak = 0;

  late Timer? _timer;

  late final audioListener = AudioListener.meter(
    listener: (decibels) {
      if (isClosed) {
        return;
      }

      if (decibels > _peak) {
        _peak = decibels;
        _peakStopwatch
          ..reset()
          ..start();
      }

      _decibels = decibels;
      _peak = _peak;
    },
    onError: (e) => emit(_init),
  );

  Future<void> _initialize() async {
    final refreshRate = Duration(
      milliseconds: 1000 ~/ _refreshSpeed.when(slow: () => 2, fast: () => 8),
    );

    _timer = Timer.periodic(refreshRate, (_) {
      if (isClosed) {
        return;
      }

      if (_peakStopwatch.elapsed > peakFadeDuration) {
        _peak = _decibels;
      }

      emit(
        MeterState(
          decibels: _decibels,
          maxDecibels: _maxDecibels,
          peak: _peak,
          refreshRate: refreshRate,
        ),
      );
    });

    _audioCaptureRepository.addListener(audioListener);
  }

  @override
  Future<void> close() async {
    _audioCaptureRepository.removeListener(audioListener);
    _peakStopwatch.stop();
    _timer?.cancel();

    return super.close();
  }
}

class MeterState {
  const MeterState({
    required this.decibels,
    required this.maxDecibels,
    required this.peak,
    required this.refreshRate,
  });

  final double decibels;
  final double maxDecibels;
  final double peak;
  final Duration refreshRate;
}

@freezed
abstract class MeterRefreshRate with _$MeterRefreshRate {
  const factory MeterRefreshRate.slow() = _Slow;
  const factory MeterRefreshRate.fast() = _Fast;
}
