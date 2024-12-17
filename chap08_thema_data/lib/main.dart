
import 'package:chap08_thema_data/text_test.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'style.dart' as style;

void main (){
  runApp(const MyApp());
}

/*
스타일을 넣을 때 위젯 하나하나 넣으면 가독성과 유지보수성이 떨어질 수 있다.
그래서 플루터는 한 번에 스타일을 줄 수 있는 기능(공간)을 제공한다.
* */

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp( // 테마는 여기서
      theme: style.theme,
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
      appBar: AppBar(),
      body: Row(
        children: [
          Icon(Icons.star),
          TextTest(),
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        child: Row(
          children: [
            IconButton(onPressed: (){}, icon: Icon(Icons.add))
          ],
        ),
      ),
    );
  }
}


