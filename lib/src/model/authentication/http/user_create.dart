class UserCreate
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

  factory UserCreate.fromMap(Map<String, dynamic> map) {
    return UserCreate(
      name: map['name'],
      gender: map['gender'],
      birth: map['birth'],
      phone: map['phone'],
      group: map['group'],
    );
  }

  UserCreate({required this.name, required this.gender, required this.birth, required this.phone, required this.group});


}