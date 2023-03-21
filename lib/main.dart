import 'package:chur/src/provider/authentication.dart';
import 'package:chur/src/ui/my_list/my_list_home.dart';
import 'package:chur/src/ui/setting/setting_home.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';
import 'firebase_options.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => Authentication(),
      child: MaterialApp(
        title: 'My App',
        home: SettingHome(),
      ),
    );
  }
}
