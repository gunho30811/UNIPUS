import 'package:flutter/material.dart';
import '../model/catbox/character.dart';

class CharacterProvider with ChangeNotifier {
  CharacterModel character = CharacterModel(
    itemCounts: [3, 4, 5],
    exp: 0,
    characterImages: [
      'assets/images/cat_01.png',
      'assets/images/cat_02.png',
      'assets/images/cat_03.png'
    ],
    currentImage: 'assets/images/cat_01.png',
  );

  void useItem(int index) {
    if (character.itemCounts[index] > 0) {
      character.itemCounts[index]--;
      character.exp++;
      updateCharacterImage();
      notifyListeners();
    }
  }

  void updateCharacterImage() {
    if (character.exp >= 1 && character.exp <= 5) {
      character.currentImage = character.characterImages[0];
    } else if (character.exp >= 6 && character.exp <= 15) {
      character.currentImage = character.characterImages[1];
    } else if (character.exp >= 16 && character.exp <= 30) {
      character.currentImage = character.characterImages[2];
    }
  }

  double getExpBarValue() {
    if (character.exp >= 1 && character.exp <= 5) {
      return character.exp / 5;
    } else if (character.exp >= 6 && character.exp <= 15) {
      return (character.exp - 5) / 10;
    } else if (character.exp >= 16 && character.exp <= 30) {
      return (character.exp - 15) / 15;
    } else {
      return 0;
    }
  }
}
