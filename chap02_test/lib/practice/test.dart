import 'package:flutter/material.dart';

class Practice extends StatelessWidget {
  const Practice({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title:
          Text(
            "실습 앱",
            style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.bold,
            ),
          ),
        actions: [
          IconButton(onPressed: (){}, icon: Icon(Icons.search),),
          IconButton(onPressed: (){}, icon: Icon(Icons.chat),),
          IconButton(onPressed: (){}, icon: Icon(Icons.settings),),
        ],
      ),
      body: Column(
        children: [
          Container(
            height: 150,
            margin: EdgeInsets.only(top: 15),
            child: Row(
              children: [
                Image.asset("assets/img.png", width: 150,),
                Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("힘멜",),
                      Text("영웅",),
                      Text("인간",),
                      Container(
                        child: Row(
                          children: [
                            Icon(Icons.star),
                            Text("lv: 7"),
                          ],
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
          Container(
            child: Row(
              children: [
                Image.asset("assets/img_1.png",width: 150,),
                Container(
                  height: 150,
                  margin: EdgeInsets.only(top: 15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("힘멜",),
                      Text("성직자",),
                      Text("인간",),
                      Container(
                        child: Row(
                          children: [
                            Icon(Icons.favorite),
                            Text("lv: 4"),
                          ],
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.grey,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(
              onPressed: (){
                print("홈버튼 눌림");},
              icon: Icon(Icons.home),
            ),
            IconButton(
              onPressed: (){
                print("서치 버튼 눌림");},
              icon: Icon(Icons.search),
            ),
            IconButton(
              onPressed: (){
                print("알림 버튼 눌림");},
              icon: Icon(Icons.notifications),
            ),
            IconButton(
              onPressed: (){
                print("계정 버튼 눌림");},
              icon: Icon(Icons.account_circle),),
          ],
        )
      )
    );
  }
}
