import 'dart:typed_data';

import 'package:pitch_detector_dart/pitch_detector.dart';

abstract class PitchDetectorService {
  void init({required int bufferSize, required int sampleRate});
  Future<double> getPitchFromFloatBuffer(Float64List buffer);
}

final class PitchDetectorServiceImpl implements PitchDetectorService {
  late final PitchDetector _pitchDetector;

  var _isInitialized = false;

  @override
  void init({required int bufferSize, required int sampleRate}) {
    if (_isInitialized) {
      return;
    }

    _pitchDetector = PitchDetector(
      audioSampleRate: sampleRate * 0.1,
      bufferSize: bufferSize,
    );

    _isInitialized = true;
  }

  @override
  Future<double> getPitchFromFloatBuffer(Float64List buffer) async {
    return (await _pitchDetector.getPitchFromFloatBuffer(buffer)).pitch;
  }
}
