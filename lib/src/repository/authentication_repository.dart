import 'dart:convert';
import 'package:chur/src/model/http/success.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:http/http.dart' as http;


class AuthenticationRepository {
  final String apiUrl = 'https://example.com/api/userInfos';


  Future<Success> createUserInfo(UserInfo userInfo) async {
    final response = await http.post(Uri.parse(apiUrl));

    if (response.statusCode == 200) {
      final responseBody = json.decode(response.body) as Success;
      return responseBody;
    } else {
      throw Exception('Failed to create userInfo');
    }
  }
}