import 'package:flutter/material.dart';

enum CardType { red, blue, green, yellow, orange, purple }

class ColorService extends ChangeNotifier {
  final Map<CardType, int> _counts = {
    for (var type in CardType.values) type: 0,
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
      CardType.orange => Colors.orange,
      CardType.purple => Colors.purple,
    };
  }
}

final colorService = ColorService();
