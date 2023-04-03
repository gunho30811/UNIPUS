
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class Authentication extends ChangeNotifier {
  final FirebaseAuth _auth = FirebaseAuth.instance;

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
      notifyListeners();
      return user;
    } catch (e) {
      print(e);
      return null;
    }
  }



}
