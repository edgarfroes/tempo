import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:get_it/get_it.dart';
import 'package:tempo/services/audio_capture/audio_capture_service.dart';
import 'package:tempo/services/audio_capture/mobile_audio_capture_service_impl.dart';
import 'package:tempo/services/audio_capture/unsupported_audio_capture_service.dart';
import 'package:tempo/services/audio_player/audio_player_service.dart';
import 'package:tempo/services/pitch_detector/pitch_detector_service.dart';

final locator = GetIt.I;

const _sampleRate = 44100;
const _bufferSize = 4000;

void setupLocator() {
  locator
    ..registerLazySingleton<AudioCaptureService>(
      () {
        if (kIsWeb) {
          // TODO: Implement web audio capture stream.
          // return WebAudioCaptureServiceImpl();

          return UnsupportedAudioCaptureServiceImpl();
        }

        if (Platform.isIOS || Platform.isAndroid) {
          return MobileAudioCaptureServiceImpl(
            bufferSize: _bufferSize,
            sampleRate: _sampleRate,
          );
        }

        return UnsupportedAudioCaptureServiceImpl();
      },
      dispose: (instance) {
        instance.dispose();
      },
    )
    ..registerLazySingleton<PitchDetectorService>(
      () => PitchDetectorServiceImpl(
        bufferSize: _bufferSize,
        sampleRate: _sampleRate,
      ),
    )
    ..registerLazySingleton<AudioPlayerService>(
      AudioPlayerServiceImpl.new,
      dispose: (instance) {
        instance.dispose();
      },
    );
}
