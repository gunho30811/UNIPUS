import 'package:flutter/material.dart';

import 'box.dart';

class SettingHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView( // ListView 또는 Column 같은 위젯 사용
          children: [
            Box1(
              icon: Icon(Icons.star),
              subject: 'Example Subject',
              buttonName: 'Click me',
            ),
            // 필요한 경우 추가 Box1 인스턴스 또는 다른 위젯들을 추가할 수 있습니다.
          ],
        ),
      );
  }
}