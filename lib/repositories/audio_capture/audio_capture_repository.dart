import 'dart:async';
import 'dart:math' as math;

import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:tempo/entities/audio_listener.dart';
import 'package:tempo/entities/frequency.dart';

abstract class AudioCaptureRepository {
  AudioCaptureRepository({required this.sampleRate, required this.bufferSize});
  final int sampleRate;
  final int bufferSize;
  bool get isSupported;

  @mustBeOverridden
  Future<void> init();

  @mustBeOverridden
  void addListener(AudioListener listener);

  @mustBeOverridden
  bool removeListener(AudioListener listener);
}

class AudioCaptureServiceInitializationException implements Exception {
  AudioCaptureServiceInitializationException({this.ex, this.stackTrace});

  final Exception? ex;
  final StackTrace? stackTrace;
}

class AudioCaptureServiceStartException implements Exception {
  AudioCaptureServiceStartException({this.ex, this.stackTrace});

  final Exception? ex;
  final StackTrace? stackTrace;
}

class AudioCaptureServiceStopException implements Exception {
  AudioCaptureServiceStopException({this.ex, this.stackTrace});

  final Exception? ex;
  final StackTrace? stackTrace;
}

class UnsupportedAudioServiceException implements Exception {
  const UnsupportedAudioServiceException();
}

Future<double> getDecibelsFromVolumes(Float32List buffer) {
  return compute<Float32List, double>((buffer) {
    double max = 0;

    for (final item in buffer) {
      if (item > max) {
        max = item;
      }
    }

    return getDecibels(max);
  }, buffer);
}

double getDecibels(double volume) {
  // max amplitude is 2^15
  final maxAmp = math.pow(2, 15) + 0.0;

  return 20 * math.log(maxAmp * volume) * math.log10e;
}

Future<List<Frequency>> getFrequenciesFromBuffer(Float32List buffer) {
  return compute<Float32List, List<Frequency>>((buffer) {
    final frequencies = <Frequency>[];

    for (var i = 0; i < buffer.length; i++) {
      final hertz = buffer[i];
      final decibels = getDecibels(buffer[i]);

      frequencies.add(Frequency(hertz: hertz, decibels: decibels));
    }

    return frequencies;
  }, buffer);
}
