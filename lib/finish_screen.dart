import 'package:flutter/material.dart';
import 'package:quiz/data/questions.dart';
import 'package:quiz/summary_report.dart';

class FinishScreen extends StatelessWidget {
  const FinishScreen(this.switchScreen, {super.key});

  final void Function(String to) switchScreen;

  @override
  Widget build(context) {
    int correctAnswersNum =
        questions.where((question) => question.isCorrect).length;

    return Center(
      child: Container(
        margin: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 60,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            RichText(
              textAlign:
                  DefaultTextStyle.of(context).textAlign ?? TextAlign.center,
              text: TextSpan(
                style: DefaultTextStyle.of(context).style,
                text: "You answered ",
                children: <TextSpan>[
                  TextSpan(
                    text: correctAnswersNum.toString(),
                    style: const TextStyle(
                        fontSize: 30, fontWeight: FontWeight.w700),
                  ),
                  const TextSpan(text: " correct answers out of "),
                  TextSpan(
                    text: questions.length.toString(),
                    style: const TextStyle(
                        fontSize: 30, fontWeight: FontWeight.w700),
                  ),
                ],
              ),
            ),
            const SummaryReport(),
            const SizedBox(height: 30),
            FilledButton.icon(
              onPressed: () {
                switchScreen('questions_screen');
              },
              icon: const Icon(Icons.refresh),
              label: const Text("Restart Quiz!"),
            ),
          ],
        ),
      ),
    );
  }
}
