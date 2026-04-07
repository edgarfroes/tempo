import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:tempo/entities/audio_listener.dart';
import 'package:tempo/entities/note_interval.dart';
import 'package:tempo/locator.dart';
import 'package:tempo/repositories/audio_capture/audio_capture_repository.dart';
import 'package:tempo/repositories/sound_repository.dart';

part 'tuner_cubit.freezed.dart';

class TunerCubit extends Cubit<TunerState> {
  TunerCubit({double tuningThresholdInDecibels = 40.0})
    : _tuningThresholdInDecibels = tuningThresholdInDecibels,
      super(
        TunerState.initializing(
          tuningThresholdInDecibels: tuningThresholdInDecibels,
        ),
      ) {
    _initialize();
  }

  final _audioCaptureRepository = locator.get<AudioCaptureRepository>();
  final _soundRepository = locator.get<SoundRepository>();

  final _tones = <NoteInterval>[];

  double? _calibrationOffset;
  double _currentDecibels = 0.0;
  final double _tuningThresholdInDecibels;
  bool _pauseTuning = false;

  Future<void> reload() => _initialize();

  Future<void> _initialize() async {
    try {
      if (!_audioCaptureRepository.isSupported) {
        emit(
          TunerState.unsupported(
            tuningThresholdInDecibels: _tuningThresholdInDecibels,
          ),
        );

        return;
      }

      _calibrationOffset = await _soundRepository.getCalibrationOffset();

      _tones
        ..clear()
        ..addAll(_soundRepository.getNotesIntervals());

      _audioCaptureRepository
        ..addListener(_audioListener)
        ..addListener(_meterListener);

      emit(
        TunerState.initialized(
          tuningThresholdInDecibels: _tuningThresholdInDecibels,
        ),
      );
    } on Exception {
      emit(
        TunerState.errorInitializing(
          tuningThresholdInDecibels: _tuningThresholdInDecibels,
          message: 'Error initializing tuner, try again',
        ),
      );
    }
  }

  var _tuningLoop = 0;
  NoteInterval? _lastKnownNoteInterval;
  double? _lastKnownPosition;

  late final _meterListener = AudioListener.meter(
    listener: (decibels) {
      _currentDecibels = decibels;
    },
    onError: _onCaptureError,
  );

  TunerState get _stoppedState => TunerState.stopped(
    calibrationOffset: _calibrationOffset,
    tuningThresholdInDecibels: _tuningThresholdInDecibels,
    lastKey: _lastKnownNoteInterval?.key,
    lastOctave: _lastKnownNoteInterval?.octave,
    lastPosition: _lastKnownPosition,
  );

  late final _audioListener = AudioListener.capture(
    listener: (buffer) async {
      if (isClosed) {
        return;
      }

      if (_pauseTuning) {
        return;
      }

      if (_currentDecibels < _tuningThresholdInDecibels) {
        emit(_stoppedState);
        return;
      }

      final pitch =
          (await _soundRepository.getPitchFromFloatBuffer(buffer)) +
          (_calibrationOffset ?? 0.0);

      if (pitch < _tones[0].frequency) {
        final stoppedAt = _tuningLoop;

        if (_tuningLoop == stoppedAt) {
          emit(_stoppedState);
        }

        return;
      }

      _tuningLoop += 1;

      // Get the closest frequency
      final closestFrequency =
          _tones
              .where((x) => pitch >= x.lowerLimit && pitch <= x.upperLimit)
              .firstOrNull;

      if (closestFrequency == null) {
        emit(_stoppedState);

        return;
      }

      _lastKnownNoteInterval = closestFrequency;

      // -1 is the lowerLimit.
      // 0 is in the middle (on tone).
      // 1 is the upperLimit.
      // position should take pitch and generate a value between -1 and 1
      final position =
          (pitch - closestFrequency.lowerLimit) /
              (closestFrequency.upperLimit - closestFrequency.lowerLimit) *
              2 -
          1;

      _lastKnownPosition = position;

      const tolerance = 0.2;

      final isTuned = position > -tolerance && position < tolerance;

      if (isTuned) {
        _pauseTuning = true;
      }

      Future.delayed(const Duration(seconds: 1), () {
        if (isClosed) {
          return;
        }

        _pauseTuning = false;
      });

      emit(
        TunerState.tuning(
          key: closestFrequency.key,
          octave: closestFrequency.octave,
          position: position,
          isTuned: isTuned,
          calibrationOffset: _calibrationOffset,
          tuningThresholdInDecibels: _tuningThresholdInDecibels,
        ),
      );
    },
    onError: _onCaptureError,
  );

  Future<void> updateCalibration() async {
    _calibrationOffset = await _soundRepository.getCalibrationOffset() ?? 0.0;

    emit(_stoppedState);
  }

  Future<void> clearCalibration() async {
    await _soundRepository.clearCalibrationOffset();

    _calibrationOffset = null;

    emit(_stoppedState);
  }

  void _onCaptureError(Object e) {
    // TODO.
    print(e);
  }

  @override
  Future<void> close() async {
    _audioCaptureRepository
      ..removeListener(_audioListener)
      ..removeListener(_meterListener);

    await super.close();
  }
}

@freezed
abstract class TunerState with _$TunerState {
  const factory TunerState.initializing({
    required double tuningThresholdInDecibels,
  }) = _Initializing;
  const factory TunerState.unsupported({
    required double tuningThresholdInDecibels,
  }) = _Unsupported;
  const factory TunerState.initialized({
    required double tuningThresholdInDecibels,
  }) = _Initialized;
  const factory TunerState.stopped({
    required double? calibrationOffset,
    required double tuningThresholdInDecibels,
    int? lastOctave,
    String? lastKey,
    double? lastPosition,
  }) = _Stopped;
  const factory TunerState.errorInitializing({
    required double tuningThresholdInDecibels,
    required String message,
  }) = _ErrorInitializing;
  const factory TunerState.tuning({
    required String key,
    required int octave,
    required double position,
    required bool isTuned,
    required double? calibrationOffset,
    required double tuningThresholdInDecibels,
  }) = _Tuning;
}
