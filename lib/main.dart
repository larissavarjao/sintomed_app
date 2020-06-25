import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';
import 'package:sintomed_app/routes.dart';
import 'package:sintomed_app/src/stores/syntom/syntom_store.dart';
import 'package:sintomed_app/src/ui/screens/splash_screen.dart';
import 'package:sintomed_app/src/utils/colors.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final SyntomStore _syntomStore = SyntomStore();

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<SyntomStore>.value(value: _syntomStore),
      ],
      child: Observer(
        builder: (context) {
          return MaterialApp(
            title: 'Sintomed',
            routes: Routes.routes,
            theme: ThemeData(
              primaryColor: kPrimaryColor.shade900,
              fontFamily: 'Montserrat',
              primarySwatch: kPrimaryColor,
              backgroundColor: Colors.white,
              scaffoldBackgroundColor: Colors.white,
            ),
            home: SplashScreen(),
          );
        },
      ),
    );
  }
}
