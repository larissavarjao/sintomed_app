import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:grouped_list/grouped_list.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:provider/provider.dart';
import 'package:sintomed_app/routes.dart';
import 'package:sintomed_app/src/stores/symptom/symptom_store.dart';
import 'package:sintomed_app/src/ui/pages/symptoms/add_symptom_page.dart';
import 'package:sintomed_app/src/ui/widgets/button_widget.dart';
import 'package:sintomed_app/src/ui/widgets/empty_widget.dart';
import 'package:sintomed_app/src/ui/widgets/loading_widget.dart';
import 'package:sintomed_app/src/ui/widgets/error_widget.dart';
import 'package:sintomed_app/src/ui/widgets/symptom_card_widget.dart';
import 'package:sintomed_app/src/utils/colors.dart';
import 'package:sintomed_app/src/utils/constants.dart';

class SymptomTab extends StatefulWidget {
  @override
  _SymptomTabState createState() => _SymptomTabState();
}

class _SymptomTabState extends State<SymptomTab> {
  SymptomStore _symptomStore;
  dynamic _symptomsResult;
  static double _textFieldInitialSize = 48.0;
  double _textFieldWidth = _textFieldInitialSize;

  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() async {
    super.didChangeDependencies();

    _symptomStore = Provider.of<SymptomStore>(context);

    if (!_symptomStore.loading) {
      _symptomsResult = await _symptomStore.getSymptoms();
      print('${_symptomsResult.error}');
    }
  }

  double getMaxScreenSize(BuildContext context) {
    return MediaQuery.of(context).size.width;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Observer(builder: (_) {
        if (_symptomsResult != null &&
            _symptomsResult.error != null &&
            _symptomsResult.error.response.statusCode == 401) {
          print('401');
          Navigator.of(context).pushReplacementNamed(Routes.splash);
        }

        if (_symptomStore.loading) {
          print('loading');
          return LoadingWidget();
        }

        if (_symptomStore.error) {
          print('error');
          return ErroWidget(() {
            _symptomStore.getSymptoms();
          });
        }

        if (_symptomStore.success &&
            _symptomStore.symptoms != null &&
            _symptomStore.symptoms.isNotEmpty) {
          print('sucesso');
          return RefreshIndicator(
            onRefresh: () {
              _symptomStore.getSymptoms();
              return;
            },
            child: SafeArea(
              child: Container(
                color: Colors.white,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    GestureDetector(
                      onTap: () {
                        FocusScope.of(context).requestFocus(FocusNode());
                        setState(() {
                          _textFieldWidth = _textFieldInitialSize;
                        });
                      },
                      child: Container(
                        color: Colors.white,
                        padding: kPaddingContainer,
                        child: Stack(
                          alignment: Alignment.centerLeft,
                          children: <Widget>[
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                Container(
                                  width: _textFieldInitialSize,
                                  height: _textFieldInitialSize,
                                ),
                                Text('Sintomas', style: kTitleStyle),
                                ButtonWidget(
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => AddSymptomPage(),
                                      ),
                                    );
                                  },
                                  type: ButtonType.boxIconAdd,
                                )
                              ],
                            ),
                            AnimatedContainer(
                              width: _textFieldWidth,
                              height: _textFieldWidth,
                              duration: Duration(seconds: 1),
                              curve: Curves.fastOutSlowIn,
                              child: Material(
                                elevation: 6.0,
                                borderRadius: BorderRadius.circular(15.0),
                                child: TextField(
                                  cursorColor: kPrimaryColor,
                                  autofocus: false,
                                  onTap: () {
                                    setState(() {
                                      _textFieldWidth =
                                          getMaxScreenSize(context);
                                    });
                                  },
                                  // textAlignVertical: TextAlignVertical.bottom,
                                  decoration: InputDecoration(
                                    filled: true,
                                    fillColor: Colors.white,
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(15.0),
                                    ),
                                    hintText: "Digite sua pesquisa",
                                    hintStyle: TextStyle(fontSize: 19.0),
                                    prefixIcon: Icon(
                                      MdiIcons.magnify,
                                      color: kGrayColor,
                                      size: 25.0,
                                    ),
                                    suffixIcon: _textFieldWidth ==
                                            getMaxScreenSize(context)
                                        ? Icon(
                                            MdiIcons.closeCircle,
                                            color: kGrayColor,
                                            size: 25.0,
                                          )
                                        : null,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      child: GestureDetector(
                        onTap: () {
                          FocusScope.of(context).requestFocus(FocusNode());
                          setState(() {
                            _textFieldWidth = _textFieldInitialSize;
                          });
                        },
                        child: Container(
                          padding: EdgeInsets.symmetric(vertical: 16.0),
                          child: GroupedListView(
                            elements: _symptomStore.symptoms,
                            groupBy: (element) => element.happenedAt.year,
                            groupSeparatorBuilder: (dynamic groupSeparator) =>
                                Container(
                              margin: EdgeInsets.symmetric(
                                  vertical: 5.0, horizontal: 24.0),
                              child: Text(
                                groupSeparator.toString(),
                                style: TextStyle(
                                  fontSize: 20.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            itemBuilder: (context, element) {
                              return SymptomCard(
                                symptom: element,
                              );
                            },
                            order: GroupedListOrder.DESC,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        }

        if (_symptomStore.success && _symptomStore.symptoms.isEmpty ||
            _symptomStore.symptoms == null) {
          return EmptyWidget(() {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => AddSymptomPage(),
              ),
            );
          });
        }
      }),
    );
  }
}
