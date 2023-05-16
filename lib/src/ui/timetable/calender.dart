import 'dart:math';

import 'package:chur/src/model/todo/SQL/todo.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:intl/intl.dart';

import '../../provider/mylist_provider.dart';
import '../../provider/todo_provider.dart';

//statefulWidget 은 앱의 상태가 변화 할 수 있는 위젯을 정의
class Calendar extends StatefulWidget {
  //Calendar 위젯의 생성자. 'key'라는 선택적 매개변수를 받고, StatefulWidget의 생성자로 전달
  const Calendar({Key? key}) : super(key: key);

  //_CalendarState클래스로 만든 _CalendarState 생성자를 createState()로 인스턴스를 생성
  @override
  _CalendarState createState() => _CalendarState();
}

//_CalendarState 클래스 선언 (달력의 포맷, 선택된 날짜, 이벤트 관리 매서드 포함)
class _CalendarState extends State<Calendar> {
  late CalendarFormat _calendarFormat;
  late DateTime _focusedDay;
  DateTime? _selectedDay;
  Map<DateTime, List<String>> _events = {};
  late TodoProvider provider;
  // double _calendarHeightRatio = 2.2;

  //initState() 메서드는 위젯의 초기 상태를 설정합니다. (_calendarFormat, _focusedDay,_selectedDay 을 초기화 하고 _calendarFormat을 폰트 높이에 따라 변경함)
  @override
  void initState() {
    super.initState();
    _calendarFormat = CalendarFormat.month;
    _focusedDay = DateTime.now();
    _selectedDay = DateTime.now();
    provider = TodoProvider();


    //WidgetsBinding.instance!.addPostFrameCallback() 메서드를 사용하여, 포스트 프레임 콜백을 등록, 화면레이아웃에 따라 화면의 높이를 계산
    WidgetsBinding.instance!.addPostFrameCallback((_) {
      final height = MediaQuery.of(context).size.height;
      if (height <= 460) {
        //setState() 메서드 호출로 변경사항을 즉시 적용
        setState(() {
          //높이가 460보다 작거나 같은 경우 _calendarFormat을 CalendarFormat.week로 변경함
          _calendarFormat = CalendarFormat.week;
        });
      }
    });
  }

  //달력에서 날짜를 선택할 때 호출되는 콜백 함수
  void _onDaySelected(DateTime selectedDay, DateTime focusedDay) {
    //isSameDay() 함수를 사용하여 이전에 선택한 날짜와 현재 선택된 날짜가 동일한 날짜인지 확인
    if (!isSameDay(_selectedDay, selectedDay)) {
      //날짜가 다르다면, focusedDay 변수를 새로운 값으로 업데이트
      setState(() {
        _selectedDay = selectedDay;
        _focusedDay = focusedDay;
      });
    }
  }

  //달력에서 특정 날짜를 클릭하거나, 이전/다음 달로 이동했을 때 해당 날짜에 등록된 이벤트 목록을 표시하는 데 사용
  List<String> _getEventsForDay(DateTime day) {
    //키 값은 DateTime 객체이고, _events 변수에서 day인자에 해당하는 값을 찾고 없으면 빈 리스트를 반환
    return _events[day] ?? [];
  }

  //선택된 날짜에 메모를 추가하는 기능을 수행
  void _addMemoToSelectedDay(String memo) {
    //선택된 날짜가 있는지 확인
    if (_selectedDay != null) {
      //provider.addItem(0, memo, "category_no", "2023-05-15", "rep_by", "2023-05-15", "in_checklist", "memo", "notify_before_min");
      //선택된 날짜에 등록된 이벤트 목록을 참조 null인 경우 빈 리스트를 생성 후 _events[_selectedDay!]할당
      if (_events[_selectedDay!] == null) {
        _events[_selectedDay!] = [];
      }
      setState(() {
        //리스트에 새로운 메모추가
        _events[_selectedDay!]!.add(memo);
        // 메모가 생기면 달력의 높이를 줄입니다.
      });
    }
  }

