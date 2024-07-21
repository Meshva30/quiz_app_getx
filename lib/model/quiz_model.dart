class Question {
  String questionText;
  List<String> options;
  int correctOptionIndex;
  int selectedOptionIndex;

  Question({
    required this.questionText,
    required this.options,
    required this.correctOptionIndex,
    this.selectedOptionIndex = -1,
  });

  bool get isAttempted => selectedOptionIndex != -1;

  bool get isCorrect => selectedOptionIndex == correctOptionIndex;
}
