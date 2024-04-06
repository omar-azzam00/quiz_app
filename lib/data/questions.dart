import 'package:flutter/material.dart';
import 'package:quiz/models/question.dart';

List<Question> questions = [
  Question(
    'What is the main building block of flutter framework ?',
    [
      "Widgets",
      "Lists",
      "Variables",
      "Functions",
    ],
    0,
  ),
  Question(
    'What is the programming language that flutter uses ?',
    [
      "Python",
      "C++",
      "HTML",
      "Dart",
    ],
    3,
  ),
  Question(
    'Which is true in the next sentences ?',
    [
      "Stateful Widgets Need Three Classes To Be Built.",
      "Stateful Widgets Need Two Classes To Be Built.",
      "Stateless Widgets Has initState method",
    ],
    1,
  ),
  Question(
    'What is the file we import in the head of our flutter project files ?',
    [
      "flutter/material.dart",
      "flutter/async.dart",
      "dart:math",
      "dart:ffi",
    ],
    0,
  ),
  Question("What of the following is a generic type ?",
      ['int', 'string', 'bool', 'list', 'double'], 3)
];
