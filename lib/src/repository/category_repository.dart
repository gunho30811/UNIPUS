import 'dart:convert';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:http/http.dart' as http;
import '../model/category/category.dart';

class CategoryRepository
{
  static Database? _database;

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    final documentsDirectory = await getApplicationDocumentsDirectory();
    final path = join(documentsDirectory.path, 'categorys.db');

    return await openDatabase(
      path,
      version: 1,
      onCreate: (db, version) async {
        await db.execute('''
          CREATE TABLE categorys (
            no INTEGER PRIMARY KEY,
            name TEXT,
            color INTEGER
          )
        ''');
      },
    );
  }

  Future<List<Category>?> fetchTodosFromAPI() async {
    final response = await http.get(Uri.parse('uri 주소'));

    if (response.statusCode == 200) {
      List jsonResponse = json.decode(response.body);
      return jsonResponse.map((category) => Category.fromMap(category)).toList();
    } else {
      throw Exception('Failed to load todos from API');
    }
  }

  Future<void> insertCategorys(List<Category> categorys) async {
    final db = await database;
    Batch batch = db.batch();

    for (var category in categorys) {
      batch.insert('categorys', category.toMap(), conflictAlgorithm: ConflictAlgorithm.replace);
    }

    await batch.commit(noResult: true);
  }

  Future<List<Category>> getCategorysFromDb() async {
    final db = await database;
    final List<Map<String, dynamic>> maps = await db.query('categorys');

    return List.generate(maps.length, (i) {
      return Category.fromMap(maps[i]);
    });
  }
}