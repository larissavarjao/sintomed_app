import 'package:flutter/material.dart';
import 'package:sintomed_app/src/models/symptom_model.dart';
import 'package:sintomed_app/src/ui/pages/symptoms/symptom_details_page.dart';
import 'package:sintomed_app/src/ui/widgets/button_widget.dart';
// import 'package:sintomed_app/src/ui/widgets/type_icon_widget.dart';
import 'package:sintomed_app/src/utils/colors.dart';

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

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            fullscreenDialog: true,
            builder: (context) => SymptomDetailsPage(
              symptom: symptom,
            ),
          ),
        );
      },
      child: Container(
        margin: EdgeInsets.fromLTRB(24.0, 10.0, 24.0, 10.0),
        decoration: BoxDecoration(
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
        ),
        padding: EdgeInsets.symmetric(vertical: 5.0, horizontal: 16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Column(
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
                ),
                SizedBox(
                  width: 16.0,
                ),
                Column(
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
                ),
              ],
            ),
            // TypeIconWidget(symptom: symptom, size: 50.0, type: 'square'),
          ],
        ),
      ),
    );
  }
}
