// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

const colorList = [
  Colors.blue,
  Colors.teal,
  Colors.green,
  Colors.red,
  Colors.purple,
  Colors.deepPurple,
  Colors.orange,
  Colors.pink,
  Colors.pinkAccent,
];

class AppTheme {
  AppTheme({
    this.selectedColor = 0,
    required this.isDarkMode,
  }) : assert(
          selectedColor >= 0 && selectedColor < colorList.length,
        );

  final int selectedColor;
  final bool isDarkMode;

  ThemeData getTheme() {
    return ThemeData(
      brightness: isDarkMode ? Brightness.dark : Brightness.light,
      useMaterial3: true,
      colorSchemeSeed: colorList[selectedColor],
      appBarTheme: const AppBarTheme(
        centerTitle: true,
      ),
    );
  }

  AppTheme copyWith({
    int? selectedColor,
    bool? isDarkMode,
  }) {
    return AppTheme(
      selectedColor: selectedColor ?? this.selectedColor,
      isDarkMode: isDarkMode ?? this.isDarkMode,
    );
  }
}
