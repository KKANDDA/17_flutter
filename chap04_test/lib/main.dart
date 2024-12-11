import 'package:flutter/material.dart';

import 'body/widgets/FoodList.dart';

void main () {
  runApp(const MyApp());
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
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("마왕 토벌 원정대", style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold,),),
          ],
        ),
      ),
      body: FoodListWidget(),
    );
  }
}

