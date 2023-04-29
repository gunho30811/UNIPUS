import 'dart:convert';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:http/http.dart' as http;
import '../model/todo/SQL/todo.dart';

class TodoRepository
{
  static Database? _database;

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    final documentsDirectory = await getApplicationDocumentsDirectory();
    final path = join(documentsDirectory.path, 'todos.db');

    return await openDatabase(
      path,
      version: 1,
      onCreate: (db, version) async {
        await db.execute('''
          CREATE TABLE todos (
            no INTEGER PRIMARY KEY,
            title TEXT,
            category_no TEXT,
            start_date TEXT,
            start_date TEXT,
            end_date TEXT,
            rep_by TEXT,
            notify_before_min TEXT,
            memo TEXT,
            in_checklist TEXT
          )
        ''');

      },
    );
  }

  Future<List<Todo>?> fetchTodosFromAPI() async {
    final response = await http.get(Uri.parse('uri 주소'));

    if (response.statusCode == 200) {
      List jsonResponse = json.decode(response.body);
      return jsonResponse.map((todo) => Todo.fromMap(todo)).toList();
    } else {
      throw Exception('Failed to load todos from API');
    }
  }

  Future<void> insertTodos(List<Todo> todos) async {
    final db = await database;
    Batch batch = db.batch();

    for (var todo in todos) {
      batch.insert('todos', todo.toMap(), conflictAlgorithm: ConflictAlgorithm.replace);
    }

    await batch.commit(noResult: true);
  }

  Future<List<Todo>> getTodosFromDb() async {
    final db = await database;
    final List<Map<String, dynamic>> maps = await db.query('todos');

    return List.generate(maps.length, (i) {
      return Todo.fromMap(maps[i]);
    });
  }


}