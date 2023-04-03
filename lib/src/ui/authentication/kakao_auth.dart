// import 'package:kakao_flutter_sdk/auth.dart';
// import 'package:kakao_flutter_sdk/user.dart';
// import 'package:firebase_auth/firebase_auth.dart';
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
