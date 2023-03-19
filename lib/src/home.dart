import 'package:chur/src/provider/home_provider.dart';
import 'package:chur/src/ui/authentication/loginScreen.dart';
import 'package:chur/src/ui/setting/setting_home.dart';
import 'package:chur/src/ui/setting/setting_main.dart';
import 'package:chur/src/ui/timetable/calender.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: ChangeNotifierProvider(
        create: (_) => HomeProvider(),
        child: MyHomePage(),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  static List<Widget> _widgetOptions = <Widget>[
    Login(),
    Calendar(),
    SettingHome(),
    SettingsScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<HomeProvider>(
        builder: (context, provider, child) => _widgetOptions[provider.currentIndex],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.calendar_month),
            label: 'Calender',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.table_chart),
            label: 'Time table',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.check_box),
            label: 'My list',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.gif_box),
            label: 'Cat box',
          ),
        ],
        currentIndex: Provider.of<HomeProvider>(context).currentIndex,
        selectedItemColor: Colors.orange, // 주황색으로 설정
        unselectedItemColor: Colors.black,
        onTap: (index) {
          Provider.of<HomeProvider>(context, listen: false).changePage(index);
        },
      ),
    );
  }
}