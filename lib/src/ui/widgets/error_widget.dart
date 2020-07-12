import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sintomed_app/src/ui/widgets/button_widget.dart';
import 'package:sintomed_app/src/utils/colors.dart';

class ErroWidget extends StatelessWidget {
  final dynamic onPressed;

  ErroWidget([this.onPressed]);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Container(
          height: 250.0,
          child: SvgPicture.asset(
            'images/404.svg',
            alignment: Alignment.center,
            fit: BoxFit.contain,
          ),
        ),
        SizedBox(
          height: 24.0,
        ),
        Text(
          'Ocorreu um erro!',
          style: TextStyle(
            color: kBlackColor,
            fontWeight: FontWeight.w700,
            fontSize: 24.0,
          ),
        ),
        SizedBox(
          height: 12.0,
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 42.0),
          child: Text(
            'Parece que ocorreu um erro. Por favor, tente novamente mais tarde!',
            style: TextStyle(
              color: kGrayColor,
              fontWeight: FontWeight.w500,
              fontSize: 18.0,
            ),
            textAlign: TextAlign.center,
          ),
        ),
        SizedBox(
          height: 24.0,
        ),
        onPressed != null
            ? ButtonWidget(
                onPressed: onPressed,
                text: 'Recarregar',
                type: ButtonType.raised,
              )
            : SizedBox(),
      ],
    );
  }
}
