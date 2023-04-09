class UserCreate
{
  String? user_code;
  String? group;
  String? email;
  String? name;
  String? gender;
  String? birth_date;
  String? phone;


  Map<String, dynamic> toMap() {
    return {
      'user_code': user_code,
      'group': group,
      'email': email,
      'name': name,
      'gender': gender,
      'birth_date': birth_date,
      'phone': phone
    };
  }

  factory UserCreate.fromMap(Map<String, dynamic> map) {
    return UserCreate(
        user_code: map['user_code'],
        group: map['group'],
        email: map['email'],
        name: map['name'],
        gender: map['gender'],
        birth_date: map['birth_date'],
        phone: map['phone']
    );
  }
  UserCreate({required this.user_code, required this.group, required this.email, required this.name, required this.gender, required this.birth_date, required this.phone});

}