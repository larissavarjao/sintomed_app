import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';
import 'package:sintomed_app/src/stores/symptom/symptom_store.dart';
import 'package:sintomed_app/src/ui/widgets/button_widget.dart';
import 'package:sintomed_app/src/utils/constants.dart';

class AddSymptomPage extends StatefulWidget {
  @override
  _AddSymptomPageState createState() => _AddSymptomPageState();
}

class _AddSymptomPageState extends State<AddSymptomPage> {
  SymptomStore _symptomStore;
  final DateFormat formatter = DateFormat(kDatePattern);

  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    _symptomStore = Provider.of<SymptomStore>(context);
  }

  Future<Null> _selectDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2015, 8),
      lastDate: DateTime.now(),
      helpText: 'SELECIONE UMA DATA',
      confirmText: 'OK',
      fieldLabelText: 'Digite uma data',
      fieldHintText: 'DD/MM/AAAA',
      errorInvalidText: 'Digite uma data válida',
      errorFormatText: 'Digite uma data válida',
    );
    if (picked != null && picked != _symptomStore.happenedAt) {
      await _symptomStore.onChangeHappenedAt(picked);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: kPaddingPage,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                'Adicionar Sintoma',
                style: kTitleStyle,
              ),
              SizedBox(
                height: 24.0,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text('Selecione data'),
                  ButtonWidget(
                    onPressed: () {
                      _selectDate(context);
                    },
                    text: formatter.format(_symptomStore.happenedAt),
                    type: ButtonType.outline,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
