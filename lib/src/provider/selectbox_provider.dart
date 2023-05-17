import 'package:flutter/material.dart';

class ImageChoice extends ChangeNotifier {
  String? _chosenImage;

  String? get chosenImage => _chosenImage;

  set chosenImage(String? value) {
    _chosenImage = value;
    notifyListeners();
  }
}
