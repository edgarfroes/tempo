import 'dart:typed_data';

import 'package:tempo/entities/note_interval.dart';
import 'package:tempo/locator.dart';
import 'package:tempo/services/pitch_detector/pitch_detector_service.dart';
import 'package:tempo/services/storage/storage_service.dart';

abstract class SoundRepository {
  SoundRepository({required this.sampleRate});
  final int sampleRate;

  List<NoteInterval> getNotesIntervals();
  Future<void> saveCalibrationOffset(double offset);
  Future<double?> getCalibrationOffset();
  Future<void> clearCalibrationOffset();
  Future<double> getPitchFromFloatBuffer(Float32List buffer);
}

class SoundRepositoryImpl extends SoundRepository {
  SoundRepositoryImpl({required super.sampleRate});

  final _pitchDetectorService = locator.get<PitchDetectorService>();
  final _storageService = locator.get<StorageService>();
  static const String _calibrationOffsetKey = 'calibration_offset';

  @override
  Future<void> saveCalibrationOffset(double offset) async {
    await _storageService.save<double>(_calibrationOffsetKey, offset);
  }

  @override
  Future<double?> getCalibrationOffset() async {
    return await _storageService.get<double>(_calibrationOffsetKey);
  }

  @override
  Future<void> clearCalibrationOffset() async {
    await _storageService.remove(_calibrationOffsetKey);
  }

  @override
  Future<double> getPitchFromFloatBuffer(Float32List buffer) async {
    return await _pitchDetectorService.getPitchFromFloatBuffer(buffer);
  }

  @override
  List<NoteInterval> getNotesIntervals() {
    // All frequencies from C0 to B8, from lower to higher.
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

    final intervals = <NoteInterval>[];

    for (var i = 0; i < chromaticFrequencies.length; i++) {
      final mod = i % 12;

      final octave = (i / 12).floor();

      final key = switch (mod) {
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
        NoteInterval(
          key: key,
          octave: octave,
          frequency: frequency,
          lowerLimit: lowerLimit,
          upperLimit: upperLimit,
        ),
      );
    }

    return intervals;
  }
}
