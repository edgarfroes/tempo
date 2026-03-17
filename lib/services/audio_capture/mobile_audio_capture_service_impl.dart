import 'dart:typed_data';

import 'package:flutter_audio_capture/flutter_audio_capture.dart';
import 'package:tempo/services/audio_capture/audio_capture_service.dart';

final class MobileAudioCaptureServiceImpl extends AudioCaptureService {
  MobileAudioCaptureServiceImpl({
    required super.bufferSize,
    required super.sampleRate,
  });

  final _audioCapture = FlutterAudioCapture();

  @override
  bool get isSupported => true;

  @override
  Future<void> init() async {
    if (super.disposed) {
      throw const CantUseDisposedAudioServiceException();
    }

    try {
      final isInitiated = await _audioCapture.init();

      if (isInitiated != true) {
        throw AudioCaptureServiceInitializationException();
      }

      await super.init();
    } on Exception catch (ex, stackTrace) {
      throw AudioCaptureServiceInitializationException(
        ex: ex,
        stackTrace: stackTrace,
      );
    }
  }

  @override
  Future<void> dispose() async {
    try {
      if (super.disposed) {
        return;
      }

      if (!super.isInitialized) {
        return;
      }

      await _stop();

      await super.dispose();
    } on Exception catch (ex, stackTrace) {
      throw AudioCaptureServiceDisposeException(ex: ex, stackTrace: stackTrace);
    }
  }

  Future<void> _stop() async {
    await _audioCapture.stop();

    // This lib need some time to stop the audio capture after stop
    // is called.
    await Future.delayed(const Duration(milliseconds: 500));
  }

  @override
  Future<void> start({
    required void Function(Float32List obj) listener,
    required void Function(Object e) onError,
  }) async {
    await super.start(listener: listener, onError: onError);

    try {
      if (!super.isInitialized) {
        return;
      }

      await _audioCapture.start(
        listener,
        onError,
        sampleRate: super.sampleRate,
        bufferSize: super.bufferSize,
      );
    } on Exception catch (ex, stackTrace) {
      throw AudioCaptureServiceStartException(ex: ex, stackTrace: stackTrace);
    }
  }

  @override
  Future<void> stop() async {
    try {
      await super.stop();

      await _stop();

      await _audioCapture.stop();
    } on Exception catch (ex, stackTrace) {
      throw AudioCaptureServiceStopException(ex: ex, stackTrace: stackTrace);
    }
  }
}
