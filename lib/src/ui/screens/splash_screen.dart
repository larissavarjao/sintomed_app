import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sintomed_app/routes.dart';
import 'package:sintomed_app/src/stores/auth/auth_store.dart';
import 'package:sintomed_app/src/ui/widgets/loading_widget.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  AuthStore _authStore;

  @override
  void initState() {
    super.initState();
    startTimer();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    _authStore = Provider.of<AuthStore>(context);
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
    var _duration = Duration(milliseconds: 2000);
    return Timer(_duration, navigate);
  }

  navigate() async {
    bool isLogged = await _authStore.isLoggedIn();
    if (isLogged) {
      Navigator.of(context).pushReplacementNamed(Routes.home);
    } else {
      Navigator.of(context).pushReplacementNamed(Routes.welcome);
    }
  }
}
