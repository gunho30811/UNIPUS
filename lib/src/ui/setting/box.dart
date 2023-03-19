import 'package:chur/src/ui/setting/popup.dart';
import 'package:flutter/material.dart';

class BoxPopup extends StatelessWidget {
  final Widget? icon; // 변수 이름 수정
  final String subject; // 변수 이름 수정
  final String? buttonName; // 변수 이름 수정
  final TextStyle subjectTextStyle;

  const BoxPopup({
    this.icon,
    required this.subject,
    this.buttonName,
    required this.subjectTextStyle,
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
                    return CustomPopup(); // CustomPopup 클래스를 사용하여 팝업 표시
                  },
                );
              },
              child: Text(buttonName!,
                  style: TextStyle(fontSize: 15, color: Color(0xffA8A8B0))),
              style: ButtonStyle(
                overlayColor: MaterialStateProperty.all(Colors.transparent),
              ),
            ),
        ],
      ),
    );
  }
}

class WhiteBox extends StatelessWidget {
  final Widget child;

  const WhiteBox({
    required this.child,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Container(
      padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.03),
      width: screenWidth * 0.9,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: child, // child를 사용하여 원하는 위젯을 내부에 배치
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