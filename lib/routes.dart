import 'package:flutter/material.dart';
import 'package:sintomed_app/src/ui/screens/index.dart';

import 'package:sintomed_app/src/ui/screens/login_screen.dart';
import 'package:sintomed_app/src/ui/screens/private_app_screen.dart';
import 'package:sintomed_app/src/ui/screens/welcome_screen.dart';
import 'package:sintomed_app/src/ui/screens/splash_screen.dart';

class Routes {
  Routes._();

  static const String home = '/home';
  static const String login = '/login';
  static const String register = '/register';
  static const String splash = '/splash';
  static const String welcome = '/welcome';

  static final routes = <String, WidgetBuilder>{
    home: (BuildContext context) => PrivateAppScreen(),
    login: (BuildContext context) => LoginScreen(),
    splash: (BuildContext context) => SplashScreen(),
    welcome: (BuildContext context) => WelcomeScreen(),
    register: (BuildContext context) => RegisterScreen(),
  };
}
