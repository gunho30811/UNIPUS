class Fail {


  String? success;
  String? message;


  Map<String, dynamic> toMap() {
    return
      {
        'success': success,
        'message': message,
      };
  }


  factory Fail.fromMap(Map<String, dynamic> map) {
    return Fail(
      success: map['success'],
      message: map['message'],

    );
  }

  Fail({
    required this.success,
    required this.message});
}