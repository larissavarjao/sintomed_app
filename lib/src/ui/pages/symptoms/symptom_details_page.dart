import 'package:flutter/material.dart';
import 'package:sintomed_app/src/models/symptom_model.dart';

class SymptomDetailsPage extends StatelessWidget {
  final Symptom symptom;

  SymptomDetailsPage({this.symptom});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Flexible(
            child: Hero(
              tag: 'type_icon${symptom.id}',
              child: ClipRRect(
                child: Image.asset(
                  'images/long-page.png',
                  height: 200.0,
                  width: double.infinity,
                ),
              ),
            ),
          ),
          Text(symptom.name),
        ],
      ),
    );
  }
}
