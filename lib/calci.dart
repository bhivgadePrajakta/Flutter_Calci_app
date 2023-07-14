import 'package:flutter/material.dart';
import 'package:calci_app/colors.dart';
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
  var hideInput = false;
  var outputSize = 34.0;
  onButtonClick(value) {
    if (value == 'AC') {
      input = ' ';
      output = ' ';
    } else if (value == '<') {
      if (input.isNotEmpty) {
        input = input.substring(0, input.length - 1);
      }
    } else if (value == '=') {
      if (input.isNotEmpty) {
        var userInput = input;
        userInput = input.replaceAll('x', '*');

        Parser p = Parser();
        Expression expression = p.parse(userInput);
        ContextModel cm = ContextModel();
        var finalValue = expression.evaluate(EvaluationType.REAL, cm);
        output = finalValue.toString();
        if (output.endsWith('.0')) {
          output = output.substring(0, output.length - 2);
        }
        input = output;
        hideInput = true;
        outputSize = 52;
      }
    } else {
      input = input + value;
      hideInput = false;
      outputSize = 34;
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
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
                      hideInput ? '' : input,
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
                      style: TextStyle(
                        fontSize: outputSize,
                        color: const Color.fromARGB(169, 255, 255, 255),
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
                transButton(
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
                acButton(
                  text: '=',
                )
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

  Widget acButton({text}) {
    return Expanded(
      child: Container(
        height: 65,
        margin: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          gradient: const LinearGradient(colors: [
            Color.fromARGB(255, 240, 96, 248),
            Color.fromARGB(255, 129, 81, 224)
          ]),
          borderRadius: BorderRadius.circular(40),
        ),
        child: ElevatedButton(
          onPressed: () => onButtonClick(text),
          style: ElevatedButton.styleFrom(
            //elevation: 0,
            backgroundColor: Colors.transparent,
            shadowColor: Colors.transparent,
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 40),
          ),
          child: const Text(
            '=',
            style: TextStyle(
              fontSize: 24,
            ),
          ),
        ),
      ),
    );
  }

  Widget transButton({text, buttonBgColor}) {
    return Expanded(
      child: Container(
        height: 65,
        margin: const EdgeInsets.all(8),
        color: const Color.fromARGB(255, 64, 50, 85),
      ),
    );
  }
}
