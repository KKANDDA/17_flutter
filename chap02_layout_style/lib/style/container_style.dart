
import 'package:flutter/material.dart';

/*class  MyContainer extends StatelessWidget {
  const MyContainer ({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text("LayOut-test"),
        ),
      ),
      body: Container(
        decoration:
        BoxDecoration(
          border:  Border.all(color: Colors.black),
        ),
        // margin, padding 은 container 에만 줄 수 있다. row 나 column 에는 안된다.
        margin: EdgeInsets.all(90),
        padding: EdgeInsets.fromLTRB(10, 20, 30, 40),
        child: Text("컨테이너 테스트"),
      ),
    );
  }
}*/

/*
* 직접 포지션을 지정해서 위젯을 움직이는 방법은 보통 Posutioned 위젯과 같은 방법으로 이우러 지지만,
* 플러터에서는 일반적으로 위젯의 위치를 직접 설정하기 보다는 레이아웃 위젯(ex> Column, Row, Center 등)을 사용하여
* 자동으로 배치되는 방식을 권장한다.*/

class MyContainer extends StatelessWidget {
  const MyContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text("LayOut-test"),
        ),
      ),
      body:  /*Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            decoration: BoxDecoration(border: Border.all(color: Colors.black)),
            margin: EdgeInsets.all(30),
            padding: EdgeInsets.all(30),
            child: Text("컨테이너 1번"),
          ),
          Container(
            decoration: BoxDecoration(border: Border.all(color: Colors.black)),
            margin: EdgeInsets.all(30),
            padding: EdgeInsets.all(30),
            child: Text("컨테이너 2번"),
          ),
        ],
      ),*/
        Align(
          alignment: Alignment.topRight,
          child: Container(width: 50, height: 50, color: Colors.blue),
        ),
    );
  }
}

