import 'package:flutter/material.dart';
import 'package:sintomed_app/src/models/symptom_model.dart';
import 'package:sintomed_app/src/ui/pages/symptoms/symptom_details_page.dart';
import 'package:sintomed_app/src/ui/widgets/button_widget.dart';
import 'package:sintomed_app/src/ui/widgets/type_icon_widget.dart';
import 'package:sintomed_app/src/utils/colors.dart';

class SymptomCard extends StatelessWidget {
  final Symptom symptom;

  SymptomCard({this.symptom});

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
      child: Card(
        shadowColor: kGrayColor,
        margin: EdgeInsets.symmetric(vertical: 10.0),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(kBorderRadiusButton),
          side: BorderSide(color: kPrimaryColor.shade100, width: 0.5),
        ),
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 5.0, horizontal: 16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
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
                  SizedBox(
                    width: 12.0,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        '${symptom.name}',
                        style: TextStyle(
                          fontSize: 15.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        '${symptom.createdAt}',
                      ),
                    ],
                  ),
                ],
              ),
              TypeIconWidget(symptom: symptom, size: 50.0, type: 'square'),
            ],
          ),
        ),
      ),
    );
  }
}
