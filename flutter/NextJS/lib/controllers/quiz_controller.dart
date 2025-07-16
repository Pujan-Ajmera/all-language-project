import '../database/database_helper.dart';
import '../models/quiz.dart';

class QuizController {
  final DatabaseHelper dbHelper;

  QuizController(this.dbHelper);

  Future<List<Quiz>> getQuizzesByConcept(int conceptId) async {
    final db = await dbHelper.database;
    final List<Map<String, dynamic>> maps = await db.query(
      'quizzes',
      where: 'concept_id = ?',
      whereArgs: [conceptId],
    );
    return List.generate(maps.length, (i) {
      return Quiz.fromMap(maps[i]);
    });
  }

  Future<Quiz> getQuizById(int id) async {
    final db = await dbHelper.database;
    final List<Map<String, dynamic>> maps = await db.query(
      'quizzes',
      where: 'id = ?',
      whereArgs: [id],
    );
    return Quiz.fromMap(maps.first);
  }
}