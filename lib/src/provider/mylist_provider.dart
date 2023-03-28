import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../model/mylist/mylist.dart';

class MyListProvider with ChangeNotifier {
  List<MyList> _items = [
    MyList('영단어 암기', 'p145 ~ p165', 0xffFFC93C),
    MyList('수학 공부', 'p145 ~ p165', 0xffFFC93C),
    MyList('영단어 암기', 'p145 ~ p165', 0xffFFC93C),
  ];

  List<MyList> get mylist => _items;



  // void addItem(MyList item) {
  //   _items.add(item);
  //   notifyListeners();
  // }
}
