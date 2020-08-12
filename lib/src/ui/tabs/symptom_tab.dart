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
  double _textFieldHeigth = _textFieldInitialSize;

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
    }
  }

  double _getMaxScreenSize(BuildContext context) {
    return MediaQuery.of(context).size.width;
  }

  void _goToSplashScreen() {
    Navigator.of(context).pushReplacementNamed(Routes.splash);
  }

  void _goToAddSymptomPage() {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => AddSymptomPage()));
  }

  void _removeFocusFromSearchTextField() {
    FocusScope.of(context).requestFocus(FocusNode());
    _decreaseTextFieldSize();
  }

  void _increaseTextFieldSize() {
    setState(() {
      _textFieldWidth = _getMaxScreenSize(context);
      _textFieldHeigth = 60.0;
    });
  }

  void _decreaseTextFieldSize() {
    setState(() {
      _textFieldWidth = _textFieldInitialSize;
      _textFieldHeigth = _textFieldInitialSize;
    });
  }

  Row _getHeaderTitleAndFloatingActionButton() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Container(
          width: _textFieldInitialSize,
          height: _textFieldInitialSize,
        ),
        Text('Sintomas', style: kTitleStyle),
        ButtonWidget(
          onPressed: _goToAddSymptomPage,
          type: ButtonType.boxIconAdd,
        )
      ],
    );
  }

  AnimatedContainer _getSearchBox() {
    return AnimatedContainer(
      width: _textFieldWidth,
      height: _textFieldHeigth,
      duration: Duration(seconds: 1),
      curve: Curves.fastOutSlowIn,
      child: Material(
        elevation: 6.0,
        borderRadius: BorderRadius.circular(15.0),
        child: TextField(
          cursorColor: kPrimaryColor,
          autofocus: false,
          onTap: _increaseTextFieldSize,
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
            suffixIcon: _textFieldWidth == _getMaxScreenSize(context)
                ? Icon(
                    MdiIcons.closeCircle,
                    color: kGrayColor,
                    size: 25.0,
                  )
                : null,
          ),
        ),
      ),
    );
  }

  GestureDetector _getHeader() {
    return GestureDetector(
      onTap: _removeFocusFromSearchTextField,
      child: Container(
        color: Colors.white,
        padding: kPaddingContainer,
        child: Stack(
          alignment: Alignment.centerLeft,
          children: <Widget>[
            _getHeaderTitleAndFloatingActionButton(),
            _getSearchBox(),
          ],
        ),
      ),
    );
  }

  Expanded _getList() {
    return Expanded(
      child: GestureDetector(
        onTap: _removeFocusFromSearchTextField,
        child: Container(
          padding: EdgeInsets.symmetric(vertical: 16.0),
          child: GroupedListView(
            elements: _symptomStore.symptoms,
            groupBy: (element) => element.happenedAt.year,
            groupSeparatorBuilder: (dynamic groupSeparator) => Container(
              margin: EdgeInsets.symmetric(vertical: 5.0, horizontal: 24.0),
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
    );
  }

  RefreshIndicator _getSymptomsScreen() {
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
              _getHeader(),
              _getList(),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Observer(builder: (_) {
        bool isResultWithError =
            _symptomsResult != null && _symptomsResult.error != null;
        bool isResultErrorUnauthorized = isResultWithError &&
            _symptomsResult.error.response.statusCode == 401;
        bool isSymptomsLoading = _symptomStore.loading;
        bool isSymptomsResponseError = _symptomStore.error;
        bool isSymptomsResponseSuccess = _symptomStore.success;
        bool isSymptomsNotNull = _symptomStore.symptoms != null;
        bool isSymptomsIsNotEmpty =
            isSymptomsNotNull && _symptomStore.symptoms.isNotEmpty;
        bool hasSymptomsToShow =
            isSymptomsResponseSuccess && isSymptomsIsNotEmpty;
        bool isSymptomsIsEmpty =
            isSymptomsNotNull && _symptomStore.symptoms.isEmpty;
        bool noHasSymptomsToShow =
            isSymptomsResponseSuccess && isSymptomsIsEmpty;

        if (isResultErrorUnauthorized) {
          _goToSplashScreen();
        }

        if (isSymptomsLoading) {
          return LoadingWidget();
        }

        if (isSymptomsResponseError) {
          return ErroWidget(() {
            _symptomStore.getSymptoms();
          });
        }

        if (hasSymptomsToShow) {
          return _getSymptomsScreen();
        }

        if (noHasSymptomsToShow) {
          return EmptyWidget(() {
            _goToAddSymptomPage();
          });
        }

        return LoadingWidget();
      }),
    );
  }
}
