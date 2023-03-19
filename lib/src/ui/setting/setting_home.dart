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
                SizedBox(height: screenHeight * 0.01,),
                Container(
                  padding: EdgeInsets.all(screenWidth * 0.02),
                  width: screenWidth * 0.9,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                  ),
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
                      Divider(
                        height: 1, // set the height of the line
                        thickness: 1, // set the thickness of the line
                        color: Colors.grey[300], // set the color of the line
                      ),
                      BoxPopup(
                          icon: Icon(Icons.notifications_none_outlined),
                          subject: '알림 설정',
                          subjectTextStyle:
                              TextStyle(fontSize: 15, color: Colors.black)),
                      Divider(
                        height: 1, // set the height of the line
                        thickness: 1, // set the thickness of the line
                        color: Colors.grey[300], // set the color of the line
                      ),
                      BoxPopup(
                        icon: Icon(Icons.palette_outlined),
                        subject: 'Example Subject',
                        buttonName: 'Click me',
                        subjectTextStyle:
                            TextStyle(fontSize: 15, color: Colors.black),
                      ),
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
