import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'input_page.dart';
import 'result_page.dart';

void main() => runApp(BMICalculator());

class BMICalculator extends StatelessWidget {
  const BMICalculator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Color(0xFF0A0D21),
          primary: Color(0xFF0A0D21),
          // secondary: Color(0xFFEB1555),
        ),
        scaffoldBackgroundColor: Color(0xFF0A0D21),
        // textTheme: TextTheme(
        //     bodyText2: TextStyle(
        //   color: Colors.white,
        // )),
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => InputPage(),
      },
    );
  }
}
