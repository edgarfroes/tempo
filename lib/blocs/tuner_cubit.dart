import 'dart:typed_data';

import 'package:flutter_audio_capture/flutter_audio_capture.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:pitch_detector_dart/pitch_detector.dart';

part 'tuner_cubit.freezed.dart';

class TunerCubit extends Cubit<TunerState> {
  TunerCubit() : super(const TunerState.initializing()) {
    _initialize();
  }

  final _sampleRate = 44100;
  final _bufferSize = 4000;
  var _calibrationOffset = 0.0;

  final chromaticFrequencies = <double>[
    16.35,
    17.32,
    18.35,
    19.45,
    20.60,
    21.83,
    23.12,
    24.50,
    25.96,
    27.50,
    29.14,
    30.87,
    32.70,
    34.65,
    36.71,
    38.89,
    41.20,
    43.65,
    46.25,
    49.00,
    51.91,
    55.00,
    58.27,
    61.74,
    65.41,
    69.30,
    73.42,
    77.78,
    82.41,
    87.31,
    92.50,
    98.00,
    103.83,
    110.00,
    116.54,
    123.47,
    130.81,
    138.59,
    146.83,
    155.56,
    164.81,
    174.61,
    185.00,
    196.00,
    207.65,
    220.00,
    233.08,
    246.94,
    261.63,
    277.18,
    293.66,
    311.13,
    329.63,
    349.23,
    369.99,
    392.00,
    415.30,
    440.00,
    466.16,
    493.88,
    523.25,
    554.37,
    587.33,
    622.25,
    659.25,
    698.46,
    739.99,
    783.99,
    830.61,
    880.00,
    932.33,
    987.77,
    1046.50,
    1108.73,
    1174.66,
    1244.51,
    1318.51,
    1396.91,
    1479.98,
    1567.98,
    1661.22,
    1760.00,
    1864.66,
    1975.53,
    2093.00,
    2217.46,
    2349.32,
    2489.02,
    2637.02,
    2793.83,
    2959.96,
    3135.96,
    3322.44,
    3520.00,
    3729.31,
    3951.07,
    4186.01,
    4434.92,
    4698.63,
    4978.03,
    5274.04,
    5587.65,
    5919.91,
    6271.93,
    6644.88,
    7040.00,
    7458.62,
    7902.13,
  ];

  FlutterAudioCapture? _audioCapture;
  PitchDetector? _pitchDetector;

  final intervals = <_TuneInterval>[];

  Future<void> reload() => _initialize();

  Future<void> _initialize() async {
    try {
      _pitchDetector =
          _pitchDetector ??
          PitchDetector(
            audioSampleRate: _sampleRate * 0.1,
            bufferSize: _bufferSize,
          );

      await _startAudioCapture();

      for (var i = 0; i < chromaticFrequencies.length; i++) {
        final mod = i % 12;

        final tune = switch (mod) {
          0 => 'C',
          1 => 'C#',
          2 => 'D',
          3 => 'D#',
          4 => 'E',
          5 => 'F',
          6 => 'F#',
          7 => 'G',
          8 => 'G#',
          9 => 'A',
          10 => 'A#',
          11 => 'B',
          _ => '',
        };

        final frequency = chromaticFrequencies[i];

        final lowerLimit =
            i == 0
                ? frequency - ((chromaticFrequencies[i + 1] - frequency) / 2)
                : frequency - ((frequency - chromaticFrequencies[i - 1]) / 2);

        final upperLimit =
            i == chromaticFrequencies.length - 1
                ? frequency + ((frequency - chromaticFrequencies[i - 1]) / 2)
                : frequency + ((chromaticFrequencies[i + 1] - frequency) / 2);

        intervals.add(
          _TuneInterval(
            key: tune,
            octave: (i / 12).floor(),
            frequency: frequency,
            lowerLimit: lowerLimit,
            upperLimit: upperLimit,
          ),
        );
      }

      emit(const TunerState.initialized());
    } on Exception catch (_) {
      emit(
        const TunerState.errorInitializing(
          message: 'Error initializing tuner, try again',
        ),
      );
    }
  }

  Future<void> _startAudioCapture() async {
    await _audioCapture?.stop();

    _audioCapture = FlutterAudioCapture();

    await _audioCapture?.init();

    await _audioCapture?.start(
      _audioListener,
      _onCaptureError,
      sampleRate: _pitchDetector!.audioSampleRate.floor(),
      bufferSize: _pitchDetector!.bufferSize,
    );
  }

  @override
  Future<void> close() async {
    await _audioCapture!.stop();

    return super.close();
  }

  var _tuningLoop = 0;

  Future<void> _audioListener(Float32List obj) async {
    final buffer = Float64List.fromList(obj.cast<double>());

    final result = await _pitchDetector!.getPitchFromFloatBuffer(buffer);

    final pitch = result.pitch + _calibrationOffset;

    if (pitch < chromaticFrequencies[0]) {
      final stoppedAt = _tuningLoop;

      await Future.delayed(const Duration(milliseconds: 500));

      if (_tuningLoop == stoppedAt) {
        emit(const TunerState.stopped());
      }

      return;
    }

    _tuningLoop += 1;

    // Get the closest frequency
    final closestFrequency =
        intervals
            .where((x) => pitch >= x.lowerLimit && pitch <= x.upperLimit)
            .firstOrNull;

    if (closestFrequency == null) {
      emit(const TunerState.stopped());
      return;
    }

    // -1 is the lower limit.
    // 0 is in the middle (on tone).
    // 1 is the upper limit.

    final interval = closestFrequency.upperLimit - closestFrequency.lowerLimit;
    final diff = pitch - closestFrequency.frequency;

    final position = diff / interval;

    final isWithinTuningTolerance = position > -0.01 && position < 0.01;

    // TODO: If is within tolerance, add a haptic feedback.

    emit(
      TunerState.tuning(
        key: closestFrequency.key,
        octave: closestFrequency.octave,
        position: position,
        isTuned: isWithinTuningTolerance,
      ),
    );
  }

  void setCalibration(double offset) {
    _calibrationOffset = offset;

    emit(const TunerState.stopped());
  }

  void _onCaptureError(Object e) {
    print(e);
  }

  Future<void> pauseAudioCapture() async {
    await _audioCapture?.stop();
  }

  Future<void> startAudioCapture() async {
    await _startAudioCapture();
  }
}

@freezed
abstract class TunerState with _$TunerState {
  const factory TunerState.initializing() = _Initializing;
  const factory TunerState.initialized() = _Initialized;
  const factory TunerState.stopped() = _Stopped;
  const factory TunerState.errorInitializing({required String message}) =
      _ErrorInitializing;
  const factory TunerState.tuning({
    required String key,
    required int octave,
    required double position,
    required bool isTuned,
  }) = _Tuning;
}

class _TuneInterval {
  _TuneInterval({
    required this.key,
    required this.octave,
    required this.frequency,
    required this.lowerLimit,
    required this.upperLimit,
  });

  final String key;
  final int octave;
  final double frequency;
  final double lowerLimit;
  final double upperLimit;
}
