
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_login/flutter_login.dart';

class Authentication extends ChangeNotifier {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  User? _user;

  User? get user => _user;

  void setUser(User? user) {
    _user = user;
    notifyListeners();
  }

  // Future<String?> login(LoginData data) async {
  //   try {
  //     final UserCredential userCredential = await _auth.signInWithEmailAndPassword(
  //       email: data.name,
  //       password: data.password,
  //     );
  //     setUser(userCredential.user);
  //     return null;
  //   } on FirebaseAuthException catch (e) {
  //     return e.message;
  //   }
  // }
  //
  // Future<String?> signUp(LoginData data) async {
  //   try {
  //     final UserCredential userCredential = await _auth.createUserWithEmailAndPassword(
  //       email: data.name,
  //       password: data.password,
  //     );
  //     setUser(userCredential.user);
  //     return null;
  //   } on FirebaseAuthException catch (e) {
  //     return e.message;
  //   }
  // }











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
}
