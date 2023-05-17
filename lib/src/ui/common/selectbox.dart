import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../provider/selectbox_provider.dart';

class ImageSelectionPage extends StatefulWidget {
  @override
  _ImageSelectionPageState createState() => _ImageSelectionPageState();
}

class _ImageSelectionPageState extends State<ImageSelectionPage> {
  int _pageIndex = 0;

  final List<String> imageList = [
    'assets/images/Box_1.png',
    'assets/images/Box_2.png',
    'assets/images/Box_3.png',
    'assets/images/Box_4.png',
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
            margin: EdgeInsets.symmetric(horizontal: 24), child: _buildPage()),
      ),
    );
  }

  Widget _buildPage() {
    if (_pageIndex == 0) {
      final ffem = MediaQuery.of(context).size.width / 390 * 0.97;
      return Scaffold(
        body: Column(
          children: [
            SizedBox(
              height: 90 * ffem,
            ),
            Text(
              '상자 하나를 선택하세요',
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.w800),
            ),
            SizedBox(
              height: 65 * ffem,
            ),
            Container(
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
              child: SizedBox(
                height: 370 * ffem,
                child: NotificationListener<OverscrollIndicatorNotification>(
                  onNotification: (OverscrollIndicatorNotification overscroll) {
                    overscroll.disallowGlow();
                    return true;
                  },
                  child: Expanded(
                    child: GridView.builder(
                      itemCount: imageList.length,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2),
                      itemBuilder: (context, index) {
                        return Container(
                          margin: EdgeInsets.all(30 * ffem),
                          child: InkWell(
                            onTap: () {
                              Provider.of<ImageChoice>(context, listen: false)
                                  .chosenImage = imageList[index];
                              setState(() {
                                _pageIndex = 1;
                              });
                            },
                            child: Image.asset(imageList[index]),
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 26 * ffem,
            ),
            Container(
              alignment: Alignment.center,
              width: 260 * ffem,
              height: 100 * ffem,
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
              child: Text(
                '길을 걷다가 \n 한 상자를 발견했어요!',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      );
    } else if (_pageIndex == 1) {
      final ffem = MediaQuery.of(context).size.width / 390 * 0.97;
      String? chosenImage = Provider.of<ImageChoice>(context).chosenImage;
      return Scaffold(
        body: Column(
          children: [
            SizedBox(
              height: 90 * ffem,
            ),
            Text(
              '상자 하나를 선택하세요',
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.w800),
            ),
            SizedBox(
              height: 65 * ffem,
            ),
            Container(
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
              child: Container(
                margin: EdgeInsets.all(90 * ffem),
                child: InkWell(
                  onTap: () => setState(() {
                    _pageIndex = 2;
                  }),
                  child: Image.asset(chosenImage ?? 'assets/default_image.png'),
                ),
              ),
            ),
            SizedBox(
              height: 26 * ffem,
            ),
            Container(
              alignment: Alignment.center,
              width: 260 * ffem,
              height: 100 * ffem,
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
              child: Text(
                '안에 뭐가 들었는지 \n 열어보아요!',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      );
    } else {
      final ffem = MediaQuery.of(context).size.width / 390 * 0.97;
      String? chosenImage = Provider.of<ImageChoice>(context).chosenImage;
      return SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 90 * ffem,
            ),
            Text(
              '간택 당했어요!',
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.w800),
            ),
            SizedBox(
              height: 65 * ffem,
            ),
            Container(
              decoration: BoxDecoration(
                color: Color(0xffFFF0CB),
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
              child: Stack(
                alignment: Alignment.bottomCenter,
                children: [
                  Column(
                    children: [
                      SizedBox(
                          height: 170 * ffem,
                          child: Image.asset('assets/images/cat_0.png')),
                      SizedBox(
                        height: 160 * ffem,
                      )
                    ],
                  ),
                  Container(
                      margin: EdgeInsets.all(90 * ffem),
                      child: Image.asset(
                          chosenImage ?? 'assets/default_image.png')),
                ],
              ),
            ),
            SizedBox(
              height: 26 * ffem,
            ),
            SizedBox(
              width: 140 * ffem,
              height: 50 * ffem,
              child: ElevatedButton(
                style: ButtonStyle(
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  backgroundColor:
                      MaterialStateProperty.all<Color>(Color(0xffFF9800)),
                ),
                child: Text(
                  '이름 짓기',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.w600),
                ),
                onPressed: () async {
                  final name = await showDialog<String>(
                    context: context,
                    builder: (BuildContext context) => AlertDialog(
                      title: Text('이름짓기'),
                      content: TextField(
                        autofocus: true,
                      ),
                      actions: <Widget>[
                        TextButton(
                          child: Text('확인'),
                          onPressed: () {},
                        ),
                      ],
                    ),
                  );
                  if (name != null) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text('You named the image: $name'),
                      ),
                    );
                  }
                },
              ),
            ),
          ],
        ),
      );
    }
  }
}
