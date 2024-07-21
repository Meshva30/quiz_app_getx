import 'package:flutter/material.dart';

class AnswerCard extends StatelessWidget {
  final int currentIndex;
  final String question;
  final bool isSelected;
  final int selectedAnswerIndex;
  final int correctAnswerIndex;
  final bool isAttempted;

  const AnswerCard({
    Key? key,
    required this.currentIndex,
    required this.question,
    required this.isSelected,
    required this.selectedAnswerIndex,
    required this.correctAnswerIndex,
    required this.isAttempted,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Color getColor() {
      if (isSelected) {
        if (selectedAnswerIndex == correctAnswerIndex) {
          return Colors.green;
        } else {
          return Colors.red;
        }
      } else if (isAttempted && currentIndex == correctAnswerIndex) {
        return Colors.green;
      }
      return Colors.grey.shade300;
    }

    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: getColor(),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Text(
        question,
        style: const TextStyle(fontSize: 18, color: Colors.black),
      ),
    );
  }
}
