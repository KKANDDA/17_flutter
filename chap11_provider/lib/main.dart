import 'package:chap11_provider/store.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'home_screen.dart';

/*
Provider
- 매우 유연하고 자유도가 높은 다양한 방식의 상태 관리 라이브러리
- 전역적인 상태 관리부터 특정 위젯 내부 상태 공유도 가능하다.
- 하지만 사용하는 방식에 따라서 구조와 성능에 많은 영향을 줄 수 있다.

- 공유할 위젯들 상위를 ChangeNotifierProvider로 감싸면 된다.

주요 개념
- 상태 관리 = ui 상태를 관리하고 반영하는 도구
- ChangeNotifier = provider 가 상태를 관리하기 위한 클래스
- Consumer = ChangeNotifier에 의해 관리되는 데이터를 사용하는 위젯

상태가 변경될 때마다 자동으로 해당 데이터를 업데이트하고, 필요한 부분만 다시 빌드한다.
* */

void main () {
  runApp(

    MultiProvider(
        providers: [
          ChangeNotifierProvider(
            create: (context) => Store(),
          ),
          ChangeNotifierProvider( // 여러 개의 store를 사용하는 방법
            create: (context) => Store2(),
          ),
        ],
      child: MyApp()
    )
  );


     /* ChangeNotifierProvider(
    create: (context) => Store(), // 필요한 부분만 ChangeNotifierProvider로 감쌌다
    child: MyApp(),
  ));*/
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomeScreen(),
    );
  }
}
