import 'package:flutter/material.dart';
import 'package:sintomed_app/src/utils/colors.dart';

enum DialogType { error, success }

class DialogWidget extends StatelessWidget {
  final String text;
  final DialogType type;

  DialogWidget({this.type, this.text});

  @override
  Widget build(BuildContext context) {
    Color color = type == DialogType.error ? kErrorColor : kSuccessColor;
    return AlertDialog(
      title: Text(
        type == DialogType.error ? 'Erro' : 'Sucesso',
        style: TextStyle(
          fontWeight: FontWeight.w700,
          color: color,
        ),
      ),
      content: SingleChildScrollView(
        child: ListBody(
          children: <Widget>[
            Text(text),
          ],
        ),
      ),
      actions: <Widget>[
        FlatButton(
          child: Text(
            'OK',
            style: TextStyle(
              color: color,
              fontWeight: FontWeight.w900,
            ),
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ],
    );
  }
}
