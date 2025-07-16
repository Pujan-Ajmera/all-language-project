import '../database/database_helper.dart';
import '../models/concept.dart';

class ConceptController {
  final DatabaseHelper dbHelper;

  ConceptController(this.dbHelper);

  Future<List<Concept>> getConceptsByCategory(int categoryId) async {
    final db = await dbHelper.database;
    final List<Map<String, dynamic>> maps = await db.query(
      'concepts',
      where: 'category_id = ?',
      whereArgs: [categoryId],
    );
    return List.generate(maps.length, (i) {
      return Concept.fromMap(maps[i]);
    });
  }

  Future<Concept> getConceptById(int id) async {
    final db = await dbHelper.database;
    final List<Map<String, dynamic>> maps = await db.query(
      'concepts',
      where: 'id = ?',
      whereArgs: [id],
    );
    return Concept.fromMap(maps.first);
  }
}