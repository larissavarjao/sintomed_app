import 'package:flutter/material.dart';
import 'package:sintomed_app/src/ui/tabs/index.dart';
import 'package:sintomed_app/src/ui/widgets/appbar_icon_widget.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class PrivateAppScreen extends StatefulWidget {
  static const String id = 'home_screen';

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

  @override
  Widget build(BuildContext context) {
    print('index $_selectedIndex');
    return Scaffold(
      body: IndexedStack(index: _selectedIndex, children: [
        HomeTab(),
        SymptomTab(),
        PillTab(),
        AccountTab(),
      ]),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        tooltip: 'Criar sintomas',
        onPressed: () {},
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        elevation: 8.0,
        shape: CircularNotchedRectangle(),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            AppBarIconWidget(
              onItemTapped: () => _onItemTapped(0),
              selectedIndex: _selectedIndex,
              icon: MdiIcons.home,
              index: 0,
            ),
            AppBarIconWidget(
              onItemTapped: () => _onItemTapped(1),
              selectedIndex: _selectedIndex,
              icon: MdiIcons.heartPulse,
              index: 1,
            ),
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: SizedBox(
                width: 14.0,
              ),
            ),
            AppBarIconWidget(
              onItemTapped: () => _onItemTapped(2),
              selectedIndex: _selectedIndex,
              icon: MdiIcons.pill,
              index: 2,
            ),
            AppBarIconWidget(
              onItemTapped: () => _onItemTapped(3),
              selectedIndex: _selectedIndex,
              icon: MdiIcons.account,
              index: 3,
            ),
          ],
        ),
      ),
    );
  }
}
