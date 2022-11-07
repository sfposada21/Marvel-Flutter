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

class ColorsApp {
  static const Color gremory = Color.fromARGB(255, 90, 41, 48) ;
  static const Color red = Color.fromARGB(255, 197, 40, 40);
}

class InputDecorations {
  static InputDecoration authInputDecoracion({
    required String hintText,
    required String labelText,
    IconData? prefixIcon,
  }) {
    return InputDecoration(
        enabledBorder:
            const UnderlineInputBorder(borderSide: BorderSide(color: ColorsApp.gremory )),
        focusedBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: ColorsApp.gremory , width: 2),
        ),
        hintText: hintText,
        labelText: labelText,
        labelStyle: const TextStyle(color: Colors.grey),
        prefixIcon: prefixIcon != null ? Icon(prefixIcon, color: ColorsApp.gremory ) : null        
        );
  }
}
