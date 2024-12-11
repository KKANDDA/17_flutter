import 'package:chqp03_listview/listview/02_list_tile.dart';
import 'package:chqp03_listview/listview/03_list_bulider.dart';
import 'package:flutter/material.dart';

import 'listview/01_list_view.dart';

void main () {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home:
      // 일반 리스트 만들어 보기
      // ListApp(),
      // ListApp2(),
      ListApp3(),
    );
  }
}

