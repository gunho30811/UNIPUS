import 'package:chur/src/repository/mylist_repository.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../model/mylist/mylist.dart';

class MyListProvider with ChangeNotifier {
  late MyListRepository myListRepository;
  // List<MyList> _items = [
  //   MyList('usercode','영단어 암기', 'p145 ~ p165', 0xffFFC93C, "", ""),
  //   MyList('usercode','수학 공부', 'p145 ~ p165', 0xffFFC93C, "", ""),
  //   MyList('usercode','영단어 암기', 'p145 ~ p165', 0xffFFC93C, "", ""),
  // ];


  List<MyList> get mylist => myListRepository.getMyList();



  // void addItem(MyList item) {
  //   _items.add(item);
  //   notifyListeners();
  // }
}
