import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

ScheduleDetailPopup(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return ScheduleDetail();
    },
  );
}

class ScheduleDetail extends StatelessWidget {
  const ScheduleDetail({super.key});

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    return AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20), // 원하는 둥근 정도를 설정합니다.
      ),
      content: SingleChildScrollView(
        child: Container(
          width: screenWidth * 0.8,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                //상단 색상 표시
                height: 7,
                width: 150,
                decoration: BoxDecoration(
                  color: Colors.amber,
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(
                    width: 2,
                    color: Color.fromARGB(0, 98, 98, 98).withOpacity(0.5),
                  ),
                ),
              ),
              Container(
                width: screenWidth * 0.75,
                //본문내용
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                      //일정명
                      child: Text(
                        '영단어 암기',
                        style: TextStyle(
                            fontSize: 25, fontWeight: FontWeight.bold),
                      ),
                    ),
                    Divider(
                      color: Color(0xffD4D5E8),
                      thickness: 1,
                      indent: 15,
                      endIndent: 15,
                    ),
                    Container(
                        //카테고리
                        ),
                    Divider(
                      color: Color(0xffD4D5E8),
                      thickness: 1,
                      indent: 15,
                      endIndent: 15,
                    ),
                    Container(
                        //시간, 날짜
                        ),
                    Divider(
                      color: Color(0xffD4D5E8),
                      thickness: 1,
                      indent: 15,
                      endIndent: 15,
                    ),
                    Container(
                        //반복 여부
                        ),
                    Divider(
                      color: Color(0xffD4D5E8),
                      thickness: 1,
                      indent: 15,
                      endIndent: 15,
                    ),
                    Container(
                        //알람 0분전
                        ),
                    Divider(
                      color: Color(0xffD4D5E8),
                      thickness: 1,
                      indent: 15,
                      endIndent: 15,
                    ),
                    Container(
                        //메모, 스크롤 가능
                        ),
                    Divider(
                      color: Color(0xffD4D5E8),
                      thickness: 1,
                      indent: 15,
                      endIndent: 15,
                    ),
                    Container(
                        //체크리스트 추가 여부
                        ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      actions: <Widget>[
        TextButton(
          child: Text('Close'),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ],
    );
  }
}
