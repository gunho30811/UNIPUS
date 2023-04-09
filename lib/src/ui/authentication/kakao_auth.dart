import 'package:flutter/material.dart';
import 'package:kakao_flutter_sdk/kakao_flutter_sdk.dart';
import 'package:firebase_auth/firebase_auth.dart';

//
// Future<User?> signInWithKakao() async {
//   final installed = await isKakaoTalkInstalled();
//   final authCode = installed
//       ? await AuthCodeClient.instance.requestWithTalk()
//       : await AuthCodeClient.instance.request();
//
//   AccessTokenResponse? token;
//   try {
//     token = await AuthApi.instance.issueAccessToken(authCode);
//     AccessTokenStore.instance.toStore(token);
//   } catch (e) {
//     print('Error in issuing access token: $e');
//   }
//
//   if (token == null) return null;
//
//   final UserResponse userResponse = await UserApi.instance.me();
//
//   final AuthCredential credential = OAuthProvider("kakao.com").credential(
//     accessToken: token.accessToken,
//   );
//
//   final UserCredential userCredential = await FirebaseAuth.instance.signInWithCredential(credential);
//   return userCredential.user;
// }
Future<String?> Kakao(BuildContext context) async {
  try {
    // Firebase Authentication 이메일/비밀번호 로그인을 시도하기 위해 Kakao 계정 정보 가져오기
    final result = await UserApi.instance.loginWithKakaoTalk();
    final profile = await UserApi.instance.me();
    final kakaoId = profile.id.toString();

    // Firebase Authentication의 이메일/비밀번호 로그인을 시도합니다.
    return kakaoId;
  } catch (e) {
    // 로그인 실패 처리
    return null;
  }
}
