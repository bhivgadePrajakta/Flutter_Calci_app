import 'package:flutter/material.dart';
import 'package:calci_app/colors.dart';
import 'package:calci_app/equal_button.dart';
import 'package:math_expressions/math_expressions.dart';

class CalciApp extends StatefulWidget {
  const CalciApp({super.key});

  @override
  State<CalciApp> createState() => _CalciState();
}

class _CalciState extends State<CalciApp> {
  double firstNum = 0.0;
  double secondNum = 0.0;
  var input = ' ';
  var output = ' ';
  var operation = ' ';

  onButtonClick(value) {
    if (value == 'AC') {
      var input = ' ';
      var output = ' ';
    } else if (value == '<') {
      input = input.substring(0, input.length - 1);
    } else if (value == '=') {
      var userInput = input;
      userInput = input.replaceAll('x', '*');
      print(userInput);
      Parser p = Parser();
      Expression expression = p.parse(userInput);
      ContextModel cm = ContextModel();
      var finalValue = expression.evaluate(EvaluationType.REAL, cm);
      output = finalValue.toString();
      print('expression');
    } else {
      input = input + value;
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: const Color.fromARGB(255, 64, 50, 85),
        body: Column(
          children: [
            Expanded(
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.all(12),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      input,
                      style: const TextStyle(
                        fontSize: 48,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Text(
                      output,
                      style: const TextStyle(
                        fontSize: 34,
                        color: Color.fromARGB(169, 255, 255, 255),
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                  ],
                ),
              ),
            ),
            Row(
              children: [
                button(
                  text: 'AC',
                  tColor: const Color.fromARGB(255, 111, 109, 131),
                  buttonBgColor: const Color.fromARGB(255, 196, 195, 217),
                ),
                button(
                  text: '<',
                  tColor: const Color.fromARGB(255, 111, 109, 131),
                  buttonBgColor: const Color.fromARGB(255, 196, 195, 217),
                ),
                button(
                  text: ' ',
                  buttonBgColor: const Color.fromARGB(255, 64, 50, 85),
                ),
                button(
                  text: '/',
                  tColor: Colors.white,
                  buttonBgColor: operatorColor,
                ),
              ],
            ),
            Row(
              children: [
                button(text: '7'),
                button(text: '8'),
                button(text: '9'),
                button(
                  text: 'x',
                  tColor: Colors.white,
                  buttonBgColor: operatorColor,
                ),
              ],
            ),
            Row(
              children: [
                button(text: '4'),
                button(text: '5'),
                button(text: '6'),
                button(
                  text: '-',
                  tColor: Colors.white,
                  buttonBgColor: operatorColor,
                ),
              ],
            ),
            Row(
              children: [
                button(text: '1'),
                button(text: '2'),
                button(text: '3'),
                button(
                  text: '+',
                  tColor: Colors.white,
                  buttonBgColor: operatorColor,
                ),
              ],
            ),
            Row(
              children: [
                button(text: '%'),
                button(text: '0'),
                button(
                  text: '.',
                ),
                const EqualButton(),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget button({text, tColor = Colors.white, buttonBgColor = buttonColor}) {
    return Expanded(
      child: Container(
        margin: const EdgeInsets.all(8),
        child: TextButton(
          style: TextButton.styleFrom(
              padding: const EdgeInsets.all(22),
              backgroundColor: buttonBgColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(40),
              )),
          onPressed: () => onButtonClick(text),
          child: Text(
            text,
            style: TextStyle(
                fontSize: 24, color: tColor, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}
