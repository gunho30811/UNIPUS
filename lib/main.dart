import 'package:chur/src/home.dart';
import 'package:chur/src/provider/authentication.dart';
import 'package:chur/src/provider/catbox_grade_provider.dart';
import 'package:chur/src/provider/character_provider.dart';
import 'package:chur/src/provider/mylist_provider.dart';
import 'package:chur/src/provider/mylist_timeline_provider.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';
import 'firebase_options.dart';
import 'package:intl/date_symbol_data_local.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initializeDateFormatting('ko_KR', null);
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => Authentication()),
        ChangeNotifierProvider(create: (_) => TimeLineProvider()),
        ChangeNotifierProvider(create: (_) => ItemProvider()), // 수정된 부분
        ChangeNotifierProvider(create: (context) => CharacterProvider())
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'My App',
        home: Home(),
      ),
    );
  }
}
