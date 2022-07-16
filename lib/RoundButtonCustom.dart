import 'package:flutter/material.dart';


class MyRoundButton extends StatelessWidget {
  final IconData? buttonIcon;
  final VoidCallback? onPress;
  MyRoundButton({this.buttonIcon, this.onPress});
  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      constraints: BoxConstraints.tightFor(
        width: 56.0,
        height: 56.0,
      ),
      shape: CircleBorder(),
      elevation: 20,
      fillColor: Color(0xFF4C4F5E),
      textStyle: TextStyle(color: Colors.white),
      child: Icon(
        buttonIcon,
        size: 30,
      ),
      onPressed: onPress,
    );
  }
}