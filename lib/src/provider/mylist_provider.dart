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
    MyList(usercode: 'usercode',  title: '영단어 암기', subtitle: 'p145 ~ p165', color: 0xffFFC93C, data: '', grade: ''),
    MyList(usercode: 'usercode',  title: '수학 공부', subtitle: 'p145 ~ p165', color: 0xffFFC93C, data: '', grade: ''),
    MyList(usercode: 'usercode',  title: '영단어 암기', subtitle: 'p145 ~ p165', color: 0xffFFC93C, data: '', grade: ''),
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
    MyList newList = MyList(usercode: usercode, title: title, subtitle: subtitle, color: color, data: data, grade: grade);
    _items.add(newList);
  }

  List<MyList> getTodo()
  {
    TodoRepository todoRepository = TodoRepository();
    List<Todo> todoList = todoRepository.getTodosFromDb as List<Todo>;

    List<MyList> newList = [];
    for(Todo todo in todoList)
    {
      MyList list = MyList(usercode: usercode, title: todo.title!, subtitle: todo.memo!, color: 1, data: todo.start_date!, grade: todo.notify_before_min!);
      newList.add(list);
    }

    return newList;
  }
}
