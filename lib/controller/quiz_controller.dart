import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../model/quiz_model.dart';
import '../view/quizscreen.dart';

class QuizController extends GetxController {
  var selectedAnswerIndex = RxnInt();
  var questionIndex = 0.obs;
  var score = 0.obs;
  var attempts = 0.obs;
  var maxAttempts = 3;
  var gameOver = false.obs;

  void answer(int value) {
    if (selectedAnswerIndex.value == null && !gameOver.value) {
      selectedAnswerIndex.value = value;
      final question = questions[questionIndex.value];

      if (selectedAnswerIndex.value == question.correctOptionIndex) {
        score.value++;
        Future.delayed(Duration(seconds: 1), () {
          if (!gameOver.value) {
            goToNextQuestion();
          }
        });
      } else {
        attempts.value++;
        if (attempts.value >= maxAttempts) {
          Get.defaultDialog(
            title: 'Max Attempts Reached',
            middleText: 'You have used all your attempts for this question.',
            onConfirm: () {
              goToNextQuestion();
              Get.back();
            },
            textConfirm: 'Next Question',
            barrierDismissible: false,
          );
        } else {
          Get.snackbar(
            'Incorrect Answer',
            'You have ${maxAttempts - attempts.value} attempts left.',
            snackPosition: SnackPosition.BOTTOM,
          );
        }
      }
    }
  }

  void goToNextQuestion() {
    if (questionIndex.value < questions.length - 1) {
      questionIndex.value++;
      selectedAnswerIndex.value = null;
      attempts.value = 0;
    } else {
      gameOver.value = true;
      showResultDialog();
    }
  }

  bool get isLastQuestion => questionIndex.value == questions.length - 1;

  void resetGame() {
    selectedAnswerIndex.value = null;
    questionIndex.value = 0;
    score.value = 0;
    attempts.value = 0;
    gameOver.value = false;
  }

  void showResultDialog() {
    final int totalQuestions = questions.length;
    final int attemptedQuestions = totalQuestions - attempts.value;
    final int correctAnswers = score.value;
    final double percentage =
        totalQuestions > 0 ? score.value / totalQuestions : 0.0;

    showDialog(
      context: Get.context!,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Image.asset(
            'assets/winner1.png',
            fit: BoxFit.cover,
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                ' Quiz Completed',
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 20),
              Text(
                'Congratulations!',
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 10),
              Text(
                'Your Score: ${score.value}',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 10),
              Text(
                'Percentage: ${(percentage * 100).round()}%',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 10),
              Text(
                'Questions Attempted: $attemptedQuestions/$totalQuestions',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 10),
              Text(
                'Correct Answers: $correctAnswers',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Get.back();
                resetGame();
                Get.offAll(() => QuizScreen());
              },
              style: TextButton.styleFrom(
                foregroundColor: Colors.white,
                backgroundColor: Colors.orange,
                padding: EdgeInsets.symmetric(vertical: 12.0, horizontal: 24.0),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
              child: Text('Retry'),
            )
          ],
        );
      },
    );
  }

  List<Question> questions = [
    Question(
      questionText: '1. What is the capital of France?',
      correctOptionIndex: 1,
      options: [
        'a) Madrid',
        'b) Paris',
        'c) Berlin',
        'd) Rome',
      ],
    ),
    Question(
      questionText: '2. In what continent is Brazil located?',
      correctOptionIndex: 3,
      options: [
        'a) Europe',
        'b) Asia',
        'c) North America',
        'd) South America',
      ],
    ),
    Question(
      questionText: '3. What is the largest planet in our solar system?',
      correctOptionIndex: 1,
      options: [
        'a) Earth',
        'b) Jupiter',
        'c) Saturn',
        'd) Venus',
      ],
    ),
    Question(
      questionText: '4. What is the longest river in the world?',
      correctOptionIndex: 0,
      options: [
        'a) Nile',
        'b) Amazon',
        'c) Mississippi',
        'd) Danube',
      ],
    ),
    Question(
      questionText: '5. Who is the main character in the Harry Potter series?',
      correctOptionIndex: 2,
      options: [
        'a) Hermione Granger',
        'b) Ron Weasley',
        'c) Harry Potter',
        'd) Neville Longbottom',
      ],
    ),
    Question(
      questionText: '6. What is the smallest planet in our solar system?',
      correctOptionIndex: 3,
      options: [
        'a) Venus',
        'b) Mars',
        'c) Earth',
        'd) Mercury',
      ],
    ),
    Question(
      questionText: '7. Who wrote the play Romeo and Juliet?',
      correctOptionIndex: 0,
      options: [
        'a) William Shakespeare',
        'b) Oscar Wilde',
        'c) Jane Austen',
        'd) Charles Dickens',
      ],
    ),
    Question(
      questionText: '8. What is the highest mountain in the world?',
      correctOptionIndex: 1,
      options: [
        'a) Mont Blanc',
        'b) Everest',
        'c) Kilimanjaro',
        'd) Aconcagua',
      ],
    ),
    Question(
      questionText:
          '9. What is the name of the famous painting by Leonardo da Vinci that depicts a woman?',
      correctOptionIndex: 3,
      options: [
        'a) Starry Night',
        'b) The Persistence of Memory',
        'c) The Last Supper',
        'd) Mona Lisa',
      ],
    ),
  ];
}
