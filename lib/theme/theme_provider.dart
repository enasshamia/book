
import 'package:flutter/material.dart';

class MyThemes {
  static final darkthem = ThemeData(
    scaffoldBackgroundColor: Colors.grey.shade900,
    colorScheme: const ColorScheme.dark()
  );
  static final lightheme = ThemeData(
    scaffoldBackgroundColor: Colors.white,
    colorScheme: const ColorScheme.light()
  );
}