import 'package:flutter/material.dart';
import 'package:quiz/data/questions.dart';

class QuestionsScreen extends StatefulWidget {
  const QuestionsScreen(this.switchScreen, {super.key});

  final void Function(String to) switchScreen;

  @override
  State<QuestionsScreen> createState() => _QuestionsScreenState();
}

class _QuestionsScreenState extends State<QuestionsScreen> {
  var currentQuestionIndex = 0;

  // this to solve the problem when many buttons are pressed together
  bool chosedAlready = false;

  @override
  void initState() {
    super.initState();
    questions.shuffle();
  }

  @override
  Widget build(context) {
    chosedAlready = false;

    // Show a first question or a new one if questions has not ended yet
    questions[currentQuestionIndex].choices.shuffle();

    var elevatedchoiceBtns =
        questions[currentQuestionIndex].choices.map((choice) {
      return ElevatedButton(
        onPressed: () {
          // this if statement for handling when user click multible buttons together
          if (!chosedAlready) {
            setState(
              () {
                questions[currentQuestionIndex].userChoice = choice;
                currentQuestionIndex++;
                chosedAlready = true;

                if (currentQuestionIndex == questions.length) {
                  widget.switchScreen('finish_screen');
                }
              },
            );
          }
        },
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            side: const BorderSide(
                color: Colors.white30,
                width: 1,
                strokeAlign: BorderSide.strokeAlignOutside),
            borderRadius: BorderRadius.circular(5),
          ),
        ),
        child: Text(
          choice,
          textAlign: DefaultTextStyle.of(context).textAlign,
        ),
      );
    });

    return Center(
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              questions[currentQuestionIndex].text,
              style: const TextStyle(fontWeight: FontWeight.w700),
            ),
            const SizedBox(height: 20),
            ...elevatedchoiceBtns
          ],
        ),
      ),
    );
  }
}
