import 'package:chur/src/provider/authentication.dart';
import 'package:chur/src/ui/timetable/calender.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_login/flutter_login.dart';
import 'package:provider/provider.dart';

import '../../home.dart';

const users = const {
  'dribbble@gmail.com': '12345',
  'hunter@gmail.com': 'hunter',
};

class LoginScreen extends StatefulWidget {
  static const routeName = '/login';

  @override
  _LoginScreenState createState() => _LoginScreenState();

}

class _LoginScreenState extends State<LoginScreen> {
  Duration get loginTime => Duration(milliseconds: 2250);

  Future<String?> _authUser(LoginData data) async {
    try {
      final user = await Provider.of<Authentication>(context, listen: false)
          .signIn(data.name, data.password);
      if (user == null) {
        return '로그인에 실패했습니다.';
      }
      return null;
    } catch (e) {
      print(e);
      return '로그인에 실패했습니다.';
    }
  }


  Future<String?> _registerUser(LoginData data) async {
    try {
      final user = await Provider.of<Authentication>(context, listen: false)
          .register(data.name, data.password);
      if (user == null) {
        return '회원가입에 실패했습니다.';
      }
      return null;
    } catch (e) {
      print(e);
      return '회원가입에 실패했습니다.';
    }
  }

  // Future<String?> _recoverPassword(String name) {
  //   return null;
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FlutterLogin(
        title: 'Fireauth Demo',
        logo: 'assets/images/test.jpg',
        onLogin: _authUser,
        onSignup: _registerUser,
        onSubmitAnimationCompleted: () {
          Navigator.of(context).pushReplacement(
            MaterialPageRoute(
              builder: (context) => Home(),
            ),
          );
        },
        onRecoverPassword: (String ) {  },
        //onRecoverPassword: _recoverPassword,
      ),
    );
  }
}




