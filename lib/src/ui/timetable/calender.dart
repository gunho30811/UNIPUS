import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

//statefulWidget 은 앱의 상태가 변화 할 수 있는 위젯을 정의
class Calendar extends StatefulWidget {

  //Calendar 위젯의 생성자. 'key'라는 선택적 매개변수를 받고, StatefulWidget의 생성자로 전달
  const Calendar({Key? key}) : super(key: key);

  //_CalendarState클래스로 만든 _CalendarState 생성자를 createState()로 인스턴스를 생성
  @override
  _CalendarState createState() => _CalendarState();
}

class _CalendarState extends State<Calendar> {
  late CalendarFormat _calendarFormat;
  late DateTime _focusedDay;
  DateTime? _selectedDay;
  Map<DateTime, List<String>> _events = {};

  @override
  void initState() {
    super.initState();
    _calendarFormat = CalendarFormat.month;
    _focusedDay = DateTime.now();
    _selectedDay = DateTime.now();

    WidgetsBinding.instance!.addPostFrameCallback((_) {
      final height = MediaQuery.of(context).size.height;
      if (height <= 460) {
        setState(() {
          _calendarFormat = CalendarFormat.week;
        });
      }
    });
  }

  void _onDaySelected(DateTime selectedDay, DateTime focusedDay) {
    if (!isSameDay(_selectedDay, selectedDay)) {
      setState(() {
        _selectedDay = selectedDay;
        _focusedDay = focusedDay;
      });
    }
  }

  List<String> _getEventsForDay(DateTime day) {
    return _events[day] ?? [];
  }

  void _addMemoToSelectedDay(String memo) {
    if (_selectedDay != null) {
      if (_events[_selectedDay!] == null) {
        _events[_selectedDay!] = [];
      }
      setState(() {
        _events[_selectedDay!]!.add(memo);
      });
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Calendar"),
        centerTitle: true,
        actions: [
          PopupMenuButton<int>(
            itemBuilder: (context) => [
              for (var i = 1; i <= 12; i++)
                PopupMenuItem(
                  value: i,
                  child: Text(
                    "$i월",
                    textAlign: TextAlign.center,
                  ),
                ),
            ],
            onSelected: (value) {
              setState(() {
                _focusedDay = DateTime(DateTime.now().year, value);
              });
            },
          ),
        ],
      ),
      body: Column(
        children: [
          TableCalendar(
            headerStyle: HeaderStyle(
              // formatButtonVisible: false,
              titleCentered: true,
              leftChevronVisible: false,
              rightChevronVisible: false,
              titleTextStyle: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20.0,
              ),

            ),
            firstDay: DateTime.utc(2010, 10, 16),
            lastDay: DateTime.utc(2030, 3, 14),
            focusedDay: _focusedDay,
            calendarFormat: _calendarFormat,
            onFormatChanged: (format) {
              if (_calendarFormat != format) {
                setState(() {
                  _calendarFormat = format;
                });
              }
            },
            onPageChanged: (focusedDay) {
              _focusedDay = focusedDay;
            },
            selectedDayPredicate: (day) => isSameDay(_selectedDay, day),
            onDaySelected: _onDaySelected,
            eventLoader: _getEventsForDay,
          ),
          const SizedBox(height: 8.0),
          Expanded(
            child: ListView(
              children: _selectedDay != null
                  ? _getEventsForDay(_selectedDay!).map((event) {
                return ListTile(
                  title: Text(event),
                );
              }).toList()
                  : [],
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          TextEditingController memoController = TextEditingController();
          await showDialog(
            context: context,
            builder: (context) => AlertDialog(
              title: Text('Add Memo'),
              content: TextField(
                controller: memoController,
                decoration: InputDecoration(
                  labelText: 'Memo',
                ),
              ),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text('Cancel'),
                ),
                TextButton(
                  onPressed: () {
                    _addMemoToSelectedDay(memoController.text);
                    Navigator.of(context).pop();
                  },
                  child: Text('Add'),
                ),
              ],
            ),
          );
        },
        child: Icon(Icons.add),
      ),
    );
  }
}