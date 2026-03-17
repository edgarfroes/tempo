import 'dart:typed_data';

import 'package:pitch_detector_dart/pitch_detector.dart';

abstract class PitchDetectorService {
  PitchDetectorService({required this.sampleRate, required this.bufferSize});

  final int sampleRate;
  final int bufferSize;

  Future<double> getPitchFromFloatBuffer(Float64List buffer);
  void calibrate(double offset);
}

final class PitchDetectorServiceImpl extends PitchDetectorService {
  PitchDetectorServiceImpl({
    required super.bufferSize,
    required super.sampleRate,
  });

  @override
  Future<double> getPitchFromFloatBuffer(Float64List buffer) async {
    final detection = (await PitchDetector(
      audioSampleRate: sampleRate * 0.1,
      bufferSize: bufferSize,
    ).getPitchFromFloatBuffer(buffer));

    return (detection.pitch * (detection.pitched ? 10 : 1)) + _offset;
  }

  double _offset = 0;

  @override
  void calibrate(double offset) {
    _offset = offset;
  }
}
