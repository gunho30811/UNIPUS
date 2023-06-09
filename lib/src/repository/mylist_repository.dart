import 'dart:convert';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:http/http.dart' as http;

import '../model/mylist/mylist.dart';

class MyListRepository {
  static Database? _database;

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    final documentsDirectory = await getApplicationDocumentsDirectory();
    final path = join(documentsDirectory.path, 'mylists.db');

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
        String? usercode;

        String? title;
        String? subtitle;
        int? color;
        String? data;
        String? grade;
      },
    );
  }

  Future<List<MyList>?> fetchTodosFromAPI() async {
    final response = await http.get(Uri.parse('uri 주소'));

    if (response.statusCode == 200) {
      List jsonResponse = json.decode(response.body);
      return jsonResponse.map((mylist) => MyList.fromMap(mylist)).toList();
    } else {
      throw Exception('Failed to load todos from API');
    }
  }

  Future<void> insertTodos(List<MyList> todos) async {
    final db = await database;
    Batch batch = db.batch();

    for (var todo in todos) {
      batch.insert('mylists', todo.toMap(), conflictAlgorithm: ConflictAlgorithm.replace);
    }

    await batch.commit(noResult: true);
  }

  Future<List<MyList>> getTodosFromDb() async {
    final db = await database;
    final List<Map<String, dynamic>> maps = await db.query('mylists');

    return List.generate(maps.length, (i) {
      return MyList.fromMap(maps[i]);
    });
  }

}