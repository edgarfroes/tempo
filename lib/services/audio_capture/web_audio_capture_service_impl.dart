import 'dart:typed_data';

import 'package:tempo/services/audio_capture/audio_capture_service.dart';

final class WebAudioCaptureServiceImpl extends AudioCaptureService {
  WebAudioCaptureServiceImpl({
    required super.sampleRate,
    required super.bufferSize,
  });

  @override
  bool get isSupported => false;

  @override
  Future<void> init() {
    // TODO: implement init
    throw UnimplementedError();
  }

  @override
  Future<void> dispose() {
    // TODO: implement dispose
    throw UnimplementedError();
  }

  @override
  Future<void> start({
    required void Function(Float32List obj) listener,
    required void Function(Object e) onError,
  }) {
    // TODO: implement start
    throw UnimplementedError();
  }

  @override
  Future<void> stop() {
    // TODO: implement stop
    throw UnimplementedError();
  }
}
