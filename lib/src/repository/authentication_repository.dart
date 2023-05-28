import 'dart:convert';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../model/authentication/http/user_create.dart';
import '../model/authentication/http/user_infomation.dart';
import '../model/response/success.dart';


class AuthenticationRepository {
  final String apiUrl = 'https://port-0-churcalendar-server-lhe2bli5s2qv8.sel4.cloudtype.app';

  late SharedPreferences prefs;


  void init()
  {
    SharedPreferences.getInstance().then((value) {
      prefs = value;
    });
    String? token = prefs.getString('token');
    print("토큰 : \n$token");
  }


  Future<Success> createUserInfo(UserCreate userCreate) async {
    String Url = apiUrl+'/api/v1/user/register';
    final response = await http.get(Uri.parse(Url));

    if (response.statusCode == 200) {
      final responseBody = json.decode(response.body) as Success;
      String? result = responseBody.success;
      print('회원가입 통신결과 : $result');
      return responseBody;
    } else{
      String? result = response.statusCode.toString();
      print('통신오류 : $result');
      throw Exception('Failed to create userInfo');
    }
  }

  Future<String> test() async {
    String testUrl = 'https://infuser.odcloud.kr/oas/docs?namespace=15084647/v1';
    final response = await http.post(Uri.parse(testUrl));

    if (response.statusCode == 200) {
      final responseBody = json.decode(response.body) as String;
      String? result = responseBody;
      print('회원가입 통신결과 : $result');
      return responseBody;
    } else{
      String? result = response.statusCode.toString();
      print('통신오류 : $result');
      throw Exception('Failed to create userInfo');
    }
  }


  Future<void> UpdateUser(UserCreate user) async {
    UserCreate userCreate1 = UserCreate(name: '채현수', gender: 'male', birth: '1999-08-03', phone: '010-2111-3250', group: 'single');
    try {
      String Url = apiUrl+'/api/v1/user/me';
      final userData = userCreate1.toMap();

      String? token = prefs.getString('token');
      final response = await http.patch(
        Uri.parse(Url),
        body: json.encode(userData),
        headers: {'Content-Type': 'application/json','Authorization': '$token'},
      );

      if (response.statusCode == 200) {
        print('사용자 정보가 성공적으로 서버로 전송되었습니다.');
      } else {
        String? result = response.statusCode.toString();
        print('통신오류 : $result');
        throw Exception('Failed to send user to server');
      }
    } catch (e) {
      print('오류가 발생했습니다: $e');
    }
  }

  Future<UserInfomation> getUserInfo() async {
    String Url = apiUrl+'/api/v1/user/register';
    String? token = prefs.getString('token');
    final response = await http.get(
      Uri.parse(Url),
      headers: {'Content-Type': 'application/json','Authorization': '$token'},
    );

    if (response.statusCode == 200) {
      final responseBody = json.decode(response.body) as UserInfomation;
      String? result = responseBody.toString();
      print('회원가입 통신결과 : $result');
      return responseBody;
    } else{
      String? result = response.statusCode.toString();
      print('통신오류 : $result');
      throw Exception('Failed to create userInfo');
    }
  }

  Future<Success> deleteUser() async {
    String Url = apiUrl+'/api/v1/user/me';
    final response = await http.delete(Uri.parse(Url));

    if (response.statusCode == 200) {
      final responseBody = json.decode(response.body) as Success;
      String? result = responseBody.success;
      print('회원가입 통신결과 : $result');
      return responseBody;
    } else{
      String? result = response.statusCode.toString();
      print('통신오류 : $result');
      throw Exception('Failed to create userInfo');
    }
  }




}