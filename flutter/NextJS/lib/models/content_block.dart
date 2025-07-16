class ContentBlock {
  final int id;
  final int conceptId;
  final String type;
  final String content;

  ContentBlock({
    required this.id,
    required this.conceptId,
    required this.type,
    required this.content,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'concept_id': conceptId,
      'type': type,
      'content': content,
    };
  }

  factory ContentBlock.fromMap(Map<String, dynamic> map) {
    return ContentBlock(
      id: map['id'],
      conceptId: map['concept_id'],
      type: map['type'],
      content: map['content'],
    );
  }
}