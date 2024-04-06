import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz/start_screen.dart';
import 'package:quiz/questions_screen.dart';
import 'package:quiz/finish_screen.dart';

class QuizApp extends StatefulWidget {
  const QuizApp({super.key});

  @override
  State<QuizApp> createState() => _QuizAppState();
}

class _QuizAppState extends State<QuizApp> {
  Widget? activeScreen;

  @override
  void initState() {
    super.initState();
    activeScreen = StartScreen(switchScreen);
  }

  void switchScreen(String to) {
    setState(() {
      switch (to) {
        case 'start_screen':
          activeScreen = StartScreen(switchScreen);
        case 'questions_screen':
          activeScreen = QuestionsScreen(switchScreen);
        case 'finish_screen':
          activeScreen = FinishScreen(switchScreen);
        default:
          activeScreen = const Center();
      }
    });
  }

  @override
  Widget build(context) => MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorSchemeSeed: Colors.deepPurple,
          useMaterial3: true,
          brightness: Brightness.dark,
          textTheme: TextTheme(
            bodyMedium: GoogleFonts.roboto(
              fontSize: 26,
              color: const Color.fromARGB(200, 255, 255, 255),
              fontWeight: FontWeight.w300,
            ),
          ),
          filledButtonTheme: FilledButtonThemeData(
            style: FilledButton.styleFrom(
              foregroundColor: Colors.white,
              backgroundColor: Colors.teal,
              elevation: 5,
              shadowColor: Colors.black87,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(2.5),
                side: const BorderSide(
                    color: Color.fromARGB(200, 255, 255, 255), width: .5),
              ),
            ),
          ),
        ),
        home: Scaffold(
          body: DefaultTextStyle.merge(
            // ! Text in buttons and RichTexts don't follow this alignment we added custom ones to them
            textAlign: TextAlign.center,
            child: Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    Color.fromARGB(255, 76, 44, 133),
                    Colors.deepPurple,
                  ],
                ),
              ),
              child: activeScreen,
            ),
          ),
        ),
      );
}
