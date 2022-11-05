import 'package:flutter/material.dart';
import '../screens/screens.dart';

class AppRoutes{

  static const initialRoute = 'checking';
  static Map<String, Widget Function(BuildContext)> routes = {
      'home'      : ( BuildContext context) =>  HomeScreen(),
      'login'  : ( BuildContext context) =>  LoginScreen(),
      'comic'  : ( BuildContext context) =>  ComicScreen(),
      };
}