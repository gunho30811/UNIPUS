import 'package:chur/src/ui/sizes_helpers.dart';
import 'package:flutter/material.dart';

class SettingHome extends StatelessWidget {
  const SettingHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                children: [
                  Icon(Icons.settings),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(15, 0, 0, 0),
                    child: Text(
                      '설정하기',
                      style: TextStyle(fontSize: 20),
                    ),
                  )
                ],
              ),
            ),
            Flexible(
              flex: 1,
              child: Container(
                padding: EdgeInsets.all(20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: displayWidth(context)*0.9,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              SizedBox(
                                child: Text('이름'),
                              ),
                              SizedBox(
                                child: Text('수정하기'),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        SizedBox(
                          width: 300,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Icon(Icons.notifications_none),
                                  SizedBox(
                                    width: 15,
                                  ),
                                  SizedBox(
                                    child: Text('알림 설정'),
                                  ),
                                ],
                              ),
                              SizedBox(
                                child: Text('버튼자리'),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        SizedBox(
                          width: 300,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Icon(Icons.palette_outlined),
                                  SizedBox(
                                    width: 15,
                                  ),
                                  SizedBox(
                                    child: Text('카테고리 설정'),
                                  ),
                                ],
                              ),
                              SizedBox(
                                child: Text('설정'),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        SizedBox(
                          width: 300,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Icon(Icons.access_alarm),
                                  SizedBox(
                                    width: 15,
                                  ),
                                  SizedBox(
                                    child: Text('주간 시간표 시작시간 설정'),
                                  ),
                                ],
                              ),
                              SizedBox(
                                width: 300,
                                child: Text('마감 시간 12:00 PM'),
                              ),
                              SizedBox(
                                width: 300,
                                child: Text('시작 시간 12:00 AM'),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    Container(),
                    Container(),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
