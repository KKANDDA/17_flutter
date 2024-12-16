import 'package:chap07_test/main.dart';
import 'package:flutter/material.dart';

class AddMovie extends StatelessWidget {

  AddMovie(this.changeSelectedIndex, {super.key});
  final Function changeSelectedIndex;

  MyPage myPage = MyPage();
  // MovieList movieList = MovieList();
  String? title;
  String? director;
  String? description;

  @override

  /*void initState(){
    super.initState();

  }*/

  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(20),
      child: Column(
        children: [
            TextField(
              decoration: InputDecoration(label: Text("타이틀")),
              onChanged: (value){
                title = value;
              },
            ),
            TextField(
              decoration: InputDecoration(label: Text("감독명")),
              onChanged: (value){
                director = value;
              },
            ),
          TextField(
              decoration: InputDecoration(label: Text("작품 설명")),
              onChanged: (value){
                description = value;
              },
            ),
          SizedBox(height: 20,),
          ElevatedButton(
              onPressed: (){
                changeSelectedIndex(title, director, description);
              },
              child: Text("영화 등록"),
            ),

        ],
      ),
    );

      Column(
      children: [
        Padding(
          padding: EdgeInsets.only(left: 20, right: 20),
          child: TextField(
            decoration: InputDecoration(label: Text("타이틀")),
            onChanged: (value){
              title = value;
            },
          ),
        ),
        Padding(
          padding: EdgeInsets.only(left: 20, right: 20),
          child: TextField(
            decoration: InputDecoration(label: Text("감독명")),
            onChanged: (value){
              director = value;
            },
          ),
        ),
        Padding(
          padding: EdgeInsets.only(left: 20, right: 20),
          child: TextField(
            decoration: InputDecoration(label: Text("작품 설명")),
            onChanged: (value){
              description = value;
            },
          ),
        ),
        Padding(
          padding: EdgeInsets.all(16),
          child: ElevatedButton(
            onPressed: (){
              changeSelectedIndex(title, director, description);
            },
            child: Text("영화 등록"),
          ),
        ),
      ],
    );
  }
}


