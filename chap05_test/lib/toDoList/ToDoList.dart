import 'package:flutter/material.dart';

class ToDoList extends StatefulWidget {
  const ToDoList({super.key});

  @override
  State<ToDoList> createState() => _ToDoListState();
}

class _ToDoListState extends State<ToDoList> {

  var titleCt = TextEditingController();
  var descriptionCt = TextEditingController();
  String title = "null";
  String description = "null";

  List<Map<String, dynamic>> toDoList = [
    {"title": "null", "description": "null"},
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(child: ListView.builder(
          itemCount: toDoList.length,
          itemBuilder: (context, i){
            return ListTile(
              leading: Text(i.toString()) ,
              title: Text(toDoList[i]["title"].toString()),
              trailing: ElevatedButton(
                onPressed: (){
                  setState(() {
                    toDoList.removeAt(i);
                  });
                },
                child: Text("삭제"),
              ),
              onTap: (){
                showDialog(
                  context: context,
                  builder: (context){
                    return AlertDialog(
                      title: Text(toDoList[i]["title"].toString()),
                      content: Text(toDoList[i]["description"].toString()),
                      actions: [
                        TextButton(
                          onPressed: (){
                            Navigator.pop(context);
                          },
                          child: Text("닫기"),
                        ),
                      ],
                      /*content: Column(
                        children: [
                          TextField(
                            decoration: InputDecoration(labelText: toDoList[i]["description"].toString()),
                          )
                        ],
                      ),*/
                    );
                  },
                );
              },
            );
          },
        ),),
        Align(
          alignment: Alignment.bottomRight,
          child: TextButton(
            child: Text("등록", style: TextStyle(fontSize: 50),),
            onPressed: (){
              showDialog(
                context: context,
                builder: (context){
                  return AlertDialog(
                    title: Text("일정 등록"),
                    content: Column(
                        mainAxisSize: MainAxisSize.min,
                      children: [
                        TextField(
                          controller: titleCt,
                          decoration: InputDecoration(hintText: "제목을 입력하세요"),
                        ),
                        TextField(
                          controller: descriptionCt,
                          decoration: InputDecoration(hintText: "상세 내용을 입력하세요"),
                        ),
                      ]
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
                          setState(() {
                            title = titleCt.text;
                            description = descriptionCt.text;
                            toDoList.add({"title": title, "description": description});
                          });
                          titleCt.clear();
                          descriptionCt.clear();
                          Navigator.pop(context);
                        },
                        child: Text("확인"),
                      ),
                    ],
                  );
                }
              );
            },
          ),
        )
      ],
    );
  }
}
