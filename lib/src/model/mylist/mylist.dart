
import 'dart:convert';

class MyList {
  String? usercode;

  String? title;
  String? subtitle;
  int? color;
  String? data;
  String? grade;

  MyList({required this.usercode, required this.title, required this.subtitle, required this.color, required this.data, required this.grade});
  //String contents;

  Map<String, dynamic> toMap() => {
    'usercode': this.usercode,
    'title': this.title,
    'subtitle': this.subtitle,
    'color': this.color,
    'data': this.data,
    'grade': this.grade
  };

  factory MyList.fromJson(Map<String, dynamic> parsedJson){
    return MyList(
        usercode : parsedJson['usercode'],
        title : parsedJson['title'],
        subtitle : parsedJson['subtitle'],
        color : parsedJson['color'],
        data : parsedJson['data'],
        grade : parsedJson['grade']
    );
  }






}
