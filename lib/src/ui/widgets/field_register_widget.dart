import 'package:flutter/material.dart';
import 'package:sintomed_app/src/ui/widgets/outline_rounded_button_widget.dart';
import 'package:sintomed_app/src/ui/widgets/rounded_button_widget.dart';
import 'package:sintomed_app/src/utils/colors.dart';

class FieldRegisterWidget extends StatelessWidget {
  final Function onWillPop;
  final String labelText;
  final Function validator;
  final Function onChanged;
  final TextInputType keyboardType;
  final bool obscureText;
  final Function onCancel;
  final Function onContinue;
  final Key formKey;
  final bool isLastForm;
  final double progressValue;

  FieldRegisterWidget({
    this.onWillPop,
    this.labelText,
    this.validator,
    this.onChanged,
    this.keyboardType,
    this.obscureText,
    this.onCancel,
    this.onContinue,
    this.formKey,
    this.isLastForm,
    this.progressValue,
  });

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: onWillPop,
      child: Form(
        key: formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Container(
              child: Column(
                children: <Widget>[
                  LinearProgressIndicator(
                    value: progressValue,
                    backgroundColor: kPrimaryColor.shade200,
                    valueColor: AlwaysStoppedAnimation(kPrimaryColor.shade900),
                  ),
                  TextFormField(
                    cursorColor: kPrimaryColor.shade900,
                    decoration: InputDecoration(labelText: labelText),
                    validator: validator,
                    keyboardType: keyboardType,
                    onChanged: onChanged,
                    obscureText: obscureText == true ? true : false,
                  ),
                ],
              ),
            ),
            Row(
              children: <Widget>[
                Expanded(
                  child: OutlineRoundedButtonWidget(
                    onPressed: onCancel,
                    text: 'Voltar',
                  ),
                ),
                SizedBox(
                  width: 12.0,
                ),
                Expanded(
                  child: RoundedButtonWidget(
                    onPressed: onContinue,
                    text: isLastForm != null && isLastForm == true
                        ? 'Salvar'
                        : 'Próximo',
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
