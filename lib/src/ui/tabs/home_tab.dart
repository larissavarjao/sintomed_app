import 'package:flutter/material.dart';
import 'package:sintomed_app/src/ui/widgets/loading_widget.dart';

class HomeTab extends StatefulWidget {
  @override
  _HomeTabState createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Expanded(
          child: Center(
            child: LoadingWidget(),
          ),
        ),
      ),
    );
  }
}
