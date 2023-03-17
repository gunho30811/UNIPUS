import 'package:flutter/material.dart';
class CustomPopup extends StatelessWidget {
  const CustomPopup({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text('Popup Title'),
          IconButton(
            splashRadius: 1, // 원형 터치효과 삭제
            icon: Icon(Icons.close),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      ),
      content: Text('This is the content of the popup.'),
      actions: [],
    );
  }
}