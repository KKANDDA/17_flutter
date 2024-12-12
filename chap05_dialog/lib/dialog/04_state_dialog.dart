import 'package:flutter/material.dart';

class DialogTest5 extends StatefulWidget {
  const DialogTest5({super.key});

  @override
  State<DialogTest5> createState() => _DialogTest5State();
}

class _DialogTest5State extends State<DialogTest5> {
  var inputData = TextEditingController();
  String name = "null";
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if(name != "null")
            Text(
              name,
              style: TextStyle(fontSize: 25),
            ),
          SizedBox( // 콘테이너 보다 작고 가볍게 사이 간격을 줄 수 있다.
            height: 20,
          ),
          ElevatedButton(
            child: Text(
              "등록",
              style: TextStyle(fontSize: 120),
            ),
            onPressed: (){
              showDialog(
                context: context,
                builder: (context){
                 return AlertDialog(
                   title: Text("이름 입력"),
                   content: TextField(
                     controller: inputData, // 여기가 텍스트 에디팅 콘트롤러 자리이다.
                     decoration: InputDecoration(hintText: "이름을 입력하세요."),
                   ),
                   actions: [
                     TextButton(onPressed: (){Navigator.pop(context);}, child: Text("취소"),),
                     TextButton(
                       onPressed: (){
                         setState((){
                             name = inputData.text.isNotEmpty? inputData.text : name;
                           }
                         );
                        Navigator.pop(context);
                       },
                       child: Text("확인"),),
                   ],
                 );
                }
              );
            },
          )
        ],
      )
    );
  }
}
