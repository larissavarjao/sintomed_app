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
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(symptom.name),
        ],
      ),
    );
  }
}
