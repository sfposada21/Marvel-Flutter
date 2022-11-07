import 'package:flutter/material.dart';
import '../screens/screens.dart';

class AppRoutes{

  static const initialRoute = 'register';
  static Map<String, Widget Function(BuildContext)> routes = {
      'home'      : ( BuildContext context) =>  HomeScreen(),
      'login'  : ( BuildContext context) =>  LoginScreen(),
      'comic'  : ( BuildContext context) =>  ComicScreen(),      
      'favorite'  : ( BuildContext context) =>  FavoriteScreen(),
      'checking'  : ( BuildContext context) =>  ChekingScreen(),      
      'register'  : ( BuildContext context) =>  RegisterScreen(),
      };
}