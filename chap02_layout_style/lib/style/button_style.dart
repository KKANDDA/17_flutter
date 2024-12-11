
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  const MyButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
      title: Center(
        child: Text("레이아웃 테스트"),
        ),
      ),
          body: Center(
        child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
      children: [
        TextButton(onPressed: () {},
          child: Text("버튼"),
          style: TextButton.styleFrom(minimumSize: Size(100, 60)),
        ),
        ElevatedButton(onPressed: (){}, child: Text("버튼")),
        IconButton(onPressed: (){}, icon: Icon(Icons.star), iconSize: 50,)
      ],
    ),
    )
    );
  }
}
