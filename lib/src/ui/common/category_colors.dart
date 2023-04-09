import 'package:flutter/material.dart';

Color getColorFromCategoryName(String categoryName) {
  final Map<String, Color> colorMap = {
    'Red': const Color(0xffE66F51),
    'Orange': const Color(0xffED94A6),
    'Yellow': const Color(0xffFDE36A),
    'Green': const Color(0xffFAAD5D),
    'Blue': const Color(0xffF1D7CA),
    'Indigo': const Color(0xffD3BD9D),
    'Purple': const Color(0xffD9D9D9),
    'Pink': const Color(0xff6B6D6A),
    'Teal': const Color(0xffB5CCDC),
    'Brown': const Color(0xff806050),
  };
  final Color? color = colorMap[categoryName];
  if (color == null) {
    throw ArgumentError('Invalid category name: $categoryName');
  }
  return color;
}
