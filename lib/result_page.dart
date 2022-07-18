import 'package:bmi_calculator/ReusableCards.dart';
import 'package:bmi_calculator/calculator_brain.dart';
import 'package:bmi_calculator/constants.dart';
import 'package:bmi_calculator/main.dart';
import 'package:flutter/material.dart';
import 'calculator_brain.dart';

class ResultPage extends StatelessWidget {
  ResultPage(
      {required this.ResultTXT,
      required this.ResultInterpretation,
      required this.ResultNum});
  final String ResultTXT;
  final String ResultNum;
  final String ResultInterpretation;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('BMI Calculator'),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              padding: EdgeInsets.fromLTRB(20, 40, 0, 5),
              alignment: Alignment.bottomLeft,
              child: Text(
                'Your Result',
                style: TextStyle(
                  fontSize: 50,
                  fontWeight: FontWeight.w800,
                ),
              ),
            ),
            Expanded(
              child: ReusableCard(
                cardMargin: 20,
                colour: kActiveReusableCardColor,
                cardChild: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      ResultTXT,
                      style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                          color: Colors.green),
                    ),
                    Text(
                      ResultNum,
                      style: kNumberTextStyleResult,
                    ),
                    Text(
                      'Normal BMI range:\n 18,5 - 25 kg/m2',
                      style: kCardTextStyle,
                    ),
                    Text(
                      '',
                      style: kCardTextStyle,
                    ),
                    Text(
                      ResultInterpretation,
                      textAlign: TextAlign.center,
                      style: kResultCardTextStyle,
                    ),
                  ],
                ),
              ),
            ),
            GestureDetector(
              onTap: () => Navigator.pop(context),
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
                        'RE-CALCULATE',
                        style: kBottomTextStyle,
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ));
  }
}
