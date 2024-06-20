import 'dart:math';

import 'package:flutter/material.dart';

class RandomizerChangeNotifier extends ChangeNotifier {
  int min = 0, max = 0;
  final _randomGenerator = Random();

  int? _generatedNumber;

  int? get generatedRandomNumber => _generatedNumber;

  void generateRandomNumber() {
    _generatedNumber = min + _randomGenerator.nextInt((max - min) + 1);

    notifyListeners();
    //after this we removed hooker dependency and added provider
    //then we need to make this class available in our widget tree by adding to the top of the tree(MaterialApp)
    //by wrapping MP with provider
  }
}
