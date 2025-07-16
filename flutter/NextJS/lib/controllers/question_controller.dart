import '../database/database_helper.dart';
import '../models/question.dart';

class QuestionController {
  final DatabaseHelper dbHelper;

  QuestionController(this.dbHelper);

  Future<List<Question>> getQuestionsByQuiz(int quizId) async {
    final db = await dbHelper.database;
    final List<Map<String, dynamic>> maps = await db.query(
      'questions',
      where: 'quiz_id = ?',
      whereArgs: [quizId],
    );
    return List.generate(maps.length, (i) {
      return Question.fromMap(maps[i]);
    });
  }
}