import 'package:flutter/material.dart';

enum CardType { red, blue, green, yellow }

class ColorService extends ChangeNotifier {
  final Map<CardType, int> _counts = {
    CardType.red: 0,
    CardType.blue: 0,
    CardType.green: 0,
    CardType.yellow: 0,
  };

  int getCount(CardType type) => _counts[type] ?? 0;

  void increment(CardType type) {
    _counts[type] = (_counts[type] ?? 0) + 1;
    notifyListeners();
  }

  Color getColor(CardType type) {
    return switch (type) {
      CardType.red => Colors.red,
      CardType.blue => Colors.blue,
      CardType.green => Colors.green,
      CardType.yellow => Colors.yellow,
    };
  }
}

final colorService = ColorService();
