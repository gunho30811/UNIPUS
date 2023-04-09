class UserUpdate
{
  String? group;
  String? email;
  String? name;
  String? gender;
  String? birth;
  String? phone;


  Map<String, dynamic> toMap() {
    return {
      'group': group,
      'email': email,
      'name': name,
      'gender': gender,
      'birth': birth,
      'phone': phone,
    };
  }

  factory UserUpdate.fromMap(Map<String, dynamic> map) {
    return UserUpdate(
      group: map['group'],
      email: map['email'],
      name: map['name'],
      gender: map['gender'],
      birth: map['birth'],
      phone: map['phone'],
    );
  }

  UserUpdate({required this.group, required this.email, required this.name, required this.gender, required this.birth, required this.phone});
}