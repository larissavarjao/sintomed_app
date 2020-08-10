import 'package:flutter/material.dart';
import 'package:sintomed_app/src/utils/colors.dart';

enum ButtonType { raised, outline, boxIcon, boxIconAdd }

const EdgeInsetsGeometry kPaddingButton =
    EdgeInsets.symmetric(vertical: 15.0, horizontal: 30.0);
const EdgeInsetsGeometry kBoxPaddingButtonBox = EdgeInsets.all(10.0);
const double kBorderRadiusButton = 13.0;
const double kElevationButton = 6.0;
const double kElevationButtonBox = 2.0;

class ButtonWidget extends StatelessWidget {
  final Function onPressed;
  final String text;
  final ButtonType type;
  final IconData icon;
  final double width;

  ButtonWidget({this.onPressed, this.text, this.type, this.icon, this.width});

  Text _getTextButton() {
    return Text(
      text.toUpperCase(),
      style: TextStyle(
        color: type == ButtonType.raised ? Colors.white : kPrimaryColor,
        fontWeight: FontWeight.w600,
        letterSpacing: 1.2,
        fontSize: 17.0,
      ),
    );
  }

  RaisedButton _getRaisedButton() {
    return RaisedButton(
      onPressed: onPressed,
      padding: kPaddingButton,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(kBorderRadiusButton)),
      color: kPrimaryColor.shade900,
      elevation: kElevationButton,
      child: _getTextButton(),
    );
  }

  RaisedButton _getOutlinedButton() {
    return RaisedButton(
      onPressed: onPressed,
      padding: kPaddingButton,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(kBorderRadiusButton),
        side: BorderSide(color: kPrimaryColor, width: 2.0),
      ),
      color: Colors.white,
      elevation: kElevationButton,
      splashColor: kPrimaryColor,
      child: _getTextButton(),
    );
  }

  ButtonTheme _getBoxIconAddButton() {
    return ButtonTheme(
      minWidth: 30.0,
      child: RaisedButton(
        onPressed: onPressed,
        padding: kBoxPaddingButtonBox,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        color: kPrimaryColor,
        elevation: kElevationButtonBox,
        child: Icon(
          Icons.add,
          color: Colors.white,
          size: 25.0,
        ),
      ),
    );
  }

  ButtonTheme _getBoxIconButton() {
    return ButtonTheme(
      minWidth: 30.0,
      child: RaisedButton(
        onPressed: onPressed,
        padding: kBoxPaddingButtonBox,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        color: Colors.white,
        elevation: kElevationButtonBox,
        child: Icon(
          icon,
          color: Colors.black,
          size: 25.0,
        ),
      ),
    );
  }

  Widget _getButtonByType() {
    switch (type) {
      case ButtonType.raised:
        return _getRaisedButton();
        break;
      case ButtonType.outline:
        return _getOutlinedButton();
        break;
      case ButtonType.boxIconAdd:
        return _getBoxIconAddButton();
        break;
      case ButtonType.boxIcon:
        return _getBoxIconButton();
        break;
      default:
        return _getRaisedButton();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 8.0),
      child: _getButtonByType(),
    );
  }
}
