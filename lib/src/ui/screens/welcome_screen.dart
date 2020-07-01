import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sintomed_app/routes.dart';
import 'package:sintomed_app/src/ui/widgets/outline_rounded_button_widget.dart';
import 'package:sintomed_app/src/ui/widgets/rounded_button_widget.dart';

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
            SizedBox(
              height: 48.0,
            ),
            Container(
              child: SvgPicture.asset('images/medicine.svg'),
              height: 200.0,
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
