import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import '../model/mylist/mylist.dart';

class MyListRepository {
  final String _baseUrl = 'https://jsonplaceholder.typicode.com';
  late final Database _database;
  String db_name = 'myList_database';

  Future<void> open(String date) async {
    final databasePath = await getDatabasesPath();
    db_name += '$date.db';
    final path = join(databasePath, db_name);

    _database = await openDatabase(
      path,
      version: 1,
        onCreate: _onCreate,
        onUpgrade: _onUpgrade
    );
  }

  Future<void> _onCreate(Database db, int version)
  async {
    db.execute('''
          CREATE TABLE myLists(
            usercode TEXT PRIMARY KEY,
            title TEXT,
            subtitle TEXT,
            color INTEGER,
            data TEXT,
            grade TEXT
          )
        ''');
  }

  Future<void> _onUpgrade(Database db, int oldVersion, int newVersion) async {
    if (oldVersion < newVersion) {
      db.execute('ALTER TABLE users ADD COLUMN data TEXT');
    }
  }

  Future<List<MyList>> fetchMyLists() async {
    final response = await http.get(Uri.parse('$_baseUrl/feedback'));

    if (response.statusCode == 200) {
      final jsonList = json.decode(response.body) as List<dynamic>;
      final myLists = jsonList.map((json) => MyList.fromJson(json)).toList();

      //서버에서 받아온 정보를 내부 저장소에 저장
      await _database.transaction((txn) async {
        for (final myList in myLists) {
          await txn.insert('myLists', myList.toMap(),
              conflictAlgorithm: ConflictAlgorithm.ignore);
        }
      });

      return myLists;
    } else {
      throw Exception(response.statusCode);
    }
  }

  Future<void> insertMyList(MyList myList) async {
    await _database.insert('myLists', myList.toMap());
  }

  Future<void> updateMyList(MyList myList) async {
    await _database.update(
      'myLists',
      myList.toMap(),
      where: 'data = ?',
      whereArgs: [myList.data],
    );
  }

  Future<void> deleteMyList(String data) async {
    await _database.delete(
      'myLists',
      where: 'data = ?',
      whereArgs: [data],
    );
  }

  // Future<List<MyList>> getMyListsFromDb() async {
  //   final result = await _database.query('myLists');
  //
  //   final myLists = result.map((e) => MyList.fromMap(e)).toList();
  //   return myLists;
  // }



  List<MyList> getMyList() {

    // 데이터 조회
    final List<Map<String, dynamic>> maps = _database.query('myLists') as List<Map<String, dynamic>>;

    // 맵을 MyList 객체로 변환
    return List.generate(maps.length, (i) {
      return MyList(
          usercode : maps[i]['usercode'],
          title : maps[i]['title'],
          subtitle : maps[i]['subtitle'],
          color : maps[i]['color'],
          data : maps[i]['data'],
          grade : maps[i]['grade']
      );
    });
  }

}