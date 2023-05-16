import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../model/todo/SQL/todo.dart';
import '../repository/todo_repository.dart';

class TodoProvider with ChangeNotifier {
  TodoRepository todoRepository = TodoRepository();
  late String usercode;

  Future<List<Todo>> get mytodo => todoRepository.getTodosFromDb();
  static List<Todo> _items = [];

  String title = "일정이 존재하지 않습니다.";


  void find(int year, int month, int day) async
  {
    print("결과값1: ");
    _items = await mytodo;

    String date = year.toString();
    date += "-";
    if(month < 10)
    {
      date +="0";
    }
    date += month.toString();
    date += "-";
    date += day.toString();
    String a = _items.length.toString();
    print("결과값: &a");
    for(Todo todo in _items)
    {

      if(todo.start_date!.contains(date))
      {

        title = todo.title!;
        notifyListeners();
      }
    }
  }

  void addItem(int no, String title, String category_no, String start_date, String rep_by, String end_date, String in_checklist, String memo, String notify_before_min)
  {
    //_items = await mytodo;
    Todo newList = Todo(no: no, title: title, category_no: category_no, start_date: start_date, rep_by: rep_by, end_date: end_date, in_checklist: in_checklist, memo: memo, notify_before_min: notify_before_min);
    _items.add(newList);
    todoRepository.insertTodos(_items);

    //notifyListeners();

  }

}
