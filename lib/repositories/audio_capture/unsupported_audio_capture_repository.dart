import 'package:tempo/entities/audio_listener.dart';
import 'package:tempo/repositories/audio_capture/audio_capture_repository.dart';

class UnsupportedAudioCaptureRepositoryImpl extends AudioCaptureRepository {
  UnsupportedAudioCaptureRepositoryImpl() : super(bufferSize: 0, sampleRate: 0);

  @override
  bool get isSupported => false;

  @override
  // ignore: must_call_super
  Future<void> init() async {
    throw const UnsupportedAudioServiceException();
  }

  @override
  // ignore: must_call_super
  void addListener(AudioListener listener) {
    throw const UnsupportedAudioServiceException();
  }

  @override
  // ignore: must_call_super
  bool removeListener(AudioListener listener) {
    throw const UnsupportedAudioServiceException();
  }
}
