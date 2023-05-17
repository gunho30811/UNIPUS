import 'package:chur/src/provider/home_provider.dart';
import 'package:chur/src/provider/mylist_provider.dart';
import 'package:chur/src/provider/todo_provider.dart';
import 'package:chur/src/ui/authentication/loginScreen.dart';
import 'package:chur/src/ui/catbox/catbox_home.dart';
import 'package:chur/src/ui/common/selectbox.dart';
import 'package:chur/src/ui/my_list/my_list_home.dart';
import 'package:chur/src/ui/timetable/calender.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      home: MultiProvider(
        providers: [
          ChangeNotifierProvider<HomeProvider>(
            create: (_) => HomeProvider(),
          ),
          ChangeNotifierProvider<MyListProvider>(
            create: (_) => MyListProvider(),
          ),
          ChangeNotifierProvider<TodoProvider>(
            create: (_) => TodoProvider(),
          ),
        ],
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
    Calendar(),
    ImageSelectionPage(),
    MyListHome(),
    CatBoxHome(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<HomeProvider>(
        builder: (context, provider, child) =>
            _widgetOptions[provider.currentIndex],
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
