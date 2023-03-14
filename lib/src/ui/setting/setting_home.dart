import 'package:flutter/material.dart';

class Setting extends StatelessWidget {
  const Setting({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Column(
          children: [
            Row(
              children: [
                Icon(Icons.settings),
                Text('설정하기')
              ],
            ),
          ],
        ),
      ),
    );
  }
}
