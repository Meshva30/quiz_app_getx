import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:quiz_app_getx/view/quizscreen.dart';
import 'package:quiz_app_getx/view/splashscreen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Quiz App',
      theme: ThemeData(

      ),
      home: Splashscreen(),
    );
  }
}
