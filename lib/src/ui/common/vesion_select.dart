import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class SelectVersion extends StatelessWidget {
  const SelectVersion({super.key});

  @override
  Widget build(BuildContext context) {
    final ffem = MediaQuery.of(context).size.width / 390 * 0.97;
    return SafeArea(
      child: Scaffold(
        body: Container(
          width: double.infinity,
          margin: EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 75 * ffem,
              ),
              Container(
                padding: EdgeInsets.all(20 * ffem),
                width: 310 * ffem,
                height: 155 * ffem,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 0,
                      blurRadius: 4,
                      offset: Offset(0, 4), // changes position of shadow
                    ),
                  ],
                ),
                child: Row(
                  children: [
                    Image.asset(
                      'assets/images/Mentocat.png',
                      width: 100,
                      height: 100,
                    ),
                    SizedBox(
                      width: 25 * ffem,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          'Mento',
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: 6 * ffem,
                        ),
                        Text(
                          '멘토버전이에요\n등록한 멘티를 확인하고\n1 일 1 칭찬을\n보낼 수 있어요',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: Color(0xff878594),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 30 * ffem,
              ),
              Container(
                padding: EdgeInsets.all(20 * ffem),
                width: 310 * ffem,
                height: 155 * ffem,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 0,
                      blurRadius: 4,
                      offset: Offset(0, 4), // changes position of shadow
                    ),
                  ],
                ),
                child: Row(
                  children: [
                    Image.asset(
                      'assets/images/Menticat.png',
                      width: 100,
                      height: 100,
                    ),
                    SizedBox(
                      width: 25 * ffem,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          'Menti',
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: 6 * ffem,
                        ),
                        Text(
                          '멘티버전이에요\n멘토와 연결하고\n피드백을 받아보세요',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: Color(0xff878594),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 30 * ffem,
              ),
              Container(
                height: 1 * ffem,
                color: Color(0xffC5C4CF),
              ),
              SizedBox(
                height: 30 * ffem,
              ),
              Container(
                padding: EdgeInsets.all(20 * ffem),
                width: 310 * ffem,
                height: 155 * ffem,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 0,
                      blurRadius: 4,
                      offset: Offset(0, 4), // changes position of shadow
                    ),
                  ],
                ),
                child: Row(
                  children: [
                    Image.asset(
                      'assets/images/Singlecat.png',
                      width: 100,
                      height: 100,
                    ),
                    SizedBox(
                      width: 25 * ffem,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          'Single',
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: 6 * ffem,
                        ),
                        Text(
                          '싱글버전이에요\n멘토링없이 이용하고\n혼자 1일 1 피드백을\n기록할 수 있어요',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: Color(0xff878594),
                          ),
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
    );
  }
}
