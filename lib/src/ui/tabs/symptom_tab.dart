import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
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
  dynamic symptomsResult;

  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() async {
    super.didChangeDependencies();

    _symptomStore = Provider.of<SymptomStore>(context);

    if (!_symptomStore.loading) {
      symptomsResult = await _symptomStore.getSymptoms();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Observer(builder: (_) {
        if (symptomsResult.response.statusCode == 401) {
          Navigator.of(context).pushReplacementNamed(Routes.splash);
        }

        if (_symptomStore.loading) {
          return LoadingWidget();
        }

        if (_symptomStore.error) {
          return ErroWidget(() {
            _symptomStore.getSymptoms();
          });
        }

        if (_symptomStore.success &&
            _symptomStore.symptoms != null &&
            _symptomStore.symptoms.isNotEmpty) {
          return RefreshIndicator(
            onRefresh: () {
              _symptomStore.getSymptoms();
              return;
            },
            child: SafeArea(
              child: Container(
                color: kGrayColor,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      color: kGrayColor,
                      padding: kPaddingContainer,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          ButtonWidget(
                            onPressed: () {},
                            type: ButtonType.boxIcon,
                            icon: MdiIcons.magnify,
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
                    ),
                    Container(
                      padding: kPaddingContainer,
                      child: ListView.builder(
                        scrollDirection: Axis.vertical,
                        shrinkWrap: true,
                        itemCount: _symptomStore.symptoms.length,
                        physics: AlwaysScrollableScrollPhysics(),
                        itemBuilder: (context, index) {
                          return SymptomCard(
                            symptom: _symptomStore.symptoms[index],
                          );
                        },
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
