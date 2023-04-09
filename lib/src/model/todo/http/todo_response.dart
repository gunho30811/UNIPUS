class TodoResponse
{
  int? no;
  String? title;
  String? category_no;
  String? start_date;
  String? end_date;
  String? rep_by;
  String? notify_before_min;
  String? memo;
  String? in_hecklist;




  Map<String, dynamic> toMap()
  {
    return
      {
        'no' : no,
        'title': title,
        'category_no': category_no,
        'start_date': start_date,
        'end_date': end_date,
        'rep_by': rep_by,
        'notify_before_min': notify_before_min,
        'memo': memo,
        'in_hecklist': in_hecklist
      };
  }


  factory TodoResponse.fromMap(Map<String, dynamic> map) {
    return TodoResponse(
        no: map['no'],
        title: map['title'],
        category_no: map['category_no'],
        start_date: map['start_date'],
        end_date: map['end_date'],
        rep_by: map['rep_by'],
        notify_before_min: map['notify_before_min'],
        memo: map['memo'],
        in_hecklist: map['in_hecklist']
    );
  }

  TodoResponse({
    required this.no,
    required this.title,
    required this.category_no,
    required this.start_date,
    required this.end_date,
    required this.rep_by,
    required this.notify_before_min,
    required this.memo,
    required this.in_hecklist});
}