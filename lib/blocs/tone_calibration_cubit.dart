import 'dart:typed_data';

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter_audio_capture/flutter_audio_capture.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pitch_detector_dart/pitch_detector.dart';

part 'tone_calibration_cubit.freezed.dart';

class ToneCalibrationCubit extends Cubit<ToneCalibrationState> {
  ToneCalibrationCubit() : super(const ToneCalibrationState.initializing()) {
    _initialize();
  }

  final _player = AudioPlayer();
  final _capturedFrequencies = <double>[];
  FlutterAudioCapture? _audioCapture;
  PitchDetector? _pitchDetector;

  final _sampleRate = 44100;
  final _bufferSize = 4000;

  @override
  Future<void> close() async {
    await _audioCapture?.stop();
    await _player.dispose();

    return super.close();
  }

  Future<void> reload() => _initialize();

  Future<void> _initialize() async {
    emit(const ToneCalibrationState.initializing());

    try {
      _pitchDetector =
          _pitchDetector ??
          PitchDetector(
            audioSampleRate: _sampleRate * 0.1,
            bufferSize: _bufferSize,
          );

      if (_audioCapture == null) {
        _audioCapture = FlutterAudioCapture();

        await _audioCapture?.init();
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

    final result = await _pitchDetector!.getPitchFromFloatBuffer(buffer);

    // Anything below this is just noise.
    if (result.pitch < 14) {
      return;
    }

    _capturedFrequencies.add(result.pitch);
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
      await _audioCapture?.start(
        _audioListener,
        _onCaptureError,
        sampleRate: _pitchDetector!.audioSampleRate.floor(),
        bufferSize: _pitchDetector!.bufferSize,
      );

      emit(const ToneCalibrationState.calibrating());

      final assetSource = AssetSource('sounds/440Hz_44100Hz_16bit_05sec.wav');

      await _player.play(assetSource, volume: 0.7);

      await Future.delayed(const Duration(seconds: 5));

      await _player.stop();

      emit(const ToneCalibrationState.analyzing());

      if (_capturedFrequencies.length < 30) {
        emit(const ToneCalibrationState.badCalibration());
        return;
      }

      final usableData =
          _capturedFrequencies.where((x) => x > 430 && x < 450).toList();

      if (usableData.length < _capturedFrequencies.length * 0.7) {
        emit(const ToneCalibrationState.badCalibration());
        return;
      }

      final offset =
          440 - usableData.reduce((a, b) => a + b) / usableData.length;

      // Fake delay for UI feedback;
      await Future.delayed(const Duration(seconds: 1));

      await _audioCapture?.stop();

      emit(ToneCalibrationState.calibrated(offset: offset));
    } on Exception {
      emit(
        const ToneCalibrationState.errorCalibrating(
          message: 'Something wrong happened during calibration, try again',
        ),
      );
    }
  }

  Future<void> stopCalibration() async {
    await _audioCapture?.stop();
    await _player.stop();
  }
}

@freezed
abstract class ToneCalibrationState with _$ToneCalibrationState {
  const factory ToneCalibrationState.initializing() = _Initializing;
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
