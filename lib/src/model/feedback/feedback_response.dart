class FeedbackResponse
{
  String? date;
  String? author;
  String? grade;
  String? contents;

  Map<String, dynamic> toMap() {
    return {
      'date': date,
      'author': author,
      'grade': grade,
      'contents': contents,
    };
  }

  factory FeedbackResponse.fromMap(Map<String, dynamic> map) {
    return FeedbackResponse(
      date: map['date'],
      author: map['author'],
      grade: map['grade'],
      contents: map['contents'],
    );
  }

  FeedbackResponse({required this.date, required this.author, required this.grade, required this.contents});

}