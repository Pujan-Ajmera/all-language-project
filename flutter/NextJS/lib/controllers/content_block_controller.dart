import '../database/database_helper.dart';
import '../models/content_block.dart';

class ContentBlockController {
  final DatabaseHelper dbHelper;

  ContentBlockController(this.dbHelper);

  Future<List<ContentBlock>> getContentBlocksByConcept(int conceptId) async {
    final db = await dbHelper.database;
    final List<Map<String, dynamic>> maps = await db.query(
      'content_blocks',
      where: 'concept_id = ?',
      whereArgs: [conceptId],
      orderBy: 'id ASC',
    );
    return List.generate(maps.length, (i) {
      return ContentBlock.fromMap(maps[i]);
    });
  }
}