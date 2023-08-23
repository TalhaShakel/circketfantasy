import 'package:flutter/material.dart';
import 'package:tempalteflutter/modules/home/homeScreen.dart';
import 'package:tempalteflutter/modules/home/tabScreen.dart';
import 'package:tempalteflutter/modules/login/loginScreen.dart';
import 'package:tempalteflutter/modules/splash/SplashScreen.dart';

class Routes {
  static const String SPLASH = "/";
  static const String HOME = "/home/homeScreen";
  static const String OTP = "/login/otpValidationScreen";
  static const String TAB = '/home/tabScreen';

  static const String LOGIN = "/login/loginScreen";

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case LOGIN:
        return MaterialPageRoute(builder: (_) => LoginScreen());
      case SPLASH:
        return MaterialPageRoute(builder: (_) => SplashScreen());
      case HOME:
        return MaterialPageRoute(builder: (_) => HomeScreen());
      case TAB:
        return MaterialPageRoute(builder: (_) => TabScreen());
      default:
        // Handle unknown routes
        return MaterialPageRoute(builder: (_) => SplashScreen());
    }
  }
}