  //화면에 보이는 위젯 생성,반환
  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double calendarHeight = screenHeight * 0.65;
    double memoHeight = screenHeight * 0.35;

    if (_selectedDay != null && _getEventsForDay(_selectedDay!).length > 0) {
      calendarHeight = screenHeight * 0.5;
      memoHeight = screenHeight * 0.5;
    }
    //scaffold 위젯을 사용하여 앱의 전체 레이아웃을 구성
    return SafeArea(

      child: Scaffold(
        //appBar 속성은 상단의 앱바를 구성
        // appBar: AppBar(),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: calendarHeight,
                //TableCalendar 위젯을 사용하여 캘린더표기
                child:TableCalendar(
                  locale: 'en_US',
                  firstDay: DateTime.utc(2010, 10, 16),
                  lastDay: DateTime.utc(2030, 3, 14),
                  focusedDay: _focusedDay,
                  calendarFormat: _calendarFormat,
                  //높이 값
                  rowHeight: 25,

                  calendarBuilders: CalendarBuilders(
                    markerBuilder: (context, date, events) {
                      return Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: events.map((event) {
                          // 이벤트에 고유한 색상을 사용하려면 메모의 해시 코드를 기반으로 색상을 생성할 수 있습니다.
                          Color eventColor() => Color.fromARGB(
                            255,
                            event.hashCode % 256,
                            (event.hashCode * 13) % 256,
                            (event.hashCode * 37) % 256,
                          );

                          return Container(
                            margin: EdgeInsets.symmetric(horizontal: 1.0),
                            width: 6,
                            height: 6,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: eventColor(),
                            ),
                          );
                        }).toList(),
                      );
                    },
                  ),

                  headerStyle: HeaderStyle(
                    titleCentered: true,
                    titleTextFormatter: (date, locale) =>
                        DateFormat.MMMM(locale).format(date),
                    titleTextStyle: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20.0,
                    ),
                    leftChevronVisible: true,
                    rightChevronVisible: true,
                    formatButtonVisible: false,
                  ),
                  //저장된 _calendarFormat을 새로운 형식 format으로 변경 후 렌더링
                  onFormatChanged: (format) {
                    if (_calendarFormat != format) {
                      setState(() {
                        _calendarFormat = format;
                      });
                    }
                  },
                  //페이지 변경시 호출 되는 콜백 함수 정의
                  onPageChanged: (focusedDay) {
                    _focusedDay = focusedDay;
                  },
                  //선택된 날짜에 대한 조건을 설정하고 선택된 날짜가 변경 시 호출되는 콜백 함수를 정의
                  selectedDayPredicate: (day) => isSameDay(_selectedDay, day),
                  onDaySelected: _onDaySelected,
                  eventLoader: _getEventsForDay,
                ),
              ),
              const SizedBox(height: 8.0),

              //context, provider, child 고정적인 요소
              Container(
                height: memoHeight,
                //선택된 날짜에 대한 이벤트 목록을 표시
                child: ListView(
                  children: _selectedDay != null
                      ? _getEventsForDay(_selectedDay!).map((event) {
                    provider.find(_selectedDay!.year, _selectedDay!.month, _selectedDay!.day);
                    return ListTile(
                      title: Text(provider.title),
                    );
                  }).toList()
                      : [],
                ),
              ),
            ],
          ),
        ),
        //오른쪽 하단에 위치하는 FloatingActionButton을 정의

        floatingActionButton: FloatingActionButton(

          // 버튼을 누르면 비동기 함수를 정의
          onPressed: () async {
            //메모 입력을 위한 TextEditingController 객체 생성
            TextEditingController memoController = TextEditingController();
            // showDialog 함수 호출하고 대화 상자가 닫힐 때 까지 기다림
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
                  //대화상자에 취소
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: Text('Cancel'),
                  ),
                  //추가 버튼
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
          //+ 기호 표기
          child: Icon(Icons.add),
        ),
      ),
    );
  }
}
