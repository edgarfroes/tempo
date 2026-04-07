import 'dart:typed_data';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:tempo/entities/frequency.dart';

part 'audio_listener.freezed.dart';

@freezed
abstract class AudioListener with _$AudioListener {
  const AudioListener._();

  factory AudioListener.meter({
    required Function(double decibels) listener,
    required Function(Object e) onError,
  }) = _Meter;

  factory AudioListener.capture({
    required Function(Float32List buffer) listener,
    required Function(Object e) onError,
  }) = _Capture;

  factory AudioListener.spectrum({
    required Function(List<Frequency> spectrum) listener,
    required Function(Object e) onError,
  }) = _Spectrum;
}
