import 'package:flutter/material.dart';
import 'package:sintomed_app/src/models/symptom_model.dart';
import 'package:sintomed_app/src/ui/widgets/button_widget.dart';

class TypeIconWidget extends StatelessWidget {
  final Symptom symptom;
  final double size;
  final String type;

  TypeIconWidget({
    this.symptom,
    this.size,
    this.type,
  });

  @override
  Widget build(BuildContext context) {
    print('${symptom.typeName}');
    return Hero(
      tag: 'type_icon${symptom.id}',
      child: ClipRRect(
        borderRadius: BorderRadius.all(
          Radius.circular(kBorderRadiusButton),
        ),
        child: Image.asset(
          'images/${symptom.typeName.toLowerCase()}-$type.png',
          height: size,
        ),
      ),
    );
  }
}
