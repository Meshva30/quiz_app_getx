import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quiz_app_getx/view/quizscreen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Quiz App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: QuizScreen(), // Set the initial screen here
    );
  }
}
