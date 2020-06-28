import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:sintomed_app/routes.dart';
import 'package:sintomed_app/src/ui/widgets/outline_rounded_button_widget.dart';
import 'package:sintomed_app/src/ui/widgets/rounded_button_widget.dart';
import 'package:sintomed_app/src/utils/colors.dart';

class WelcomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFFFFFF),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 42.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            TypewriterAnimatedTextKit(
              speed: Duration(milliseconds: 100),
              text: [
                'A gente te ajuda a organizar tudo sobre seu histórico médico',
              ],
              textAlign: TextAlign.center,
              textStyle: TextStyle(
                fontSize: 22.0,
                fontWeight: FontWeight.w500,
                color: kPrimaryColor.shade900,
                letterSpacing: 1.1,
              ),
              totalRepeatCount: 1,
            ),
            SizedBox(
              height: 48.0,
            ),
            Image(
              image: AssetImage('images/medicine.png'),
            ),
            SizedBox(
              height: 48.0,
            ),
            OutlineRoundedButtonWidget(
              text: 'Cadastrar',
              onPressed: () {
                Navigator.pushNamed(context, Routes.register);
              },
            ),
            RoundedButtonWidget(
              onPressed: () {
                Navigator.pushNamed(context, Routes.login);
              },
              text: 'Entrar',
            ),
          ],
        ),
      ),
    );
  }
}
