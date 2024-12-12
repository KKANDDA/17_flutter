import 'package:flutter/material.dart';

import 'dialog/01_dialog_test.dart';
import 'dialog/02_alert_dialog.dart';
import 'dialog/03_text_dialog.dart';
import 'dialog/04_state_dialog.dart';

/*
* Dialog
*
* - 사용자가 화면에 표시된 정보를 확인하거나 액션을 선택할 수 있도록 제공하는 팝업 창.
* - 모바일 앱에서 많이 사용되는 요소 중 하나로, 주로 경고 메세지, 정보 알림, 확인 및 취소 등 간단한 상호작용 창을 제공한다.
* - 플러터는 다양한 유형의 다이얼로그를 제공한다. */

void main () {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp( // 테마 잡는 얘
      home:
      MyDialog(),
    );
  }
}

class MyDialog extends StatelessWidget {
  const MyDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold( // 구조 잡는 얘
      appBar: AppBar(
        title: Center(
          child: Text("Dialog Test"),
        ),
      ),
      body:
        // DialogTest(),
        // DialogTest2(),
        // DialogTest3(),
        // DialogTest4(),
        DialogTest5(),
    );
  }
}

