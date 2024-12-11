import 'package:chap04_stateful_widget/stateful/01_problem.dart';
import 'package:chap04_stateful_widget/stateful/02_stateful.dart';
import 'package:flutter/material.dart';

void main () {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home:
        MyPage(),
    );
  }
}

class MyPage extends StatelessWidget {
  const MyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text("StateFul Widget"),
        ),
      ),
      floatingActionButton:
        // 문제점 확인
        //StateLessTest(),

        // 문제 해결!!
        StatefulTest(),
    );
  }
}

