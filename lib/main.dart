import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sintomed_app/routes.dart';
import 'package:sintomed_app/src/stores/syntom/syntom_store.dart';
import 'package:sintomed_app/src/stores/auth/auth_store.dart';
import 'package:sintomed_app/src/ui/screens/splash_screen.dart';
import 'package:sintomed_app/src/utils/colors.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final SyntomStore _syntomStore = SyntomStore();
  final AuthStore _authStore = AuthStore();

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<SyntomStore>.value(value: _syntomStore),
        Provider<AuthStore>.value(value: _authStore),
      ],
      child: MaterialApp(
        title: 'Sintomed',
        routes: Routes.routes,
        theme: ThemeData(
          primaryColor: kPrimaryColor.shade900,
          fontFamily: 'Montserrat',
          backgroundColor: Colors.white,
          scaffoldBackgroundColor: Colors.white,
        ),
        home: SplashScreen(),
      ),
    );
  }
}
