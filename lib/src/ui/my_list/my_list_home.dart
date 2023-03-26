import 'package:flutter/material.dart';

// 날짜에 대한 더미 데이터
const String Month = 'December';

class DayButton extends StatefulWidget {
  final String text;
  final VoidCallback onPressed;
  final bool isSelected;

  DayButton({
    required this.text,
    required this.onPressed,
    this.isSelected = false,
  });

  @override
  _DayButtonState createState() => _DayButtonState();
}

class _DayButtonState extends State<DayButton> {
  void _toggleSelected() {
    if (!widget.isSelected) {
      widget.onPressed();
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _toggleSelected,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        decoration: BoxDecoration(
          color: widget.isSelected ? Colors.black : Colors.white,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Text(
          widget.text,
          style: TextStyle(
            color: widget.isSelected ? Colors.white : Colors.black,
          ),
        ),
      ),
    );
  }
}

class MyListHome extends StatefulWidget {
  @override
  _MyListHomeState createState() => _MyListHomeState();
}

class _MyListHomeState extends State<MyListHome> {
  int _selectedDayIndex = 0;

  void _handleDayButtonPressed(int index) {
    setState(() {
      _selectedDayIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final dates = List.generate(7, (index) => '${index + 1}');
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Container(
              height: screenHeight * 0.15,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20),
                ),
              ),
              child: Column(
                children: [
                  SizedBox(height: 10),
                  Text(
                    Month,
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 10),
                  SizedBox(
                    width: screenWidth * 0.85,
                    child: Divider(
                      height: 1,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      ...List.generate(
                        dates.length,
                        (index) => DayButton(
                          text: dates[index],
                          onPressed: () => _handleDayButtonPressed(index),
                          isSelected: index == _selectedDayIndex,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
                width: screenWidth * 0.95,
                decoration: BoxDecoration(
                  color: Color(0xffFEF8EC),
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(
                      children: [
                        Align(
                          alignment: Alignment.topLeft,
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Text(
                          '12.22.Thr',
                          style: TextStyle(
                              fontSize: 25, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        MyList(),
                      ],
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Container(
                      width: screenWidth * 0.15,
                      height: screenHeight * 0.7,
                      color: Colors.white,
                    ),
                  ],
                )),
          ],
        ),
      ),
    );
  }
}

class MyList extends StatelessWidget {
  const MyList({super.key});
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      width: 300,
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 1,
            blurRadius: 1,
            offset: Offset(0, 3),
          ),
        ],
        color: Color(0xffffffff),
        borderRadius: BorderRadius.all(Radius.circular(20)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Align(
            alignment: Alignment.centerLeft,
          ),
          SizedBox(
            child: Container(
              height: 65,
              width: 7,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(20)),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 1,
                    blurRadius: 1,
                    offset: Offset(0, 3),
                  ),
                ],
                color: Color(0xffFFC93C),
              ),
            ),
          ),
          Container(
            width: 250,
            child: Column(
              children: [
                Align(
                  alignment: Alignment.topLeft,
                ),
                Text(
                  '영단어 암기',
                  style: TextStyle(fontSize: 20, color: Colors.grey),
                ),
                Text(
                  'p145 ~ p165',
                  style: TextStyle(fontSize: 10, color: Colors.grey),
                ),
              ],
            ),
          ),
          CustomCircleButtons(),
        ],
      ),
    );
  }
}

class CustomCircleButtons extends StatefulWidget {
  @override
  _CustomCircleButtonsState createState() => _CustomCircleButtonsState();
}

class _CustomCircleButtonsState extends State<CustomCircleButtons> {
  int _selectedButton = -1;

  List<String> _buttonNames = [
    'Execellent!',
    'Good!',
    'Bad!',
  ];

  List<Color> _buttonColors = [
    Color(0xff9CE861),
    Color(0xffFFB13D),
    Color(0xffF16538),
  ];

  void _onButtonPressed(int index) {
    setState(() {
      _selectedButton = index;
    });

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
        backgroundColor: Colors.white,
        content: FractionallySizedBox(
          widthFactor: 0.3,
          child: Center(
            child: Text(
              '${_buttonNames[_selectedButton]}',
              style:
                  TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
            ),
          ),
        ),
        duration: Duration(seconds: 1),
      ),
    );
  }

  Widget _buildCircleButton(int index) {
    return GestureDetector(
      onTap: () => _onButtonPressed(index),
      child: Container(
        width: 20,
        height: 20,
        decoration: BoxDecoration(
          color: _selectedButton == index ? _buttonColors[index] : Colors.grey,
          shape: BoxShape.circle,
        ),
        child: _selectedButton == index
            ? Center(
                child: Icon(
                  Icons.check,
                  size: 15,
                  color: Colors.white,
                ),
              )
            : null,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _buildCircleButton(0),
        SizedBox(height: 10),
        _buildCircleButton(1),
        SizedBox(height: 10),
        _buildCircleButton(2),
      ],
    );
  }
}
