import 'dart:typed_data';

import 'package:tempo/services/audio_capture/audio_capture_service.dart';

class UnsupportedAudioCaptureServiceImpl extends AudioCaptureService {
  UnsupportedAudioCaptureServiceImpl();

  @override
  bool get disposed => true;

  @override
  bool get isSupported => false;

  @override
  // ignore: must_call_super
  Future<void> init({required int bufferSize, required int sampleRate}) async {
    throw const UnsupportedAudioServiceException();
  }

  @override
  // ignore: must_call_super
  Future<void> start({
    required void Function(Float32List obj) listener,
    required void Function(Object e) onError,
  }) async {
    throw const UnsupportedAudioServiceException();
  }

  @override
  // ignore: must_call_super
  Future<void> dispose() {
    throw const UnsupportedAudioServiceException();
  }

  @override
  // ignore: must_call_super
  Future<void> stop() {
    throw const UnsupportedAudioServiceException();
  }
}
