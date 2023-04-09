import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class ScheduleDetail extends StatelessWidget {
  const ScheduleDetail({super.key});

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Container(
        width: screenWidth * 0.8,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              //상단 색상 표시

              height: 55,
              width: 7,
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
                children: [
                  Container(
                      //일정명
                      ),
                  Divider(
                    color: Color(0xffD4D5E8),
                  ),
                  Container(
                      //카테고리
                      ),
                  Divider(
                    color: Color(0xffD4D5E8),
                  ),
                  Container(
                      //시간, 날짜
                      ),
                  Divider(
                    color: Color(0xffD4D5E8),
                  ),
                  Container(
                      //반복 여부
                      ),
                  Divider(
                    color: Color(0xffD4D5E8),
                  ),
                  Container(
                      //알람 0분전
                      ),
                  Divider(
                    color: Color(0xffD4D5E8),
                  ),
                  Container(
                      //메모, 스크롤 가능
                      ),
                  Divider(
                    color: Color(0xffD4D5E8),
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
    );
  }
}
