import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import '../setting/popup.dart';

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
                    width: 1,
                    color: Color.fromARGB(0, 98, 98, 98).withOpacity(0.5),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                width: screenWidth * 0.75,
                //본문내용
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            '영단어 암기',
                            style: TextStyle(
                                fontSize: 25, fontWeight: FontWeight.bold),
                          ),
                          IconButton(
                            icon: Icon(Icons.delete_outlined),
                            onPressed: () {
                              showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return AlertDialog(
                                    title: Text('확인'),
                                    content: Text('정말 지우시겠습니까?'),
                                    actions: [
                                      TextButton(
                                        child: Text('아니오'),
                                        onPressed: () {
                                          Navigator.of(context).pop();
                                        },
                                      ),
                                      TextButton(
                                        child: Text('예'),
                                        onPressed: () {
                                          // TODO: '지우기' 작업을 여기에 구현하세요.
                                          Navigator.of(context).pop();
                                        },
                                      ),
                                    ],
                                  );
                                },
                              );
                            },
                          ),
                        ],
                      ),
                    ),
                    Divider(
                      color: Color(0xffD4D5E8),
                      thickness: 1,
                    ),
                    Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            '카테고리',
                            style: TextStyle(fontSize: 16),
                          ),
                          Row(
                            children: [
                              Text(
                                '영어공부',
                                style: TextStyle(fontSize: 16),
                              ),
                              SizedBox(width: 10),
                              Container(
                                width: 20,
                                height: 20,
                                decoration: BoxDecoration(
                                    color: Colors.red, shape: BoxShape.circle),
                              )
                            ],
                          )
                        ],
                      ),
                      //카테고리
                    ),
                    Divider(
                      color: Color(0xffD4D5E8),
                      thickness: 1,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '13:00~14:00 (2hr)',
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              '2022.12.22 Thu',
                              style:
                                  TextStyle(fontSize: 14, color: Colors.grey),
                            ),
                            TimePickerButton(),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              '2022.12.22 Thu',
                              style:
                                  TextStyle(fontSize: 14, color: Colors.grey),
                            ),
                            TimePickerButton1(),
                          ],
                        ),
                      ],
                    ),
                    Divider(
                      color: Color(0xffD4D5E8),
                      thickness: 1,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          '반복',
                          style: TextStyle(fontSize: 14),
                        ),
                        Text(
                          '매일',
                          style: TextStyle(fontSize: 14),
                        ),
                      ],
                    ),
                    Divider(
                      color: Color(0xffD4D5E8),
                      thickness: 1,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          '알람',
                          style: TextStyle(fontSize: 14),
                        ),
                        Text(
                          '5분 전',
                          style: TextStyle(fontSize: 14),
                        ),
                      ],
                    ),
                    Divider(
                      color: Color(0xffD4D5E8),
                      thickness: 1,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          '메모',
                          style: TextStyle(fontSize: 14),
                        ),
                        Text(
                          '72p 까지 끝내기',
                          style: TextStyle(fontSize: 14),
                        ),
                      ],
                    ),
                    Divider(
                      color: Color(0xffD4D5E8),
                      thickness: 1,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          '체크리스트 추가',
                          style: TextStyle(fontSize: 14),
                        ),
                        Text(
                          '72p 까지 끝내기',
                          style: TextStyle(fontSize: 14),
                        ),
                      ],
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
