import 'package:chur/src/ui/sizes_helpers.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
        backgroundColor: Color(0xffF2F2F7),
        body: SingleChildScrollView(
          child: Container(
            height: screenHeight * 0.5,
            width: displayWidth(context) * 1,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  width: displayWidth(context) * 0.9,
                  padding: EdgeInsets.all(displayWidth(context) * 0.02),
                  child: Row(
                    children: [
                      Icon(Icons.settings),
                      SizedBox(width: 10),
                      Text('설정하기',
                          style: TextStyle(
                              fontSize: 25, fontWeight: FontWeight.bold)),
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(displayWidth(context) * 0.02),
                  width: displayWidth(context) * 0.9,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      SizedBox(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              '박봉근',
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold),
                            ),
                            TextButton(
                              onPressed: () {
                                // show name edit popup
                              },
                              child: Text('수정하기',
                                  style: TextStyle(
                                      fontSize: 15, color: Color(0xffA8A8B0))),
                            ),
                          ],
                        ),
                      ),
                      Divider(
                        height: 1, // set the height of the line
                        thickness: 1, // set the thickness of the line
                        color: Colors.grey[300], // set the color of the line
                      ),
                      Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Icon(Icons.notifications_none_outlined),
                                SizedBox(
                                  width: displayWidth(context) * 0.02,
                                ),
                                Text('알림설정'),
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
                      Divider(
                        height: 1, // set the height of the line
                        thickness: 1, // set the thickness of the line
                        color: Colors.grey[300], // set the color of the line
                      ),
                      Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Icon(Icons.palette_outlined),
                                SizedBox(
                                  width: displayWidth(context) * 0.02,
                                ),
                                Text('카테고리'),
                              ],
                            ),
                            TextButton(
                              onPressed: () {
                                // show category setting popup
                              },
                              child: Text('설정',
                                  style: TextStyle(
                                      fontSize: 15, color: Color(0xffA8A8B0))),
                            ),
                          ],
                        ),
                      ),
                      Divider(
                        height: 1, // set the height of the line
                        thickness: 1, // set the thickness of the line
                        color: Colors.grey[300], // set the color of the line
                      ),
                      Container(
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Icon(Icons.access_time),
                                SizedBox(
                                  width: displayWidth(context) * 0.02,
                                ),
                                Text('주간 시간표 시작시간 설정'),
                              ],
                            ),
                            SizedBox(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Text('Start Time'),
                                  CupertinoButton(
                                    onPressed: () {
                                      // show start time picker
                                    },
                                    child: Text(
                                      '12:00AM',
                                      style: TextStyle(
                                          fontSize: 15, color: Color(0xffA8A8B0)),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Text('End Time'),
                                  CupertinoButton(
                                    onPressed: () {
                                      // show end time picker
                                    },
                                    child: Text(
                                      '6:00PM',
                                      style: TextStyle(
                                          fontSize: 15, color: Color(0xffA8A8B0)),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: displayHeight(context) * 0.03,),
                Container(
                  padding: EdgeInsets.all(displayWidth(context) * 0.02),
                  width: displayWidth(context) * 0.9,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Icon(Icons.person_outlined),
                                SizedBox(
                                  width: displayWidth(context) * 0.02,
                                ),
                                Text('User Code'),
                              ],
                            ),
                            TextButton(
                              style: TextButton.styleFrom(
                                  foregroundColor: Color(0xffA8A8B0)),
                              onPressed: () {
                                // show user code information
                              },
                              child: Text('123456A'),
                            ),
                          ],
                        ),
                      ),
                      Divider(
                        height: 1, // set the height of the line
                        thickness: 1, // set the thickness of the line
                        color: Colors.grey[300], // set the color of the line
                      ),
                      Container(
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Icon(Icons.published_with_changes_outlined),
                                SizedBox(
                                  width: displayWidth(context) * 0.02,
                                ),
                                Text('버전 변경하기'),
                              ],
                            ),
                            TextButton(
                              style: TextButton.styleFrom(
                                  foregroundColor: Color(0xffA8A8B0)),
                              onPressed: () {
                                // show version change popup
                              },
                              child: Text('Mento'),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: displayHeight(context) * 0.03,),
                Container(
                  padding: EdgeInsets.all(displayWidth(context) * 0.02),
                  width: displayWidth(context) * 0.9,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Column(
                    children: [
                      SizedBox(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Icon(Icons.change_circle_outlined),
                                SizedBox(
                                  width: displayWidth(context) * 0.02,
                                ),
                                Text('멘티 변경하기 '),
                              ],
                            ),
                            TextButton(
                              style: TextButton.styleFrom(
                                  foregroundColor: Color(0xffA8A8B0)),
                              onPressed: () {
                                // show mentee change popup
                              },
                              child: Text('123456A Kim mentee'),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}