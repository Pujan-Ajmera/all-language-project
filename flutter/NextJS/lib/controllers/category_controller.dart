import '../database/database_helper.dart';
import '../models/category.dart';

class CategoryController {
  final DatabaseHelper dbHelper;

  CategoryController(this.dbHelper);

  Future<List<Category>> getAllCategories() async {
    final db = await dbHelper.database;
    final List<Map<String, dynamic>> maps = await db.query('categories');
    return List.generate(maps.length, (i) {
      return Category.fromMap(maps[i]);
    });
  }

  Future<Category> getCategoryById(int id) async {
    final db = await dbHelper.database;
    final List<Map<String, dynamic>> maps = await db.query(
      'categories',
      where: 'id = ?',
      whereArgs: [id],
    );
    return Category.fromMap(maps.first);
  }
}