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
        body: CustomScrollView(
          slivers: <Widget>[
            SliverAppBar(
              backgroundColor: Color(0xffF2F2F7), // 배경 색상 설정
              floating: true, // SliverAppBar를 floating 모드로 설정
              pinned: false,
              snap: false,
              expandedHeight: screenHeight * 0.15,
              title: Container(
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
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 10),
                    Container(
                      color: Colors.black,
                      height: screenHeight * 1.5,
                      width: screenWidth * 0.85,
                    ),
                    SizedBox(height: 10),
                    Container(
                      child: Row(
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
                    ),
                  ],
                ),
              ),
            ),
            SliverPadding(
              padding: EdgeInsets.only(top: 10, bottom: 20),
              sliver: SliverList(
                delegate: SliverChildBuilderDelegate(
                  (BuildContext context, int index) {
                    return ListTile(
                      title: Text('Item $index'),
                    );
                  },
                  childCount: 100,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
