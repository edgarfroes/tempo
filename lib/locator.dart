import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:get_it/get_it.dart';
import 'package:tempo/repositories/audio_capture/audio_capture_repository.dart';
import 'package:tempo/repositories/audio_capture/mobile_audio_capture_repository_impl.dart';
import 'package:tempo/repositories/audio_capture/unsupported_audio_capture_repository.dart';
import 'package:tempo/repositories/audio_player_repository.dart';
import 'package:tempo/repositories/sound_repository.dart';
import 'package:tempo/services/audio_player/audio_player_service.dart';
import 'package:tempo/services/pitch_detector/pitch_detector_service.dart';
import 'package:tempo/services/storage/storage_service.dart';

final locator = GetIt.I;

const _sampleRate = 44100;
const _bufferSize = 4000;

void setupLocator() {
  locator
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
    )
    ..registerLazySingleton<StorageService>(StorageServiceImpl.new)
    ..registerLazySingleton<AudioCaptureRepository>(() {
      if (kIsWeb) {
        // TODO: Implement web audio capture stream.
        // return WebAudioCaptureServiceImpl();

        return UnsupportedAudioCaptureRepositoryImpl();
      }

      if (Platform.isIOS || Platform.isAndroid) {
        return MobileAudioCaptureRepositoryImpl(
          bufferSize: _bufferSize,
          sampleRate: _sampleRate,
        );
      }

      return UnsupportedAudioCaptureRepositoryImpl();
    })
    ..registerLazySingleton<SoundRepository>(
      () => SoundRepositoryImpl(sampleRate: _sampleRate),
    )
    ..registerLazySingleton<AudioPlayerRepository>(
      AudioPlayerRepositoryImpl.new,
    );
}
