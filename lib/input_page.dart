import 'package:flutter/material.dart';
import 'GenderIcons.dart';
import 'ReusableCards.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'constants.dart';

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
        title: Text('BMI Calculator'),
      ),
      body: Column(
        children: [
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: ReusableCard(
                    onPress: () => setState(() {
                      selectedGender = GenderType.male;
                    }),
                    colour: selectedGender == GenderType.male
                        ? kActiveReusableCardColor
                        : kInactiveReusableCardColor,
                    cardChild: GenderIcons(
                        genderIcon: FontAwesomeIcons.mars, genterText: 'Male'),
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    onPress: () {
                      setState(() {
                        selectedGender = GenderType.female;
                      });
                    },
                    colour: selectedGender == GenderType.female
                        ? kActiveReusableCardColor
                        : kInactiveReusableCardColor,
                    cardChild: GenderIcons(
                        genderIcon: FontAwesomeIcons.venus,
                        genterText: 'Female'),
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
                    colour: kActiveReusableCardColor,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Height',
                          style: kCardTextStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              kHeightSlider.toString(),
                              style: kNumberTextStyle,
                            ),
                            SizedBox(
                              width: 0,
                            ),
                            Column(
                              children: [
                                SizedBox(
                                  height: 30,
                                ),
                                Text(
                                  'CM',
                                  style: kCardTextStyle,
                                ),
                              ],
                            ),
                          ],
                        ),
                        SliderTheme(
                          data: SliderTheme.of(context).copyWith(
                              thumbShape: const RoundSliderThumbShape(
                                  enabledThumbRadius: 14),
                              overlayShape:
                                  RoundSliderOverlayShape(overlayRadius: 30)),
                          child: Slider(
                            value: kHeightSlider.toDouble(),
                            min: kMinSlider,
                            max: kMaxSlider,
                            activeColor: kBottomContainerColor,
                            inactiveColor: kInactiveReusableCardColor,
                            onChanged: (double value) {
                              // print(kHeightSlider);
                              setState(() {
                                kHeightSlider = value.round();
                              });
                            },
                          ),
                        ),
                      ],
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
                    colour: kActiveReusableCardColor,
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    colour: kActiveReusableCardColor,
                  ),
                ),
              ],
            ),
          ),
          Container(
            color: kBottomContainerColor,
            height: kBottomContainerHeight,
          )
        ],
      ),
    );
  }
}
