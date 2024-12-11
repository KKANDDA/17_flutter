import 'package:flutter/material.dart';

class StateLessTest extends StatelessWidget {
  StateLessTest({super.key});
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
} // StateLessWidget은 랜더링을 일으키지 않는다.
