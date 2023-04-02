class UserInfo
{
  String? name;
  String? gender;
  String? birth;
  String? phone;
  String? group;

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'gender': gender,
      'birth': birth,
      'phone': phone,
      'group': group,
    };
  }

  factory UserInfo.fromMap(Map<String, dynamic> map) {
    return UserInfo(
      name: map['name'],
      gender: map['gender'],
      birth: map['birth'],
      phone: map['phone'],
      group: map['group'],
    );
  }

  UserInfo({required this.name, required this.gender, required this.birth, required this.phone, required this.group});


}