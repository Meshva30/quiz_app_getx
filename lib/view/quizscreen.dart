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
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        elevation: 5,
        shadowColor: Colors.grey,
      ),
      body: Obx(() {
        if (controller.gameOver.value) {
          WidgetsBinding.instance.addPostFrameCallback((_) {
            controller.showResultDialog();
          });
          return SizedBox.shrink();
        }

        final question = controller.questions[controller.questionIndex.value];

        return Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SizedBox(
                height: 50,
              ),
              Text(
                question.questionText,
                style: const TextStyle(
                    fontSize: 25,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: 20,
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: question.options.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: controller.selectedAnswerIndex.value == null &&
                              !controller.gameOver.value
                          ? () => controller.answer(index)
                          : null,
                      child: AnswerCard(
                        currentIndex: index,
                        question: question.options[index],
                        isSelected:
                            controller.selectedAnswerIndex.value == index,
                        selectedAnswerIndex:
                            controller.selectedAnswerIndex.value ?? -1,
                        correctAnswerIndex: question.correctOptionIndex,
                        isAttempted: controller.attempts.value > 0,
                      ),
                    );
                  },
                ),
              ),
              GestureDetector(
                onTap: controller.selectedAnswerIndex.value != null &&
                        !controller.gameOver.value
                    ? () {
                        controller.goToNextQuestion();
                      }
                    : null,
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: 16, horizontal: 32),
                  decoration: BoxDecoration(
                    color: Colors.orange,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Center(
                    child: Text(
                      'Next',
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      }),
    );
  }
}
