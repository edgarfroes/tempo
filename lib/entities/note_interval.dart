class NoteInterval {
  NoteInterval({
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
