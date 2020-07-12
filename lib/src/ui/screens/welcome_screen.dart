import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sintomed_app/routes.dart';
import 'package:sintomed_app/src/ui/widgets/button_widget.dart';
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
            Text(
              'Não se esqueça nada',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 12.0,
            ),
            Text(
              'Deixe que lembramos de tudo para você, em qualquer lugar, na palma da sua mão',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.w400,
                color: kGrayColor,
              ),
            ),
            SizedBox(
              height: 48.0,
            ),
            ButtonWidget(
              text: 'Cadastrar',
              onPressed: () {
                Navigator.pushNamed(context, Routes.register);
              },
              type: ButtonType.outline,
            ),
            ButtonWidget(
              onPressed: () {
                Navigator.pushNamed(context, Routes.login);
              },
              text: 'Entrar',
              type: ButtonType.raised,
            ),
          ],
        ),
      ),
    );
  }
}
