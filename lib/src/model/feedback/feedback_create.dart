class FeedbackCreate
{
  String? user_code;
  String? date;
  String? grade;
  String? contents;



  Map<String, dynamic> toMap() {
    return {
      'user_code': user_code,
      'date': date,
      'grade': grade,
      'contents': contents,
    };
  }

  factory FeedbackCreate.fromMap(Map<String, dynamic> map) {
    return FeedbackCreate(
      user_code: map['user_code'],
      date: map['date'],
      grade: map['grade'],
      contents: map['contents'],
    );
  }

  FeedbackCreate({required this.user_code, required this.date, required this.grade, required this.contents});
  
}