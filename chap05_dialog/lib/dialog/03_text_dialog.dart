import 'package:flutter/material.dart';

class DialogTest4 extends StatelessWidget {
  const DialogTest4({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: TextButton(
        child: Text(
          "버튼",
          style: TextStyle(fontSize: 100),
        ),
        onPressed: (){
          showDialog(
            context: context,
            builder: (context){
              return AlertDialog(
                title: Text("텍스트 입력"),
                content: TextField( // 입력을 받는 것. html input 태그와 비슷. 기본 틀을 잡아준다.
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "내용",
                    hintText: "내용을 입력하세요",
                    helperText: "도움되는 텍스트",
                  ),
                ),
                actions: [
                  TextButton(
                    onPressed: (){
                      Navigator.pop(context);
                    },
                    child: Text("취소"),
                  ),
                  TextButton(
                    onPressed: (){
                      Navigator.pop(context);
                    },
                    child: Text("완료"),
                  ),
                ],
              );
            }
          );
        },
      ),
    );
  }
}
