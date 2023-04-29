import 'package:chur/src/repository/mylist_repository.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../model/mylist/mylist.dart';
import '../model/todo/SQL/todo.dart';
import '../repository/todo_repository.dart';

class MyListProvider with ChangeNotifier {
  late MyListRepository myListRepository;
  late String usercode;
  List<MyList> _items = [
    MyList('usercode','영단어 암기', 'p145 ~ p165', 0xffFFC93C, '', ''),
    MyList('usercode','수학 공부', 'p145 ~ p165', 0xffFFC93C, '', ''),
    MyList('usercode','영단어 암기', 'p145 ~ p165', 0xffFFC93C, '', ''),
  ];

  List<MyList> get _items2 => getTodo();


  //List<MyList> get mylist => myListRepository.getMyList();
  List<MyList> get mylist => _items;



  // void addItem(MyList item) {
  //   _items.add(item);
  //   notifyListeners();
  // }

  void addItem(String usercode, String title, String subtitle, int color, String data, String grade)
  {
    MyList newList = MyList(usercode, title, subtitle, color, data, grade);
    _items.add(newList);
  }

  List<MyList> getTodo()
  {
    TodoRepository todoRepository = TodoRepository();
    List<Todo> todoList = todoRepository.getTodosFromDb as List<Todo>;

    List<MyList> newList = [];
    for(Todo todo in todoList)
    {
      MyList list = MyList(usercode, todo.title!, todo.memo!, 1, todo.start_date!, todo.notify_before_min!);
      newList.add(list);
    }

    return newList;
  }
}
