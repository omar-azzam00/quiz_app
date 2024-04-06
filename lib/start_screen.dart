import 'package:flutter/material.dart';

class StartScreen extends StatelessWidget {
  const StartScreen(this.switchScreen, {super.key});

  final void Function(String to) switchScreen;

  @override
  Widget build(context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            padding: const EdgeInsets.fromLTRB(0, 40, 0, 20),
            child: const Text("Learn Flutter the fun way!"),
          ),
          FilledButton.icon(
            onPressed: () {
              switchScreen('questions_screen');
            },
            icon: const Icon(Icons.arrow_right_alt),
            label: const Text("start now!"),
          )
        ],
      ),
    );
  }
}
