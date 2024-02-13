import 'package:flutter/material.dart';

const Color _customColor = Color(0xFF706CC3);

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
  final int selectedColor;

  const AppTheme({this.selectedColor = 0})
      : assert(selectedColor >= 0,
            'selectedColor must be greater than or equal to 0'),
        assert(selectedColor < _colorThemes.length,
            'selectedColor must be less than ${_colorThemes.length}');
  ThemeData theme() {
    return ThemeData(
      colorSchemeSeed: _colorThemes[selectedColor],
      // brightness: Brightness.dark,
    );
  }
}
