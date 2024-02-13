import 'package:flutter/material.dart';

const Color _customColor = Color(0xFFE0E0E0);

const List<Color> _colorThemes = [
  _customColor,
  Colors.blue,
  Colors.teal,
  Colors.purple,
  Colors.red,
  Colors.green,
  Colors.orange,
  Colors.pink,
];

class AppTheme {
  ThemeData theme() {
    return ThemeData(
      colorSchemeSeed: _colorThemes[0],
    );
  }
}
