import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../provider/selectbox_provider.dart';

class ImageSelectionPage extends StatelessWidget {
  final List<String> imageList = [
    'assets/images/Box_1.png',
    'assets/images/Box_2.png',
    'assets/images/Box_3.png',
    'assets/images/Box_4.png',
  ]; // 이미지 경로를 알맞게 설정해주세요.

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GridView.builder(
        itemCount: imageList.length,
        gridDelegate:
            SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () {
              Provider.of<ImageChoice>(context, listen: false).chosenImage =
                  imageList[index];
              Navigator.push(context,
                  MaterialPageRoute(builder: (_) => ImageDisplayPage()));
            },
            child: Image.asset(imageList[index]),
          );
        },
      ),
    );
  }
}

class ImageDisplayPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    String? chosenImage = Provider.of<ImageChoice>(context).chosenImage;

    return Scaffold(
      body: Center(
        child: InkWell(
          onTap: () => Navigator.push(
              context, MaterialPageRoute(builder: (_) => ImageFinalPage())),
          child: Image.asset(chosenImage ?? 'assets/default_image.png'),
        ),
      ),
    );
  }
}

class ImageFinalPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    String? chosenImage = Provider.of<ImageChoice>(context).chosenImage;
    return Scaffold(
      body: Center(
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
      ),
    );
  }
}
