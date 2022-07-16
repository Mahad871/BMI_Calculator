import 'package:flutter/material.dart';
import 'constants.dart';

class GenderIcons extends StatelessWidget {
  final IconData genderIcon;
  final String genterText;

  GenderIcons({required this.genderIcon, required this.genterText});
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          genderIcon,
          size: 100,
        ),
        SizedBox(
          height: 22,
        ),
        Text(
          genterText,
          style: kCardTextStyle,
        ),
      ],
    );
  }
}
