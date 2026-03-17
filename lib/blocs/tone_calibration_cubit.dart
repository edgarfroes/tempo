import 'dart:io';
import 'dart:typed_data';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:tempo/gen/assets.gen.dart';
import 'package:tempo/locator.dart';
import 'package:tempo/services/audio_capture/audio_capture_service.dart';
import 'package:tempo/services/audio_player/audio_player_service.dart';
import 'package:tempo/services/pitch_detector/pitch_detector_service.dart';

part 'tone_calibration_cubit.freezed.dart';

class ToneCalibrationCubit extends Cubit<ToneCalibrationState> {
  ToneCalibrationCubit() : super(const ToneCalibrationState.initializing()) {
    _initialize();
  }

  final _capturedFrequencies = <double>[];

  final _audioCaptureService = locator.get<AudioCaptureService>();
  final _pitchDetectorService = locator.get<PitchDetectorService>();
  final _player = locator.get<AudioPlayerService>();
  final _a1kHzHzFrequencyAudioSource = AudioPlayerSource.asset(
    Assets.frequencies.a1kHz,
  );
  final _frequency = 1000.0;
  final _minimumRequiredData = 30;

  @override
  Future<void> close() async {
    await _player.dispose(source: _a1kHzHzFrequencyAudioSource);

    return super.close();
  }

  Future<void> reload() => _initialize();

  Future<void> _initialize() async {
    try {
      emit(const ToneCalibrationState.initializing());

      if (!_audioCaptureService.isSupported) {
        emit(const ToneCalibrationState.unsupported());

        return;
      }

      emit(const ToneCalibrationState.waitingCalibration());
    } on Exception catch (_) {
      emit(
        const ToneCalibrationState.errorInitializing(
          message: 'Error initializing calibration, try again',
        ),
      );
    }
  }

  Future<void> _audioListener(Float32List obj) async {
    final buffer = Float64List.fromList(obj.cast<double>());

    final pitch = await _pitchDetectorService.getPitchFromFloatBuffer(buffer);

    stdout.write('Pitch calibration: $pitch...\r');

    // Anything below this is just noise.
    if (pitch < 14) {
      return;
    }

    _capturedFrequencies.add(pitch);
  }

  void _onCaptureError(Object e) {
    // TODO.
    print(e);
  }

  void displayInstructions() {
    emit(const ToneCalibrationState.displayingInstructions());
  }

  Future<void> startCalibration() async {
    try {
      await _audioCaptureService.start(
        listener: _audioListener,
        onError: _onCaptureError,
      );

      _capturedFrequencies.clear();

      emit(const ToneCalibrationState.calibrating());

      await _player.play(_a1kHzHzFrequencyAudioSource, volume: 1);

      await Future.delayed(const Duration(seconds: 5));

      await _player.stop(_a1kHzHzFrequencyAudioSource);

      await _audioCaptureService.stop();

      emit(const ToneCalibrationState.analyzing());

      if (_capturedFrequencies.length < _minimumRequiredData) {
        emit(const ToneCalibrationState.badCalibration());
        return;
      }

      final usableData =
          _capturedFrequencies
              .where((x) => x > _frequency - 10 && x < _frequency + 10)
              .toList();

      if (usableData.length < _capturedFrequencies.length * 0.7) {
        emit(const ToneCalibrationState.badCalibration());
        return;
      }

      final offset =
          _frequency - (usableData.reduce((a, b) => a + b) / usableData.length);

      _pitchDetectorService.calibrate(offset);

      // Fake delay for UI feedback;
      await Future.delayed(const Duration(seconds: 1));

      emit(ToneCalibrationState.calibrated(offset: offset));
    } on Exception {
      emit(
        const ToneCalibrationState.errorCalibrating(
          message: 'Something wrong happened during calibration, try again',
        ),
      );
    }
  }
}

@freezed
abstract class ToneCalibrationState with _$ToneCalibrationState {
  const factory ToneCalibrationState.initializing() = _Initializing;
  const factory ToneCalibrationState.unsupported() = _Unsupported;
  const factory ToneCalibrationState.errorInitializing({
    required String message,
  }) = _ErrorInitializing;
  const factory ToneCalibrationState.waitingCalibration() = _WaitingCalibration;
  const factory ToneCalibrationState.displayingInstructions() =
      _DisplayingInstructions;
  const factory ToneCalibrationState.calibrating() = _Calibrating;
  const factory ToneCalibrationState.analyzing() = _Analyzing;
  const factory ToneCalibrationState.badCalibration() = _BadCalibration;
  const factory ToneCalibrationState.errorCalibrating({
    required String message,
  }) = _ErrorCalibrating;
  const factory ToneCalibrationState.calibrated({required double offset}) =
      _Calibrated;
  const factory ToneCalibrationState.interrupted() = _CalibrationInterrupted;
}
