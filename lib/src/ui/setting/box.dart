import 'package:chur/src/ui/setting/popup.dart';
import 'package:flutter/material.dart';

class Box1 extends StatelessWidget {
  final Widget icon; // 변수 이름 수정
  final String subject; // 변수 이름 수정
  final String buttonName; // 변수 이름 수정

  const Box1({
    required this.icon,
    required this.subject,
    required this.buttonName,
    Key? key,
  }) : super(key: key);

  double displayWidth(BuildContext context) =>
      MediaQuery.of(context).size.width; // displayWidth 함수 추가

  @override
  Widget build(BuildContext context) {
    return Container(
      width: displayWidth(context) * 0.9,
      padding: EdgeInsets.symmetric(horizontal: displayWidth(context) * 0.02),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              icon,
              const SizedBox(
                width: 5,
              ),
              Text(subject),
            ],
          ),
          TextButton(
            onPressed: () {
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return CustomPopup(); // CustomPopup 클래스를 사용하여 팝업 표시
                },
              );
            },
            child: Text(buttonName!),
          ),
        ],
      ),
    );
  }
}