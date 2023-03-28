import 'package:chur/src/ui/catbox/catbox_home.dart';
import 'package:chur/src/ui/setting/popup.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BoxPopup extends StatelessWidget {
  final Widget? icon; // 변수 이름 수정
  final String subject; // 변수 이름 수정
  final String? buttonName; // 변수 이름 수정
  final TextStyle subjectTextStyle;
  final Widget Function(BuildContext)? buildPopup;

  const BoxPopup({
    this.icon,
    required this.subject,
    this.buttonName,
    required this.subjectTextStyle,
    this.buildPopup,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    return Container(
      width: screenWidth * 0.9,
      height: screenHeight * 0.07,
      padding: EdgeInsets.symmetric(
          horizontal: screenWidth * 0.01, vertical: screenHeight * 0.01),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              icon ?? const SizedBox.shrink(),
              const SizedBox(
                width: 15,
              ),
              Text(
                subject,
                style: subjectTextStyle,
              ),
            ],
          ),
          if (buttonName != null)
            TextButton(
              onPressed: () {
                showDialog(
                  context: context,
                  barrierDismissible: true,
                  builder: (BuildContext context) {
                    if (buildPopup != null) {
                      return buildPopup!(context);
                    } else {
                      return AlertDialog(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                        contentPadding: EdgeInsets.all(20),
                        title: Text(
                          subject,
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        content: Text(buttonName!),
                        actions: [
                          TextButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            child: Text('Close'),
                          ),
                        ],
                      );
                    }
                  },
                );
              },
              child: Text(
                buttonName!,
                style: TextStyle(fontSize: 15, color: Color(0xffA8A8B0)),
              ),
              style: ButtonStyle(
                overlayColor: MaterialStateProperty.all(Colors.transparent),
              ),
            ),
        ],
      ),
    );
  }
}

class CustomDivider extends StatelessWidget {
  const CustomDivider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Divider(
      height: 1, // set the height of the line
      thickness: 1, // set the thickness of the line
      color: Colors.grey[300], // set the color of the line
    );
  }
}

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
                SizedBox(
                  height: screenHeight * 0.01,
                ),
                Container(
                  width: screenWidth * 0.9,
                  height: screenHeight * 0.07,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(children: [
                        Icon(
                          Icons.settings,
                          size: 30,
                        ),
                        SizedBox(width: 10),
                        Text(
                          '설정하기',
                          style: TextStyle(
                              fontSize: 25,
                              color: Colors.black,
                              fontWeight: FontWeight.bold),
                        ),
                      ]),
                      IconButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          icon: Icon(Icons.arrow_back))
                    ],
                  ),
                ),
                SizedBox(
                  height: screenHeight * 0.01,
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.03),
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
                        buildPopup: (BuildContext context) => NameEdit(),
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
                        buildPopup: (BuildContext context) =>
                            CategoryListPopup(),
                      ),
                      CustomDivider(),
                      BoxPopup(
                        icon: Icon(Icons.access_time),
                        subject: '주간시간표 시간 설정',
                        subjectTextStyle:
                            TextStyle(fontSize: 15, color: Colors.black),
                      ),
                      SizedBox(
                        width: screenWidth * 0.9,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            TimePickerButton(),
                            TimePickerButton1(),
                            SizedBox(
                              height: screenHeight * 0.02,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: screenHeight * 0.03,
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.03),
                  width: screenWidth * 0.9,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                  ),
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
                      BoxPopup(
                        icon: Icon(Icons.published_with_changes_outlined),
                        subject: '버전 변경하기',
                        subjectTextStyle:
                            TextStyle(fontSize: 15, color: Colors.black),
                        buttonName: 'Mento',
                        buildPopup: (BuildContext context) =>
                            VersionSelectPopup(
                                categories: ['menti', 'mento', 'single'],
                                selectedCategory: 'mento'),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: screenHeight * 0.03,
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.03),
                  width: screenWidth * 0.9,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: BoxPopup(
                    icon: Icon(Icons.change_circle_outlined),
                    subject: '멘티 변경하기',
                    subjectTextStyle:
                        TextStyle(fontSize: 15, color: Colors.black),
                    buttonName: '김00',
                    buildPopup: (BuildContext context) => VersionSelectPopup(
                        categories: ['김00', '박00', '이00'],
                        selectedCategory: '김00'),
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
