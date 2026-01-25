import 'dart:typed_data';

import 'package:freezed_annotation/freezed_annotation.dart';

abstract class AudioCaptureService {
  AudioCaptureService();

  late final int sampleRate;
  late final int bufferSize;
  late final void Function(Float32List obj) listener;
  late final void Function(Object e) onError;

  bool get isPlaying => _isPlaying;
  bool _isPlaying = false;

  bool get disposed => _disposed;
  bool _disposed = false;

  bool get isInitialized => _isInitialized;
  bool _isInitialized = false;

  bool get isSupported;

  @mustCallSuper
  @mustBeOverridden
  Future<void> init({required int bufferSize, required int sampleRate}) async {
    if (_disposed) {
      throw const CantUseDisposedAudioServiceException();
    }

    if (isInitialized) {
      return;
    }

    this.bufferSize = bufferSize;
    this.sampleRate = sampleRate;

    _isInitialized = true;
  }

  @mustCallSuper
  @mustBeOverridden
  Future<void> start({
    required void Function(Float32List obj) listener,
    required void Function(Object e) onError,
  }) async {
    if (_disposed) {
      throw const CantUseDisposedAudioServiceException();
    }

    this.listener = listener;
    this.onError = onError;

    _isPlaying = true;
  }

  @mustCallSuper
  @mustBeOverridden
  Future<void> stop() async {
    if (_disposed) {
      throw const CantUseDisposedAudioServiceException();
    }

    _isPlaying = false;
  }

  @mustCallSuper
  @mustBeOverridden
  Future<void> dispose() async {
    _disposed = true;
  }
}

class AudioCaptureServiceInitializationException implements Exception {
  AudioCaptureServiceInitializationException({this.ex, this.stackTrace});

  final Exception? ex;
  final StackTrace? stackTrace;
}

class AudioCaptureServiceStartException implements Exception {
  AudioCaptureServiceStartException({this.ex, this.stackTrace});

  final Exception? ex;
  final StackTrace? stackTrace;
}

class AudioCaptureServiceStopException implements Exception {
  AudioCaptureServiceStopException({this.ex, this.stackTrace});

  final Exception? ex;
  final StackTrace? stackTrace;
}

class AudioCaptureServiceDisposeException implements Exception {
  AudioCaptureServiceDisposeException({this.ex, this.stackTrace});

  final Exception? ex;
  final StackTrace? stackTrace;
}

class CantUseDisposedAudioServiceException implements Exception {
  const CantUseDisposedAudioServiceException();
}

class UnsupportedAudioServiceException implements Exception {
  const UnsupportedAudioServiceException();
}
