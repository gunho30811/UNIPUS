import 'package:flutter/material.dart';
import '../model/catbox/list_grade.dart';

class ItemProvider extends ChangeNotifier {
  List<Item> _items = [
    Item(
        name: 'Item A1',
        date: DateTime(2023, 3, 10),
        category: 'Category 3',
        grade: 'good'),
    Item(
        name: 'Item A1',
        date: DateTime(2023, 3, 10),
        category: 'Category 1',
        grade: 'excellent'),
    Item(
        name: 'Item A1',
        date: DateTime(2023, 3, 10),
        category: 'Category 1',
        grade: 'excellent'),
    Item(
        name: 'Item A1',
        date: DateTime(2023, 3, 10),
        category: 'Category 2',
        grade: 'excellent'),
    Item(
        name: 'Item A1',
        date: DateTime(2023, 3, 10),
        category: 'Category 1',
        grade: 'good'),
    Item(
        name: 'Item A1',
        date: DateTime(2023, 3, 10),
        category: 'Category 1',
        grade: 'bad'),
    Item(
        name: 'Item A1',
        date: DateTime(2023, 3, 10),
        category: 'Category 2',
        grade: 'good'),
    Item(
        name: 'Item A1',
        date: DateTime(2023, 3, 10),
        category: 'Category 1',
        grade: 'good'),
    Item(
        name: 'Item A1',
        date: DateTime(2023, 3, 10),
        category: 'Category 1',
        grade: 'good'),
    Item(
        name: 'Item A1',
        date: DateTime(2023, 3, 10),
        category: 'Category 2',
        grade: 'bad'),
  ];

  List<Item> get items => _items;

  void addItem(Item item) {
    _items.add(item);
    notifyListeners();
  }

  List<Item> itemsByCategory(String category) {
    return _items.where((item) => item.category == category).toList();
  }

  List<Item> itemsByMonth(int month) {
    return _items.where((item) => item.date.month == month).toList();
  }
}
