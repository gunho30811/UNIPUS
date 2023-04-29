
import 'dart:convert';

class MyList {
  String? usercode;

  String? title;
  String? subtitle;
  int? color;
  String? data;
  String? grade;

  // MyList(this.usercode, this.title, this.subtitle, this.color, this.data,
  //     this.grade, {required usercode});
  MyList({required this.usercode, required this.title, required this.subtitle, required this.color, required this.data, required this.grade});
  

  Map<String, dynamic> toMap()
  {
    return
      {
        'usercode': this.usercode,
        'title': this.title,
        'subtitle': this.subtitle,
        'color': this.color,
        'data': this.data,
        'grade': this.grade
      };
  }


  factory MyList.fromMap(Map<String, dynamic> map) {
    return MyList(
        usercode : map['usercode'],
        title : map['title'],
        subtitle : map['subtitle'],
        color : map['color'],
        data : map['data'],
        grade : map['grade']
    );
  }
  

  // factory MyList.fromJson(Map<String, dynamic> parsedJson){
  //   return MyList(
  //       usercode : map['usercode'],
  //       title : map['title'],
  //       subtitle : map['subtitle'],
  //       color : map['color'],
  //       data : map['data'],
  //       grade : map['grade']
  //   );
  // }

}
