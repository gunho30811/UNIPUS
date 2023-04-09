class TodoCreate
{
  String? title;
  String? category_no;
  String? start_date;
  String? end_date;
  String? rep_by;//일 단위 주 단위 ex) none/day/week
  String? notify_before_min;//알람 몇분전
  String? memo;
  String? in_hecklist;



  Map<String, dynamic> toMap()
  {
    return
      {
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


  factory TodoCreate.fromMap(Map<String, dynamic> map) {
    return TodoCreate(
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

  TodoCreate({
    required this.title,
    required this.category_no,
    required this.start_date,
    required this.end_date,
    required this.rep_by,
    required this.notify_before_min,
    required this.memo,
    required this.in_hecklist});


}