import 'dart:io';
import 'dart:typed_data';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:tempo/entities/audio_listener.dart';
import 'package:tempo/locator.dart';
import 'package:tempo/repositories/audio_capture/audio_capture_repository.dart';
import 'package:tempo/repositories/audio_player_repository.dart';
import 'package:tempo/repositories/sound_repository.dart';

part 'tone_calibration_cubit.freezed.dart';

class ToneCalibrationCubit extends Cubit<ToneCalibrationState> {
  ToneCalibrationCubit() : super(const ToneCalibrationState.initializing()) {
    _initialize();
  }

  final _capturedFrequencies = <double>[];

  final _audioCaptureRepository = locator.get<AudioCaptureRepository>();
  final _soundRepository = locator.get<SoundRepository>();
  final _audioPlayerRepository = locator.get<AudioPlayerRepository>();
  final _minimumRequiredData = 30;

  @override
  Future<void> close() async {
    await _audioPlayerRepository.dispose1kHzTone();

    return super.close();
  }

  Future<void> reload() => _initialize();

  Future<void> _initialize() async {
    try {
      emit(const ToneCalibrationState.initializing());

      if (!_audioCaptureRepository.isSupported) {
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

  Future<void> _audioListener(Float32List buffer) async {
    final pitch = await _soundRepository.getPitchFromFloatBuffer(buffer);

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
      final listener = AudioListener.capture(
        listener: _audioListener,
        onError: _onCaptureError,
      );

      _audioCaptureRepository.addListener(listener);

      _capturedFrequencies.clear();

      emit(const ToneCalibrationState.calibrating());

      await _audioPlayerRepository.play1kHzTone();

      await Future.delayed(const Duration(seconds: 5));

      await _audioPlayerRepository.stop1kHzTone();

      _audioCaptureRepository.removeListener(listener);

      emit(const ToneCalibrationState.analyzing());

      if (_capturedFrequencies.length < _minimumRequiredData) {
        emit(const ToneCalibrationState.badCalibration());
        return;
      }

      const frequency = 1000.0;

      final usableData =
          _capturedFrequencies
              .where((x) => x > frequency - 10 && x < frequency + 10)
              .toList();

      if (usableData.length < _capturedFrequencies.length * 0.7) {
        emit(const ToneCalibrationState.badCalibration());
        return;
      }

      final offset =
          frequency - (usableData.reduce((a, b) => a + b) / usableData.length);

      await _soundRepository.saveCalibrationOffset(offset);

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
