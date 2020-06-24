import 'package:flutter/material.dart';

import 'package:sintomed_app/src/ui/screens/login_screen.dart';
import 'package:sintomed_app/src/ui/screens/home_screen.dart';
import 'package:sintomed_app/src/ui/screens/welcome_screen.dart';
import 'package:sintomed_app/src/ui/screens/splash_screen.dart';

class Routes {
  Routes._();

  static const String splash = '/splash';
  static const String login = '/login';
  static const String home = '/home';
  static const String welcome = '/welcome';

  static final routes = <String, WidgetBuilder>{
    splash: (BuildContext context) => SplashScreen(),
    login: (BuildContext context) => LoginScreen(),
    home: (BuildContext context) => HomeScreen(),
    welcome: (BuildContext context) => WelcomeScreen(),
  };
}
