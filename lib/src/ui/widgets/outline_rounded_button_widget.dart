import 'package:flutter/material.dart';
import 'package:sintomed_app/src/utils/colors.dart';

class OutlineRoundedButtonWidget extends StatelessWidget {
  final Function onPressed;
  final String text;

  OutlineRoundedButtonWidget({this.onPressed, this.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8.0),
      child: OutlineButton(
        onPressed: onPressed,
        padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 10.0),
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0)),
        borderSide: BorderSide(color: kPrimaryColor, width: 1.5),
        child: Text(
          text.toUpperCase(),
          style: TextStyle(
            color: kPrimaryColor.shade900,
            fontWeight: FontWeight.w700,
            letterSpacing: 1.2,
          ),
        ),
      ),
    );
  }
}
