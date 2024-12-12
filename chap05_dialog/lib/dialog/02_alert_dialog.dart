import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class DialogTest2 extends StatelessWidget {
  const DialogTest2({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: TextButton(
        child: Text(
          "버튼!!",
          style: TextStyle(fontSize: 60),
        ),
        onPressed: (){
          showDialog(
            context: context,
            builder: (context){
              return AlertDialog(
                title: Text("Alert Dialog"),
                content: Text("레알이여..?!"),
                actions: [
                  TextButton(
                    onPressed: (){
                      // 취소 작업 실행
                      Navigator.of(context).pop(); // pop()은 창을 닫는 것
                    },
                    child: Text("취소"),
                  ),
                  TextButton(
                    onPressed: (){
                      // 확인 작업 실행
                      Navigator.of(context).pop();
                    },
                    child: Text("확인"),
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

// cupertino 스타일 dialog

class DialogTest3 extends StatelessWidget {
  const DialogTest3({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: TextButton(
        child: Text(
          "버튼",
          style: TextStyle(fontSize: 80),
        ),
        onPressed: (){
          showDialog(
            context: context,
            builder: (context){
              return CupertinoAlertDialog(
                title: Text("알림창"),
                content: Text("이 작업을 진행하시겠습니까?"),
                actions: [
                  CupertinoDialogAction(
                    child: Text("취소"),
                    onPressed: (){
                      Navigator.pop(context);
                    },
                  ),
                  CupertinoDialogAction(
                    child: Text("확인"),
                    onPressed: (){
                      Navigator.pop(context);
                    },
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

