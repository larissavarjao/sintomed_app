import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sintomed_app/routes.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:sintomed_app/src/stores/symptom/symptom_store.dart';
import 'package:sintomed_app/src/stores/auth/auth_store.dart';
import 'package:sintomed_app/src/stores/symptom_generic/symptom_generic_store.dart';
import 'package:sintomed_app/src/ui/screens/splash_screen.dart';
import 'package:sintomed_app/src/utils/colors.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final SymptomStore _symptomStore = SymptomStore();
  final AuthStore _authStore = AuthStore();
  final SymptomGenericStore _symptomsGenericsStore = SymptomGenericStore();

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<SymptomStore>.value(value: _symptomStore),
        Provider<SymptomGenericStore>.value(value: _symptomsGenericsStore),
        Provider<AuthStore>.value(value: _authStore),
      ],
      child: MaterialApp(
        title: 'Sintomed',
        routes: Routes.routes,
        localizationsDelegates: [
          GlobalMaterialLocalizations.delegate,
        ],
        supportedLocales: [
          const Locale('pt'),
        ],
        theme: ThemeData(
          primaryColor: kPrimaryColor.shade900,
          fontFamily: 'Montserrat',
          backgroundColor: Colors.white,
          scaffoldBackgroundColor: Colors.white,
          primarySwatch: kPrimaryColor,
          colorScheme: ColorScheme.light(
            primary: kPrimaryColor,
          ),
        ),
        home: SplashScreen(),
      ),
    );
  }
}
