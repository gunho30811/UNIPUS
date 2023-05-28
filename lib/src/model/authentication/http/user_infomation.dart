import 'mento.dart';

class UserInfomation
{
  String? id;
  String? uid;
  String? group;
  String? email;
  String? name;
  String? gender;
  String? birth;
  String? phone;
  String? fcm_tokens;
  List<Mento> mento;
  String createAt;



  Map<String, dynamic> toMap() {
    return {
      '_id': id,
      'uid': uid,
      'group': group,
      'email': email,
      'name': name,
      'gender': gender,
      'birth': birth,
      'phone': phone,
      'fcm_tokens': fcm_tokens,
      'mento': mento,
      'createAt': createAt
    };
  }

  factory UserInfomation.fromMap(Map<String, dynamic> map) {
    return UserInfomation(
        id: map['_id'],
        uid: map['uid'],
        group: map['group'],
        email: map['email'],
        name: map['name'],
        gender: map['gender'],
        birth: map['birth'],
        phone: map['phone'],
        fcm_tokens: map['fcm_tokens'],
        mento: map['mento'],
        createAt: map['createAt']
    );
  }
  UserInfomation({
    required this.id,
    required this.uid,
    required this.group,
    required this.email,
    required this.name,
    required this.gender,
    required this.birth,
    required this.phone,
    required this.fcm_tokens,
    required this.mento,
    required this.createAt,});

}