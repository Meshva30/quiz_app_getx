import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controller/quiz_controller.dart';
import 'answercard.dart';

class QuizScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final QuizController controller = Get.put(QuizController());

    return Scaffold(
      backgroundColor: Color(0xff22272E),
      appBar: AppBar(
        backgroundColor: Color(0xff22272E),
        title: const Text(
          'Quiz App',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Obx(() {
        if (controller.gameOver.value) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Game Over',
                  style: TextStyle(fontSize: 34, color: Colors.white),
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    controller.resetGame(); // Reset game state
                    Get.offAll(() => QuizScreen()); // Restart the screen
                  },
                  child: Text('Restart'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                  ),
                ),
              ],
            ),
          );
        }

        final question = questions[controller.questionIndex.value];

        return Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                question.question,
                style: const TextStyle(fontSize: 21, color: Colors.white),
                textAlign: TextAlign.center,
              ),
              ListView.builder(
                shrinkWrap: true,
                itemCount: question.options.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: controller.selectedAnswerIndex.value == null &&
                        !controller.gameOver.value
                        ? () => controller.Answer(index)
                        : null,
                    child: AnswerCard(
                      currentIndex: index,
                      question: question.options[index],
                      isSelected: controller.selectedAnswerIndex.value == index,
                      selectedAnswerIndex: controller.selectedAnswerIndex.value ?? -1,
                      correctAnswerIndex: question.correctAnswerIndex,
                      isAttempted: controller.attempts.value > 0,
                    ),
                  );
                },
              ),
              ElevatedButton(
                onPressed: controller.selectedAnswerIndex.value != null &&
                    !controller.gameOver.value
                    ? () {
                  controller.goToNextQuestion();
                }
                    : null,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                ),
                child: Text(
                  'Next',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ],
          ),
        );
      }),
    );
  }
}
