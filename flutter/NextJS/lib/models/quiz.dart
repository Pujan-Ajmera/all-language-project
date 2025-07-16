class Quiz {
  final int id;
  final int conceptId;
  final String title;

  Quiz({
    required this.id,
    required this.conceptId,
    required this.title,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'concept_id': conceptId,
      'title': title,
    };
  }

  factory Quiz.fromMap(Map<String, dynamic> map) {
    return Quiz(
      id: map['id'],
      conceptId: map['concept_id'],
      title: map['title'],
    );
  }
}