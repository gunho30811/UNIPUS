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

class NameEdit extends StatelessWidget {
  const NameEdit({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text('내 이름 수정하기'),
          IconButton(
            splashRadius: 1, // 원형 터치효과 삭제
            icon: Icon(Icons.close),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      ),
      content: Row(
        children: [
          Icon(Icons.pending_actions),
          TextField(
            decoration: InputDecoration(
              labelText: 'Name',
              border: OutlineInputBorder(),
            ),
          ),
        ],
      ),
      actions: [
        TextButton(
          onPressed: () {
            // 이름 변경 로직을 여기에 추가하세요.
            Navigator.of(context).pop();
          },
          child: Text('확인'),
        ),
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: Text('취소'),
        ),
      ],
    );
  }
}
