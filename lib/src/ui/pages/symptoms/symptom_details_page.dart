import 'package:flutter/material.dart';
import 'package:sintomed_app/src/models/symptom_model.dart';
import 'package:sintomed_app/src/ui/widgets/type_icon_widget.dart';

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
          Expanded(
            child: TypeIconWidget(
              symptom: symptom,
              size: double.infinity,
              type: 'page',
            ),
          ),
          Text(symptom.name),
        ],
      ),
    );
  }
}
