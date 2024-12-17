import 'package:flutter/material.dart';

var theme = ThemeData(
  iconTheme: IconThemeData(color: Colors.red, size: 40),
  appBarTheme: AppBarTheme(backgroundColor: Colors.blue),
  bottomAppBarTheme: BottomAppBarTheme(color: Colors.green),
  // 등등.. 컨트롤 + 스페이스로 잘 찾아서 써보자!

  /*
  통일성 있는 UI 디자인을 원한다면 ThemeData를 활용하면 된다.

  이렇게 전역적으로 기본 테마를 꾸며 놓고, 필요한 부분은 각 파츠별로 커스텀하여 개발하면 생산성에 좋다..
  * */
);