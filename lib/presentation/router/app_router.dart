import 'package:flutter/material.dart';
import 'package:senanonim/presentation/screens/chat.dart';
import 'package:senanonim/presentation/screens/home.dart';
import 'package:senanonim/presentation/screens/wellcome.dart';

class AppRouter{
  Route? onGenerateRoute(RouteSettings routeSettings){
    switch (routeSettings.name){
      case '/':
      return MaterialPageRoute(
        builder: (_) => Wellcome()
        );
        case '/home':
      return MaterialPageRoute(
        builder: (_) => HomeScreen()
        );
        case '/chat':
      return MaterialPageRoute(
        builder: (_) => ChatScreen()
        );
        default: 
        return null;
    }
  } 
}