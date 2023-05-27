import 'package:flutter/material.dart';
import '../model/mylist/timeline.dart';
//해당 프로바이더 todo_provider와 합칠방안 모색
class TimeLineProvider with ChangeNotifier {
  List<TimeLine> _items = [
    TimeLine(
      startTime: DateTime(2023, 4, 1, 10, 0),
      endTime: DateTime(2023, 4, 1, 12, 0),
      color: Colors.blue,
    ),

  ];

  List<TimeLine> get items => _items;

  void addItem(TimeLine item) {
    _items.add(item);
    notifyListeners();
  }

  void removeItem(int index) {
    _items.removeAt(index);
    notifyListeners();
  }
}
double _calculateHeight(DateTime startTime, DateTime endTime) {
  final startHour = startTime.hour;
  final startMinute = startTime.minute;
  final endHour = endTime.hour;
  final endMinute = endTime.minute;
  final duration = Duration(
    hours: endHour - startHour,
    minutes: endMinute - startMinute,
  );
  final double startRatio = startHour / 24.0;
  final double durationRatio = duration.inMinutes / (24 * 60);
  final double height = 270 * startRatio + 270 * durationRatio;
  return height;
}