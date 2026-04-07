import 'package:tempo/gen/assets.gen.dart';
import 'package:tempo/locator.dart';
import 'package:tempo/services/audio_player/audio_player_service.dart';

abstract class AudioPlayerRepository {
  Future<void> play440HzTone();
  Future<void> play1kHzTone();
  Future<void> stop440HzTone();
  Future<void> stop1kHzTone();
  Future<void> dispose1kHzTone();
  Future<void> dispose440HzTone();
}

final class AudioPlayerRepositoryImpl implements AudioPlayerRepository {
  final AudioPlayerService _player = locator.get<AudioPlayerService>();

  late final _a1kHzFrequencyAudioSource = AudioPlayerSource.asset(
    Assets.frequencies.a1kHz,
  );

  late final _a440HzFrequencyAudioSource = AudioPlayerSource.asset(
    Assets.frequencies.a440Hz,
  );

  @override
  Future<void> play1kHzTone() async {
    await _player.play(_a1kHzFrequencyAudioSource, volume: 1);
  }

  @override
  Future<void> play440HzTone() async {
    await _player.play(_a440HzFrequencyAudioSource, volume: 1);
  }

  @override
  Future<void> stop1kHzTone() async {
    await _player.stop(_a1kHzFrequencyAudioSource);
  }

  @override
  Future<void> stop440HzTone() async {
    await _player.stop(_a440HzFrequencyAudioSource);
  }

  @override
  Future<void> dispose1kHzTone() async {
    await _player.dispose(source: _a1kHzFrequencyAudioSource);
  }

  @override
  Future<void> dispose440HzTone() async {
    await _player.dispose(source: _a1kHzFrequencyAudioSource);
  }
}
