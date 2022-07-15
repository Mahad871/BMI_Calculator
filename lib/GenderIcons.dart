import 'package:flutter/material.dart';

const Color cardTextColor = Color(0xFF8D8E98);

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
          style: TextStyle(fontSize: 18, color: cardTextColor),
        ),
      ],
    );
  }
}
