
/*
* StatefulWidget
* - Flutter에서 상태를 가진 위젝을 만들 때 사용하는 클래스
* - Flutter 위젯은 기본적으로 불변이지만,
*   Statefulwidget을 사용하면 동적인 상태를 가진 위젯을 만들 수 있다.
*   위젯은 사용자와의 상호작용, 데이터 변화 등으로 인해 상태가 변경될 수 있고,
*   변경될 때마다 UI가 다시 빌드된다. */

import 'package:flutter/material.dart';

class StatefulTest extends StatefulWidget {
  const StatefulTest({super.key});

  @override
  State<StatefulTest> createState() => _StatefulTestState();
} // 여기까지 고정된 부분. 변하지 않는다. 우리가 건들 부분은 하위 클래스이다. 캡슐화 원칙.

/*class _StatefulTestState extends State<StatefulTest> {
// 파일 밖에서 _StatefulTestState 여기 접근 할 수 없고, StatefulTest만 건들 수 있다.
  var a = 1;
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      child: Text(a.toString(),),
      onPressed: (){
        print(a);
        a++;
      },
    );
  }
}*/

/*
* state를 변경시켜서 렌더링을 일으키려면 setState를 알아야 한다.
* Flutter에서 setState()가 호출되면, 부분 렌더링이 발생한다.
* 즉, 전체 앱이나 전체 화면이 렌더링되는 것이 아니라, 상태가 변경된 특정 위젯만 다기 그려진다.
*
* 리액트는 돔 트리와 가상 돔 트리를 이용해 부분 엔더링을 하지만,
* 플러터는 위젯 트리에서 특정 상태를 관리하는 부분의 build 메소드만 다시 실행해 부분 렌더링을 한다. */

class _StatefulTestState extends State<StatefulTest> {
// 파일 밖에서 _StatefulTestState 여기 접근 할 수 없고, StatefulTest만 건들 수 있다.
  var a = 1;
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
    // 플로팅액션버튼이 아닌 build를 렌더링 시킨다. 상태를 디테일하게 관리하고 싶다면, 위젯을 분리해서 관리해야 한다.
      child: Text(a.toString(),),
      onPressed: (){
        setState(() {
          a++;
        });
      },
    );
  }
}