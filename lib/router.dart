import 'package:amazon_clone/features/auth/screens/auth_screen.dart';
import 'package:amazon_clone/features/auth/screens/register_screen.dart';
import 'package:amazon_clone/pages/home_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:amazon_clone/features/auth/services/auth_screen_ser.dart';

Route<dynamic> generateRoute(RouteSettings routeSettings) {
  switch (routeSettings.name) {
    case AuthScreen.routeName:
      return MaterialPageRoute(
          settings: routeSettings, builder: (_) => const AuthScreen());
    case RegisterScreen.routeName:
      return MaterialPageRoute(
          settings: routeSettings, builder: (_) => const RegisterScreen());
    case HomePageReal.routeName:
      return MaterialPageRoute(
          settings: routeSettings, builder: (_) => const HomePageReal());
    default:
      return MaterialPageRoute(
          settings: routeSettings,
          builder: (_) => Scaffold(
                body: Center(child: Text('Screen not exist!')),
              ));
  }
}
