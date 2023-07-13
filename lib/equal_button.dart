import 'package:flutter/material.dart';

class EqualButton extends StatelessWidget {
  const EqualButton({super.key});
  @override
  Widget build(BuildContext context) {
    return Container(
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
        onPressed: () {},
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
    );
  }
}
