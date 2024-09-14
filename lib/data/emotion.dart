class Emotion{
  final int emojiIndex;
  final int level;
  final int stressLevel;
  final String note;

  Emotion(this.emojiIndex, this.level, this.stressLevel, this.note);

  Map<String, dynamic> toJson() {
    return {
      'emojiIndex': emojiIndex,
      'level': level,
      'stressLevel': stressLevel,
      'note': note,
    };
  }

  factory Emotion.fromJson(Map<String, dynamic> json) {
    return Emotion(
      json['emojiIndex'] as int,
      json['level'] as int,
      json['stressLevel'] as int,
      json['note'] as String,
    );
  }

  @override
  String toString() {
    return 'Emotion{emojiIndex: $emojiIndex, level: $level, stressLevel: $stressLevel, note: $note}';
  }
}