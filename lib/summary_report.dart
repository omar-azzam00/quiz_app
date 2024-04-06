import 'package:flutter/material.dart';
import 'package:quiz/data/questions.dart';

class SummaryReport extends StatelessWidget {
  const SummaryReport({super.key});

  @override
  Widget build(context) {
    List<Widget> listViewWidgets = [];

    for (var i = 0; i < questions.length; i++) {
      listViewWidgets.addAll(
        [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: questions[i].isCorrect
                      ? Colors.lightBlue
                      : Colors.red[400],
                ),
                child: Text(
                  (i + 1).toString(),
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              Expanded(
                child: RichText(
                  textAlign: TextAlign.left,
                  text: TextSpan(
                    text: questions[i].text + '\n',
                    style: DefaultTextStyle.of(context)
                        .style
                        .copyWith(fontSize: 23),
                    children: [
                      if (!questions[i].isCorrect)
                        TextSpan(
                          text: questions[i].userChoice + '\n',
                          style: TextStyle(
                            color: Colors.red[400],
                            fontWeight: FontWeight.w700,
                            fontSize: 18,
                          ),
                        ),
                      TextSpan(
                        text: questions[i].correctChoice,
                        style: const TextStyle(
                          color: Colors.lightBlue,
                          fontWeight: FontWeight.w700,
                          fontSize: 18,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          const Divider(
            height: 1,
            color: Color.fromARGB(50, 255, 255, 255),
          ),
          const SizedBox(height: 20)
        ],
      );
    }
    return Expanded(
      child: ListView(
        children: listViewWidgets,
      ),
    );
  }
}
