  // import 'package:get/get.dart';
  // import '../model/quiz_model.dart';
  //
  // class QuizController extends GetxController {
  //   var selectedAnswerIndex = RxnInt();
  //   var questionIndex = 0.obs;
  //   var score = 0.obs;
  //   var attempts = 0.obs; // Track attempts for the current question
  //   var maxAttempts = 3; // Maximum attempts allowed for each question
  //   var wrongAttempts = 0.obs; // Track the number of questions with incorrect answers
  //   var gameOver = false.obs; // Track if the game is over
  //
  //   void Answer(int value) {
  //     if (selectedAnswerIndex.value == null && !gameOver.value) {
  //       selectedAnswerIndex.value = value;
  //       final question = questions[questionIndex.value];
  //
  //       if (selectedAnswerIndex.value == question.correctAnswerIndex) {
  //         // Correct answer
  //         score.value++;
  //         attempts.value = 0; // Reset attempts for the next question
  //         goToNextQuestion(); // Move to the next question
  //       } else {
  //         // Incorrect answer
  //         attempts.value++;
  //         if (attempts.value >= maxAttempts) {
  //
  //           Get.defaultDialog(
  //             title: 'Max Attempts Reached',
  //             middleText: 'You have used all your attempts for this question.',
  //             onConfirm: () {
  //               if (questionIndex.value < questions.length - 1) {
  //                 questionIndex.value++;
  //                 selectedAnswerIndex.value = null;
  //                 attempts.value = 0; // Reset attempts for the new question
  //               } else {
  //                 gameOver.value = true; // End game if all questions are answered
  //               }
  //               Get.back(); // Close the dialog
  //             },
  //             textConfirm: 'Next Question',
  //             barrierDismissible: false,
  //           );
  //         } else {
  //           // Allow another attempt
  //           Get.snackbar(
  //             'Incorrect Answer',
  //             'You have ${maxAttempts - attempts.value} attempts left.',
  //             snackPosition: SnackPosition.BOTTOM,
  //           );
  //           selectedAnswerIndex.value = null; // Allow the user to attempt again
  //         }
  //       }
  //     }
  //   }
  //
  //   void goToNextQuestion() {
  //     if (questionIndex.value < questions.length - 1) {
  //       questionIndex.value++;
  //       selectedAnswerIndex.value = null;
  //       attempts.value = 0; // Reset attempts for the new question
  //     } else {
  //       gameOver.value = true; // End game when all questions are answered
  //     }
  //   }
  //
  //   bool get isLastQuestion => questionIndex.value == questions.length - 1;
  //
  //   void resetGame() {
  //     selectedAnswerIndex.value = null;
  //     questionIndex.value = 0;
  //     score.value = 0;
  //     attempts.value = 0;
  //     wrongAttempts.value = 0;
  //     gameOver.value = false;
  //   }
  // }
  //
  //
  //
  //





  import 'package:get/get.dart';
  import '../model/quiz_model.dart';
  import '../screens/result_screen.dart';

  class QuizController extends GetxController {
    var selectedAnswerIndex = RxnInt();
    var questionIndex = 0.obs;
    var score = 0.obs;
    var attempts = 0.obs; // Track attempts for the current question
    var maxAttempts = 3; // Maximum attempts allowed for each question
    var wrongAttempts = 0.obs; // Track the number of questions with incorrect answers
    var gameOver = false.obs; // Track if the game is over

    void Answer(int value) {
      if (selectedAnswerIndex.value == null && !gameOver.value) {
        selectedAnswerIndex.value = value;
        final question = questions[questionIndex.value];

        if (selectedAnswerIndex.value == question.correctAnswerIndex) {
          // Correct answer
          score.value++;
          attempts.value = 0; // Reset attempts for the next question
          goToNextQuestion(); // Move to the next question
        } else {
          // Incorrect answer
          attempts.value++;
          if (attempts.value >= maxAttempts) {
            Get.defaultDialog(
              title: 'Max Attempts Reached',
              middleText: 'You have used all your attempts for this question.',
              onConfirm: () {
                if (questionIndex.value < questions.length - 1) {
                  questionIndex.value++;
                  selectedAnswerIndex.value = null;
                  attempts.value = 0; // Reset attempts for the new question
                } else {
                  gameOver.value = true; // End game if all questions are answered
                  navigateToResultScreen();
                }
                Get.back(); // Close the dialog
              },
              textConfirm: 'Next Question',
              barrierDismissible: false,
            );
          } else {
            // Allow another attempt
            Get.snackbar(
              'Incorrect Answer',
              'You have ${maxAttempts - attempts.value} attempts left.',
              snackPosition: SnackPosition.BOTTOM,
            );
            selectedAnswerIndex.value = null; // Allow the user to attempt again
          }
        }
      }
    }

    void goToNextQuestion() {
      if (questionIndex.value < questions.length - 1) {
        questionIndex.value++;
        selectedAnswerIndex.value = null;
        attempts.value = 0; // Reset attempts for the new question
      } else {
        gameOver.value = true; // End game when all questions are answered
        navigateToResultScreen();
      }
    }

    bool get isLastQuestion => questionIndex.value == questions.length - 1;

    void resetGame() {
      selectedAnswerIndex.value = null;
      questionIndex.value = 0;
      score.value = 0;
      attempts.value = 0;
      wrongAttempts.value = 0;
      gameOver.value = false;
    }

    void navigateToResultScreen() {
      Get.to(() => ResultScreen(
        score: score.value,
        totalQuestions: questions.length,
      ));
    }
  }




  List<Question> questions = [
  Question(
    question: '1. What is the capital of France?',
    correctAnswerIndex: 1,
    options: [
      'a) Madrid',
      'b) Paris',
      'c) Berlin',
      'd) Rome',
    ],
  ),
  Question(
    question: '2. In what continent is Brazil located?',
    correctAnswerIndex: 3,
    options: [
      'a) Europe',
      'b) Asia',
      'c) North America',
      'd) South America',
    ],
  ),
  Question(
    question: '3. What is the largest planet in our solar system?',
    correctAnswerIndex: 1,
    options: [
      'a) Earth',
      'b) Jupiter',
      'c) Saturn',
      'd) Venus',
    ],
  ),
  Question(
    question: '4. What is the longest river in the world?',
    correctAnswerIndex: 0,
    options: [
      'a) Nile',
      'b) Amazon',
      'c) Mississippi',
      'd) Danube',
    ],
  ),
  Question(
    question: '5. Who is the main character in the Harry Potter series?',
    correctAnswerIndex: 2,
    options: [
      'a) Hermione Granger',
      'b) Ron Weasley',
      'c) Harry Potter',
      'd) Neville Longbottom',
    ],
  ),
  Question(
    question: '6. What is the smallest planet in our solar system?',
    correctAnswerIndex: 3,
    options: [
      'a) Venus',
      'b) Mars',
      'c) Earth',
      'd) Mercury',
    ],
  ),
  Question(
    question: '7. Who wrote the play Romeo and Juliet?',
    correctAnswerIndex: 0,
    options: [
      'a) William Shakespeare',
      'b) Oscar Wilde',
      'c) Jane Austen',
      'd) Charles Dickens',
    ],
  ),
  Question(
    question: '8. What is the highest mountain in the world?',
    correctAnswerIndex: 1,
    options: [
      'a) Mont Blanc',
      'b) Everest',
      'c) Kilimanjaro',
      'd) Aconcagua',
    ],
  ),
  Question(
    question:
        '9. What is the name of the famous painting by Leonardo da Vinci that depicts a woman?',
    correctAnswerIndex: 3,
    options: [
      'a) Starry Night',
      'b) The Persistence of Memory',
      'c) The Last Supper',
      'd) Mona Lisa',
    ],
  ),
];
