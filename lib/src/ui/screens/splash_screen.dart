import 'dart:async';

import 'package:flutter/material.dart';
import 'package:sintomed_app/routes.dart';
import 'package:sintomed_app/src/ui/widgets/loading_widget.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    startTimer();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Center(
        child: LoadingWidget(),
      ),
    );
  }

  startTimer() {
    var _duration = Duration(milliseconds: 5000);
    return Timer(_duration, navigate);
  }

  navigate() {
    bool isLoggedIn = true;

    if (isLoggedIn) {
      Navigator.of(context).pushReplacementNamed(Routes.home);
    } else {
      Navigator.of(context).pushReplacementNamed(Routes.welcome);
    }
  }
}
