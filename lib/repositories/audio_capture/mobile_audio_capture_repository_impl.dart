import 'package:flutter_audio_capture/flutter_audio_capture.dart';
import 'package:tempo/entities/audio_listener.dart';
import 'package:tempo/entities/frequency.dart';
import 'package:tempo/repositories/audio_capture/audio_capture_repository.dart';

final class MobileAudioCaptureRepositoryImpl extends AudioCaptureRepository {
  MobileAudioCaptureRepositoryImpl({
    required super.bufferSize,
    required super.sampleRate,
  });

  final _audioCapture = FlutterAudioCapture();

  @override
  bool get isSupported => true;

  @override
  Future<void> init() async {
    try {
      final isInitiated = await _audioCapture.init();

      if (isInitiated != true) {
        throw AudioCaptureServiceInitializationException();
      }
    } on Exception catch (ex, stackTrace) {
      throw AudioCaptureServiceInitializationException(
        ex: ex,
        stackTrace: stackTrace,
      );
    }

    try {
      await _audioCapture.start(
        (buffer) {
          if (_listeners.isEmpty) {
            return;
          }

          double? decibels;
          List<Frequency>? frequencies;

          for (final listener in _listeners) {
            try {
              listener.map(
                capture: (listener) {
                  listener.listener(buffer);
                },
                meter: (listener) async {
                  decibels = decibels ?? await getDecibelsFromVolumes(buffer);

                  listener.listener(decibels!);
                },
                spectrum: (listener) async {
                  frequencies =
                      frequencies ?? await getFrequenciesFromBuffer(buffer);

                  listener.listener(frequencies!);
                },
              );
            } on Exception catch (ex) {
              listener.onError(ex);
            }
          }
        },
        (Object error) {
          for (final listener in _listeners) {
            listener.onError(error);
          }
        },
        sampleRate: super.sampleRate,
        bufferSize: super.bufferSize,
      );
    } on Exception catch (ex, stackTrace) {
      throw AudioCaptureServiceStartException(ex: ex, stackTrace: stackTrace);
    }
  }

  @override
  void addListener(AudioListener listener) {
    if (_listeners.contains(listener)) {
      return;
    }

    _listeners.add(listener);
  }

  @override
  bool removeListener(AudioListener listener) {
    return _listeners.remove(listener);
  }

  final _listeners = <AudioListener>[];
}
