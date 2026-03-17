import 'package:audioplayers/audioplayers.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'audio_player_service.freezed.dart';

abstract class AudioPlayerService {
  Future<void> play(AudioPlayerSource source, {double? volume});
  Future<void> stop(AudioPlayerSource source);
  Future<void> dispose({AudioPlayerSource? source});
}

final class AudioPlayerServiceImpl implements AudioPlayerService {
  final List<_AudioPlayerInstance> _instances = [];

  _AudioPlayerInstance _getPlayerInstance(AudioPlayerSource source) {
    final indexId = _instances.indexWhere((x) => x.source == source);

    if (indexId != -1) {
      return _instances[indexId];
    }

    final instance = _AudioPlayerInstance(
      player: AudioPlayer(),
      source: source,
    );

    _instances.add(instance);

    return instance;
  }

  @override
  Future<void> play(AudioPlayerSource source, {double? volume}) async {
    final instance = _getPlayerInstance(source);

    await instance.play(volume: volume);
  }

  @override
  Future<void> stop(AudioPlayerSource source) async {
    final instance = _getPlayerInstance(source);

    await instance.stop();
  }

  @override
  Future<void> dispose({AudioPlayerSource? source}) async {
    if (source != null) {
      final indexId = _instances.indexWhere((x) => x.source == source);

      if (indexId != -1) {
        final player = _instances[indexId];
        await player.dispose();
        _instances.removeAt(indexId);
      }

      return;
    }

    for (final item in _instances) {
      await item.dispose();
    }

    _instances.clear();
  }
}

@freezed
abstract class AudioPlayerSource with _$AudioPlayerSource {
  const factory AudioPlayerSource.asset(String path) = _Asset;
}

class _AudioPlayerInstance {
  final AudioPlayer player;
  final AudioPlayerSource source;

  _AudioPlayerInstance({required this.player, required this.source});

  Future<void> play({double? volume}) async {
    final source = this.source.map(
      asset: (data) {
        assert(data.path.isNotEmpty, 'Asset path cannot be empty');

        final paths = data.path.split('/');

        if (paths[0] == 'assets') {
          paths.removeAt(0);
        }

        return AssetSource(paths.join('/'));
      },
    );

    await player.play(source, volume: volume);
  }

  Future<void> stop() async {
    await player.stop();
  }

  Future<void> dispose() async {
    await player.stop();
    await player.release();
    await player.dispose();
  }
}
