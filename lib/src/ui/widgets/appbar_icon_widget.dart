import 'package:flutter/material.dart';
import 'package:sintomed_app/src/utils/colors.dart';

class AppBarIconWidget extends StatelessWidget {
  final int selectedIndex;
  final int index;
  final Function onItemTapped;
  final IconData icon;

  AppBarIconWidget(
      {this.selectedIndex, this.onItemTapped, this.icon, this.index});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: IconButton(
        icon: Icon(
          icon,
          color: selectedIndex == index ? kPrimaryColor : Colors.grey,
          size: 26.0,
        ),
        onPressed: onItemTapped,
      ),
    );
  }
}
