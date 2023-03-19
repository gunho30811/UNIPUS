import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'box.dart';

class SettingHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Color(0xffF2F2F7),
      body: ListView(
        // ListView 또는 Column 같은 위젯 사용
        children: [
          Container(
            width: screenWidth * 1,
            child: Column(
              children: [
                BoxPopup(
                    icon: Icon(Icons.settings),
                    subject: '설정하기',
                    subjectTextStyle: TextStyle(
                        fontSize: 25,
                        color: Colors.black,
                        fontWeight: FontWeight.bold)),
                SizedBox(
                  height: screenHeight * 0.01,
                ),
                WhiteBox(
                  child: Column(
                    children: [
                      BoxPopup(
                        subject: '이름',
                        buttonName: '수정하기',
                        subjectTextStyle: TextStyle(
                            fontSize: 20,
                            color: Colors.black,
                            fontWeight: FontWeight.bold),
                      ),
                      CustomDivider(),
                      Container(
                        height: screenHeight * 0.07,
                        padding: EdgeInsets.symmetric(
                            horizontal: screenWidth * 0.01,
                            vertical: screenHeight * 0.01),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Icon(Icons.notifications_none_outlined),
                                SizedBox(
                                  width: 15,
                                ),
                                Text(
                                  '알림설정',
                                  style: TextStyle(fontSize: 16),
                                ),
                              ],
                            ),
                            CupertinoSwitch(
                              value: true,
                              activeColor: Color(0xff34C759),
                              // set the thumb color to blue
                              trackColor: Colors.grey[300],
                              // set the track color to light grey
                              onChanged: (value) {
                                // toggle notifications on/off
                              },
                            ),
                          ],
                        ),
                      ),
                      CustomDivider(),
                      BoxPopup(
                        icon: Icon(Icons.palette_outlined),
                        subject: '카테고리 설정',
                        buttonName: '설정',
                        subjectTextStyle:
                            TextStyle(fontSize: 15, color: Colors.black),
                      ),
                      CustomDivider(),
                      BoxPopup(
                          icon: Icon(Icons.access_time),
                          subject: '주간시간표 시간 설정',
                          subjectTextStyle:
                              TextStyle(fontSize: 15, color: Colors.black)),
                    ],
                  ),
                ),
                WhiteBox(
                  child: Column(
                    children: [
                      BoxPopup(
                          icon: Icon(Icons.person_outlined),
                          subject: '유저코드',
                          subjectTextStyle:
                              TextStyle(fontSize: 15, color: Colors.black),
                        buttonName: 'SWR3079653',
                      ),
                      CustomDivider(),

                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
