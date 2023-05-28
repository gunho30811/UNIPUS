
import 'package:chur/src/model/authentication/http/user_create.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../repository/authentication_repository.dart';

class Authentication extends ChangeNotifier {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final AuthenticationRepository repository = AuthenticationRepository();

  late SharedPreferences prefs;


  void printToken()
  {
    SharedPreferences.getInstance().then((value) {
      prefs = value;
    });
    String? token = prefs.getString('token');
    print("토큰 : \n$token");
  }
  tokenSave() async {
    SharedPreferences.getInstance().then((value) {
      prefs = value;
    });
    String? token = await _auth.currentUser?.getIdToken();
    prefs.setString('token', token!);
  }

  User? _user;

  User? get user => _user;

  void setUser(User? user) {
    _user = user;
    notifyListeners();
  }

  Future<User?> signIn(String email, String password) async {//로그인
    try {
      final UserCredential result = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      final User? user = result.user;
      repository.init();
      UserCreate userCreate = UserCreate(name: '채현수', gender: 'male', birth: '1999-08-03', phone: '010-2111-3250', group: 'single');
      repository.createUserInfo(userCreate);
      tokenSave();
      printToken();
      notifyListeners();
      return user;
    } catch (e) {
      print(e);
      return null;
    }
  }




  Future<User?> register(String email, String password) async {//회원가입
    try {
      final UserCredential result = await _auth
          .createUserWithEmailAndPassword(email: email, password: password);
      final User? user = result.user;
      repository.init();
      tokenSave();
      notifyListeners();
      return user;
    } catch (e) {
      print(e);
      return null;
    }
  }

  Future<String?> recoverPassword(String email) async {
    try {
      await _auth.setLanguageCode("kr");
      await _auth.sendPasswordResetEmail(email: email);
      return null;
    } on FirebaseAuthException catch (e) {
      return e.message;
    }
  }

  Future<void> logout() async {
    await _auth.signOut();
    setUser(null);
  }





  final GoogleSignIn _googleSignIn = GoogleSignIn();

  Future<User?> signInWithGoogle() async {
    final GoogleSignInAccount? googleSignInAccount = await _googleSignIn.signIn();
    if (googleSignInAccount == null) return null;

    final GoogleSignInAuthentication googleSignInAuthentication =
    await googleSignInAccount.authentication;

    final AuthCredential credential = GoogleAuthProvider.credential(
      accessToken: googleSignInAuthentication.accessToken,
      idToken: googleSignInAuthentication.idToken,
    );

    final UserCredential userCredential = await _auth.signInWithCredential(credential);
    notifyListeners();
    return userCredential.user;
  }


  Future<User?> registerKakao(String kakaoId) async {//카카오회원가입
    try {
      final UserCredential result = await _auth
          .createUserWithEmailAndPassword(email: '$kakaoId@kakao.com', password: kakaoId);
      final User? user = result.user;
      tokenSave();
      notifyListeners();
      return user;
    } catch (e) {
      print(e);
      return null;
    }
  }

  
  


}
