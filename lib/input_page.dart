import 'package:flutter/material.dart';
import 'GenderIcons.dart';
import 'ReusableCards.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

const double bottomContainerHeight = 80;
const Color bottomContainerColor = Color(0xFFEB1555);
const Color ActiveReusableCardColor = Color(0xFF1D1E33);
const Color InactiveReusableCardColor = Color(0xFF111328);

enum GenderType { male, female }

class InputPage extends StatefulWidget {
  const InputPage({Key? key}) : super(key: key);

  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  GenderType? selectedGender;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text('BMI CALCULATOR'),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: () => setState(
                      () {
                        selectedGender = GenderType.male;
                      },
                    ),
                    child: ReusableCard(
                      colour: selectedGender == GenderType.male
                          ? ActiveReusableCardColor
                          : InactiveReusableCardColor,
                      cardChild: GenderIcons(
                          genderIcon: FontAwesomeIcons.mars,
                          genterText: 'Male'),
                    ),
                  ),
                ),
                Expanded(
                  child: GestureDetector(
                    onTap: () => setState(
                      () {
                        selectedGender = GenderType.female;
                      },
                    ),
                    child: ReusableCard(
                      colour: selectedGender == GenderType.female
                          ? ActiveReusableCardColor
                          : InactiveReusableCardColor,
                      cardChild: GenderIcons(
                          genderIcon: FontAwesomeIcons.venus,
                          genterText: 'Female'),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: ReusableCard(
                    colour: ActiveReusableCardColor,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: ReusableCard(
                    colour: ActiveReusableCardColor,
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    colour: ActiveReusableCardColor,
                  ),
                ),
              ],
            ),
          ),
          Container(
            color: bottomContainerColor,
            height: bottomContainerHeight,
          )
        ],
      ),
    );
  }
}
