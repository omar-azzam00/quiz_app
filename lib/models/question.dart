class Question {
  String text;
  List<String> choices;
  String correctChoice;
  late String userChoice;

  Question(this.text, this.choices, int correctChoiceIndex)
      : correctChoice = choices[correctChoiceIndex];

  bool get isCorrect {
    return correctChoice == userChoice;
  }
}
