import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:sintomed_app/src/ui/tabs/index.dart';
import 'package:sintomed_app/src/utils/colors.dart';

class PrivateAppScreen extends StatefulWidget {
  @override
  _PrivateAppScreenState createState() => _PrivateAppScreenState();
}

class _PrivateAppScreenState extends State<PrivateAppScreen> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  List<Widget> _widgetOptions = <Widget>[
    HomeTab(),
    SymptomTab(),
    PillTab(),
    AccountTab(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _widgetOptions.elementAt(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: _selectedIndex,
          selectedItemColor: kPrimaryColor,
          onTap: _onItemTapped,
          unselectedItemColor: Colors.grey,
          type: BottomNavigationBarType.fixed,
          showUnselectedLabels: false,
          showSelectedLabels: false,
          backgroundColor: Colors.white,
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(MdiIcons.home),
              title: Text('Home'),
            ),
            BottomNavigationBarItem(
              icon: Icon(MdiIcons.clipboardPulse),
              title: Text('Sintomas'),
            ),
            BottomNavigationBarItem(
              icon: Icon(MdiIcons.pill),
              title: Text('Remédios'),
            ),
            BottomNavigationBarItem(
              icon: Icon(MdiIcons.doctor),
              title: Text('Usuário'),
            ),
          ]),
    );
  }
}
