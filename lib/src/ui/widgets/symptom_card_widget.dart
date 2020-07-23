import 'package:flutter/material.dart';
import 'package:sintomed_app/src/models/symptom_model.dart';
import 'package:sintomed_app/src/ui/pages/symptoms/symptom_details_page.dart';
import 'package:sintomed_app/src/ui/widgets/button_widget.dart';
import 'package:sintomed_app/src/utils/colors.dart';

BoxDecoration cardDecoration = BoxDecoration(
  color: Colors.white,
  boxShadow: [
    BoxShadow(
      color: Colors.grey.shade100,
      blurRadius: 15.0,
      spreadRadius: 2.0,
      offset: Offset(
        15.0,
        15.0,
      ),
    )
  ],
  border: Border.all(color: kPrimaryColor.shade50, width: 1.0),
  borderRadius: BorderRadius.circular(kBorderRadiusButton),
);

class SymptomCard extends StatelessWidget {
  final Symptom symptom;

  SymptomCard({this.symptom});

  List<String> months = [
    'Janeiro',
    'Fevereiro',
    'Março',
    'Abril',
    'Maio',
    'Junho',
    'Julho',
    'Agosto',
    'Setembro',
    'Outubro',
    'Novembro',
    'Dezembro'
  ];

  void _goToSymptomsDetailsPage(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(
        fullscreenDialog: true,
        builder: (context) => SymptomDetailsPage(
          symptom: symptom,
        ),
      ),
    );
  }

  Widget _getSymptomCardDate() {
    return Column(
      children: <Widget>[
        Text(
          '${symptom.happenedAt.day}',
          style: TextStyle(
            fontSize: 44.0,
            fontWeight: FontWeight.w500,
            color: kPrimaryColor,
            height: 1.0,
          ),
        ),
        Text(
          '${months[symptom.happenedAt.month].toUpperCase().substring(0, 3)}',
          style: TextStyle(
            fontSize: 18.0,
            fontWeight: FontWeight.w500,
            color: Colors.grey,
            height: 1.0,
          ),
        ),
      ],
    );
  }

  Widget _getSymptomCardInfo() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          '${symptom.name}',
          style: TextStyle(
            fontSize: 16.0,
            fontWeight: FontWeight.w700,
            letterSpacing: 0.5,
          ),
        ),
        SizedBox(
          height: 4.0,
        ),
        Text(
          '${symptom.typeName}',
          style: TextStyle(
            fontSize: 14.0,
            fontWeight: FontWeight.w400,
            color: Colors.grey,
            letterSpacing: 0.3,
          ),
        ),
      ],
    );
  }

  List<Widget> _getSymptomCard() {
    return [
      Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          _getSymptomCardDate(),
          SizedBox(
            width: 16.0,
          ),
          _getSymptomCardInfo(),
        ],
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _goToSymptomsDetailsPage(context),
      child: Container(
        margin: EdgeInsets.fromLTRB(24.0, 10.0, 24.0, 10.0),
        decoration: cardDecoration,
        padding: EdgeInsets.symmetric(vertical: 5.0, horizontal: 16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: _getSymptomCard(),
        ),
      ),
    );
  }
}
