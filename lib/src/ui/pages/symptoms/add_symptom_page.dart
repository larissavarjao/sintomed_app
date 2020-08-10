import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';
import 'package:sintomed_app/src/models/symptom_generic_model.dart';
import 'package:sintomed_app/src/stores/symptom/symptom_store.dart';
import 'package:sintomed_app/src/stores/symptom_generic/symptom_generic_store.dart';
import 'package:sintomed_app/src/ui/widgets/button_widget.dart';
import 'package:sintomed_app/src/utils/constants.dart';

class AddSymptomPage extends StatefulWidget {
  @override
  _AddSymptomPageState createState() => _AddSymptomPageState();
}

class _AddSymptomPageState extends State<AddSymptomPage> {
  SymptomStore _symptomStore;
  SymptomGenericStore _symptomsGenericsStore;
  final DateFormat formatter = DateFormat(kDatePattern);

  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    _symptomStore = Provider.of<SymptomStore>(context);
    _symptomsGenericsStore = Provider.of<SymptomGenericStore>(context);

    if (!_symptomsGenericsStore.loading) {
      _symptomsGenericsStore.getSymptomsGenerics();
    }
  }

  _getSymptomsGenericsContainer(BuildContext context, int index) {
    SymptomGeneric symptom = _symptomsGenericsStore.symptomsGenerics[index];
    return Observer(builder: (_) {
      return RadioListTile(
        title: Text(symptom.name),
        groupValue: _symptomStore.symptomGenericId,
        value: symptom.id,
        onChanged: (id) => _symptomStore.onChangeSymptomGenericId(id),
      );
    });
  }

  double _getMaxScreenWidth(BuildContext context) {
    return MediaQuery.of(context).size.width;
  }

  double _getMaxScreenHeigth(BuildContext context) {
    return MediaQuery.of(context).size.height;
  }

  void _showSymptomsList(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          content: Container(
            width: _getMaxScreenWidth(context) - 60.0,
            height: _getMaxScreenHeigth(context) - 100.0,
            child: ListView.separated(
              itemCount: _symptomsGenericsStore.symptomsGenerics.length,
              separatorBuilder: (BuildContext context, int index) => Divider(
                thickness: 1.5,
              ),
              itemBuilder: (BuildContext context, int index) {
                return _getSymptomsGenericsContainer(context, index);
              },
            ),
          ),
          title: Text('Lista de Sintomas'),
          actions: <Widget>[
            Container(
              width: _getMaxScreenWidth(context),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  ButtonWidget(
                    text: 'Cancelar',
                    type: ButtonType.outline,
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                  ButtonWidget(
                    text: 'OK',
                    type: ButtonType.raised,
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                ],
              ),
            )
          ],
        );
      },
    );
  }

  Future<Null> _selectHappenedAtDate(BuildContext context) async {
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

  Future<Null> _selectDurationInSeconds(BuildContext context) async {
    final TimeOfDay picked = await showTimePicker(
      context: context,
      initialTime: _symptomStore.duration,
    );
    if (picked != null) {
      await _symptomStore.onChangeDuration(picked);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Observer(
        builder: (context) {
          return SafeArea(
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
                    height: 32.0,
                  ),
                  Container(
                    width: double.infinity,
                    child: ButtonWidget(
                      onPressed: () {
                        _showSymptomsList(context);
                      },
                      text: 'Selecione seu simtoma.',
                      type: ButtonType.outline,
                    ),
                  ),
                  SizedBox(
                    height: 12.0,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      TextField(
                        maxLines: 4,
                        keyboardType: TextInputType.multiline,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.grey),
                            borderRadius:
                                BorderRadius.circular(kBorderRadiusButton),
                          ),
                          hintText:
                              'Descreva aqui observações mais detalhadas sobre seu sintoma.',
                          alignLabelWithHint: true,
                        ),
                      ),
                      SizedBox(
                        height: 12.0,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text('Selecione data'),
                              ButtonWidget(
                                onPressed: () {
                                  _selectHappenedAtDate(context);
                                },
                                text:
                                    formatter.format(_symptomStore.happenedAt),
                                type: ButtonType.outline,
                              ),
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: <Widget>[
                              Text('Duração (opcional)'),
                              ButtonWidget(
                                onPressed: () {
                                  _selectDurationInSeconds(context);
                                },
                                text:
                                    '${_symptomStore.duration.hour}h ${_symptomStore.duration.minute}min',
                                type: ButtonType.outline,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
