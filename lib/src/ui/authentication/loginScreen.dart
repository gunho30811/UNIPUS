import 'package:chur/src/provider/authentication.dart';
import 'package:chur/src/ui/authentication/sign_up_details_Screen.dart';

import 'package:flutter/material.dart';
import 'package:flutter_login/flutter_login.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:chur/src/ui/authentication/google_auth.dart';
import 'package:chur/src/ui/authentication/kakao_auth.dart';
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

  late SharedPreferences prefs;

  @override
  void initState() {
    super.initState();
    SharedPreferences.getInstance().then((value) {
      prefs = value;
    });
  }

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
      } else {
        // 회원가입에 성공한 경우, 추가 정보 입력 화면으로 이동합니다.
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => _activePage(),
          ),
        );
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


  //카카오 로그인 로직 : 카카오 로그인 -> 로그인 후 카카오Id추출 kakaoId@kakao.com | kakaoId (아이디 | 비번)
  //해당 정보로 fireauth 로그인 registerKakao(kakaoId)로 실행


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
        FlutterLogin(
          title: '로그인하기',
          // logo: 'assets/images/test.jpg',
          onLogin: _authUser,
          onSignup: _registerUser,
          onSubmitAnimationCompleted: () {
            Navigator.of(context).pushReplacement(
              MaterialPageRoute(
                builder: (context) => _activePage(),
              ),
            );
          },
          onRecoverPassword: (String ) {},
          //onRecoverPassword: _recoverPassword,
          theme: LoginTheme(
              accentColor: Colors.orange,
              primaryColor: Colors.orange,
              inputTheme: InputDecorationTheme(
                filled: true,
                fillColor: Colors.white,
                contentPadding:
                EdgeInsets.only(left: 14.0, bottom: 8.0, top: 8.0),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.orange),
                  borderRadius: BorderRadius.circular(25.7),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.orange),
                  borderRadius: BorderRadius.circular(25.7),
                ),
              ),
              pageColorLight: Colors.white,
              pageColorDark: Colors.white,
              titleStyle: TextStyle(
                  color: Colors.black,
                  fontSize: 40,
                  fontWeight: FontWeight.w500
              )
          ),
          messages: LoginMessages(
            loginButton: '로그인',
            signupButton: '회원가입',
            forgotPasswordButton: '비밀번호 찾기',
            recoverPasswordDescription: '비밀번호를 잊으셨나요? 이메일 주소를 입력하고 비밀번호를 복구하세요.',
          ),
        ),
        Positioned(
          bottom: 30,
          left: 0,
          right: 0,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                icon: Image.asset('assets/images/google_logo.png'), // Google 로고 이미지 경로
                onPressed: () async {
                  final user = await signInWithGoogle();
                  if (user != null) {
                    // 로그인 성공시 처리
                    print('Google Login successful: ${user.uid}');
                    Navigator.of(context).pushReplacement(
                      MaterialPageRoute(
                        builder: (context) => _activePage(),
                      ),
                    );
                  } else {
                    print('Google Login failed.');
                  }
                },
              ),
              /*IconButton(
                icon: Image.asset('assets/images/kakao_logo.png'), // Kakao 로고 이미지 경로
                onPressed: () async {
                  final user = await signInWithKakao();
                  if (user != null) {
                    // 로그인 성공시 처리
                    print('Kakao Login successful: ${user.uid}');
                    Navigator.of(context).pushReplacement(
                      MaterialPageRoute(
                        builder: (context) => _activePage(),
                      ),
                    );
                  } else {
                    print('Kakao Login failed.');
                  }
                },
              ),*/  // 카카오 연결
            ],
          ),
        )
      ],
      )
    );
  }

  Widget _activePage(){

    String? group = prefs.getString('group');
    if (group != null) {//로그인 SharedPreferences를 사용하여 로그인 여부 판단
      print("login");
      return Home();
    } else {//회원가입
      print("register");
      return SignUpDetailsScreen();
    }
  }

}




