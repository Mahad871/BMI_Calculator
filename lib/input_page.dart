import 'package:bmi_calculator/calculator_brain.dart';
import 'package:bmi_calculator/result_page.dart';
import 'package:flutter/material.dart';
import 'GenderIcons.dart';
import 'ReusableCards.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'constants.dart';
import 'RoundButtonCustom.dart';

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
                        SizedBox(height: 10),
                        Text(
                          'Height',
                          style: kCardTextStyle,
                        ),
                        SizedBox(height: 5),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              kHeightSlider.toString(),
                              style: kNumberTextStyleSlider,
                            ),
                            SizedBox(
                              width: 2,
                            ),
                            Column(
                              children: [
                                SizedBox(
                                  height: 30,
                                ),
                                Text(
                                  'cm',
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
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('Weight', style: kCardTextStyle),
                        Text(kWeight.toString(), style: kNumberTextStyle),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            MyRoundButton(
                              buttonIcon: Icons.remove,
                              onPress: () {
                                setState(() {
                                  kWeight--;
                                });
                              },
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            MyRoundButton(
                              buttonIcon: Icons.add,
                              onPress: () {
                                setState(() {
                                  kWeight++;
                                });
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    colour: kActiveReusableCardColor,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('Age', style: kCardTextStyle),
                        Text(kAge.toString(), style: kNumberTextStyle),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            MyRoundButton(
                              buttonIcon: Icons.remove,
                              onPress: () {
                                setState(() {
                                  kAge--;
                                });
                              },
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            MyRoundButton(
                              buttonIcon: Icons.add,
                              onPress: () {
                                setState(() {
                                  kAge++;
                                });
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          GestureDetector(
            onTap: () {
              CalculatorBrain calc =
                  CalculatorBrain(height: kHeightSlider, weight: kWeight);
              calc.calculateBMI();
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ResultPage(
                        ResultTXT: calc.getResult(),
                        ResultInterpretation: calc.getInterpretation(),
                        ResultNum: calc.getBMI()),
                  ));
            },
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                    topRight: Radius.circular(30),
                    topLeft: Radius.circular(30)),
                color: kBottomContainerColor,
              ),
              margin: const EdgeInsets.fromLTRB(10, 10, 10, 0),
              padding: EdgeInsets.all(20),
              height: kBottomContainerHeight,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Center(
                    child: Text(
                      'CALCULATE',
                      style: kBottomTextStyle,
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
