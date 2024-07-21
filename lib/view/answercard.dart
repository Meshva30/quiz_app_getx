// import 'package:flutter/material.dart';
//
// class AnswerCard extends StatelessWidget {
//   final int currentIndex;
//   final String question;
//   final bool isSelected;
//   final int selectedAnswerIndex;
//   final int correctAnswerIndex;
//   final bool isAttempted;
//
//   const AnswerCard({
//     required this.currentIndex,
//     required this.question,
//     required this.isSelected,
//     required this.selectedAnswerIndex,
//     required this.correctAnswerIndex,
//     required this.isAttempted,
//   });
//
//   @override
//   Widget build(BuildContext context) {
//     Color color = Colors.grey[800]!; // Default color
//
//     if (isAttempted) {
//       if (currentIndex == correctAnswerIndex && currentIndex == selectedAnswerIndex) {
//         color = Colors.green; // Correct answer selected
//       } else if (currentIndex == selectedAnswerIndex) {
//         color = Colors.red; // Incorrect answer selected
//       }
//     }
//
//     return Container(
//       margin: const EdgeInsets.symmetric(vertical: 8.0),
//       decoration: BoxDecoration(
//         color: color,
//         borderRadius: BorderRadius.circular(8.0),
//       ),
//       child: ListTile(
//         title: Text(
//           question,
//           style: TextStyle(color: Colors.white),
//         ),
//         tileColor: color,
//       ),
//     );
//   }
// }



import 'package:flutter/material.dart';

class AnswerCard extends StatelessWidget {
  final int currentIndex;
  final String question;
  final bool isSelected;
  final int selectedAnswerIndex;
  final int correctAnswerIndex;
  final bool isAttempted;

  const AnswerCard({
    required this.currentIndex,
    required this.question,
    required this.isSelected,
    required this.selectedAnswerIndex,
    required this.correctAnswerIndex,
    required this.isAttempted,
  });

  @override
  Widget build(BuildContext context) {
    Color color = Colors.grey[800]!; // Default color

    if (isAttempted) {
      if (currentIndex == selectedAnswerIndex) {
        if (currentIndex == correctAnswerIndex) {
          color = Colors.green; // Correct answer selected
        } else {
          color = Colors.red; // Incorrect answer selected
        }
      }
    }

    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: ListTile(
        title: Text(
          question,
          style: TextStyle(color: Colors.white),
        ),
        tileColor: color,
      ),
    );
  }
}
