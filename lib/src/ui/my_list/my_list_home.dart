import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../provider/mylist_provider.dart';
import '../../provider/mylist_timeline_provider.dart';

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
    final timeLineProvider = Provider.of<TimeLineProvider>(context);
    final timeLines = timeLineProvider.items;

    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xffF2F2F7),
        body: Stack(
          children: [
            Column(
              children: [
                Container(
                  height: screenHeight * 0.15,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(30),
                      bottomRight: Radius.circular(30),
                    ),
                  ),
                  child: Column(
                    children: [
                      SizedBox(height: 10),
                      Text(
                        Month,
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 10),
                      Container(
                        color: Colors.black,
                        height: 2,
                        width: screenWidth * 0.9,
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
                  height: 10,
                ),
                Expanded(
                  child: Container(
                      width: screenWidth * 0.95,
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 1,
                            blurRadius: 1,
                            offset: Offset(0, 3),
                          ),
                        ],
                        color: Color(0xffFEF8EC),
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(30),
                            topRight: Radius.circular(30)),
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: Container(
                              padding: EdgeInsets.all(20),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      SizedBox(
                                        width: 20,
                                      ),
                                      Text(
                                        '12.22.Thr',
                                        style: TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  Expanded(
                                    //복붙 후 프로바이더 이름 및 아이템(MyList에 해당) 만 변경
                                    child: Consumer<MyListProvider>(
                                      //프로바이더를 사용할때 필수적인 요소 Consumer<프로바이더 이름>
                                      builder: (context, provider, child) {
                                        //context, provider, child 고정적인 요소
                                        return ListView.builder(
                                          itemCount: provider.mylist.length,
                                          //아이템 갯수 -> mylist의 length(길이)
                                          itemBuilder: (context, index) {
                                            final mylist =
                                                provider.mylist[index];
                                            return MyList(
                                              title: (mylist.title),
                                              subtitle: (mylist.subtitle),
                                              color: Color(mylist.color),
                                            );
                                          },
                                        );
                                      },
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      )),
                ),
              ],
            ),
            Container(child: CustomFloatingButton()),
          ],
        ),
      ),
    );
  }
}

class MyList extends StatelessWidget {
  final String title;
  final String subtitle;
  final Color color;

  const MyList(
      {Key? key,
      required this.title,
      required this.subtitle,
      required this.color})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    return Column(
      children: [
        Container(
          height: 100,
          width: screenWidth * 0.8,
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
              Container(
                height: 55,
                width: 7,
                decoration: BoxDecoration(
                  color: color,
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(
                    width: 2,
                    color: Color.fromARGB(0, 98, 98, 98).withOpacity(0.5),
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: Text('Your Popup Title'),
                        content: Text('Your Popup Content'),
                        actions: <Widget>[
                          TextButton(
                            child: Text('OK'),
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                          ),
                        ],
                      );
                    },
                  );
                },
                child: Container(
                  padding: EdgeInsets.all(8),
                  width: 200,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        title,
                        style: TextStyle(
                            fontSize: 20,
                            color: Colors.black,
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      Text(
                        subtitle,
                        style: TextStyle(fontSize: 15, color: Colors.grey),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                  padding: EdgeInsets.all(7), child: CustomCircleButtons()),
            ],
          ),
        ),
        SizedBox(
          height: 13,
        )
      ],
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
        width: 18,
        height: 18,
        decoration: BoxDecoration(
          color: _selectedButton == index
              ? _buttonColors[index]
              : Color(0xffE3D8D5),
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
        SizedBox(height: 5),
        _buildCircleButton(1),
        SizedBox(height: 5),
        _buildCircleButton(2),
      ],
    );
  }
}

class CustomFloatingButton extends StatefulWidget {
  @override
  _CustomFloatingButtonState createState() => _CustomFloatingButtonState();
}

class _CustomFloatingButtonState extends State<CustomFloatingButton> {
  bool _isButtonSelected = false;
  TextEditingController _textEditingController = TextEditingController();

  void _toggleButton() {
    setState(() {
      _isButtonSelected = !_isButtonSelected;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Stack(
        children: [
          Positioned(
            bottom: 30,
            right: 30,
            child: _isButtonSelected
                ? Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        SizedBox(width: 10),
                        IconButton(
                          onPressed: _toggleButton,
                          icon: Icon(Icons.close),
                          color: Colors.grey,
                        ),
                        SizedBox(width: 10),
                        Container(
                          width: MediaQuery.of(context).size.width * 0.6,
                          child: TextFormField(
                            controller: _textEditingController,
                            decoration: InputDecoration(
                              hintText: '오늘 하루 칭찬 보내기',
                              border: InputBorder.none,
                            ),
                          ),
                        ),
                        IconButton(
                          onPressed: () {},
                          icon: Icon(Icons.send),
                          color: Colors.grey,
                        ),
                        SizedBox(width: 10),
                      ],
                    ),
                  )
                : SizedBox(
                    width: 70,
                    height: 70,
                    child: FloatingActionButton(
                      onPressed: _toggleButton,
                      child: Ink.image(
                        image: AssetImage(
                            'assets/images/CustomFloatingButton.png'),
                        child: InkWell(
                          onTap: _toggleButton,
                        ),
                      ),
                      backgroundColor: Colors.transparent,
                      elevation: 0,
                    ),
                  ),
          ),
        ],
      ),
    );
  }
}
