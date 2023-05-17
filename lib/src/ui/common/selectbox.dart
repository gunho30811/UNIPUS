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
            Text(
              '상자 하나를 선택하세요',
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            ),
            Expanded(
              child: Container(
                height: 400 * ffem,
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
            SizedBox(
              height: 20,
            ),
            Container(
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
            ),
          ],
        ),
      );
    } else if (_pageIndex == 1) {
      String? chosenImage = Provider.of<ImageChoice>(context).chosenImage;
      return Center(
        child: InkWell(
          onTap: () => setState(() {
            _pageIndex = 2;
          }),
          child: Image.asset(chosenImage ?? 'assets/default_image.png'),
        ),
      );
    } else {
      String? chosenImage = Provider.of<ImageChoice>(context).chosenImage;
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(chosenImage ?? 'assets/default_image.png'),
            ElevatedButton(
              child: Text('Name the image'),
              onPressed: () async {
                final name = await showDialog<String>(
                  context: context,
                  builder: (BuildContext context) => AlertDialog(
                    title: Text('Name the image'),
                    content: TextField(
                      autofocus: true,
                      decoration: InputDecoration(
                        labelText: 'Image Name',
                      ),
                    ),
                    actions: <Widget>[
                      TextButton(
                        child: Text('OK'),
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
          ],
        ),
      );
    }
  }
}
