import 'package:flutter/material.dart';
import 'package:sintomed_app/src/utils/colors.dart';

class RoundedButtonWidget extends StatelessWidget {
  final Function onPressed;
  final String text;

  RoundedButtonWidget({this.onPressed, this.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8.0),
      child: RaisedButton(
        onPressed: onPressed,
        padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 30.0),
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0)),
        color: kPrimaryColor.shade900,
        elevation: 6.0,
        child: Text(
          text.toUpperCase(),
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w600,
            letterSpacing: 1.2,
            fontSize: 17.0,
          ),
        ),
      ),
    );
  }
}
