import 'package:flutter/material.dart';

class AppTheme {

  static const Color primary = Colors.purple;
  static final ThemeData lightTheme = ThemeData.light().copyWith(
    // Color primario
    primaryColor: Colors.purple,        
    // AppBar Theme
    appBarTheme: const AppBarTheme(
      color: primary,
      elevation: 5
    ),   
  );
}

class InputDecorations {
  static InputDecoration authInputDecoracion({
    required String hintText,
    required String labelText,
    IconData? prefixIcon,
  }) {
    return InputDecoration(
        enabledBorder:
            const UnderlineInputBorder(borderSide: BorderSide(color: Colors.purple)),
        focusedBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.purple, width: 2),
        ),
        hintText: hintText,
        labelText: labelText,
        labelStyle: const TextStyle(color: Colors.grey),
        prefixIcon: prefixIcon != null ? Icon(prefixIcon, color: Colors.purple) : null
        
        );
  }
}
