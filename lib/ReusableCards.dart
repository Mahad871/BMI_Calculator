import 'package:flutter/material.dart';
import 'constants.dart';

class ReusableCard extends StatelessWidget {
  final Color colour;
  final Widget? cardChild;
  final VoidCallback? onPress;

  ReusableCard({required this.colour, this.cardChild, this.onPress});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Material(
        elevation: 30,
        color: Color(0xFF0A0D21),
        child: Container(
          child: cardChild,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: colour,
          ),
          margin: EdgeInsets.all(10),
        ),
      ),
    );
  }
}
