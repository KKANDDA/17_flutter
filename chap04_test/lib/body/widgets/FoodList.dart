import 'package:flutter/material.dart';

class FoodListWidget extends StatefulWidget {
  const FoodListWidget({super.key});

  @override
  State<FoodListWidget> createState() => _FoodListWidgetState();
}

class _FoodListWidgetState extends State<FoodListWidget> {
  // List<int> countingNums = [0,0,0];
  // List<String> foods = ["피자","돈까지","치킨"];
  List<Map<String, dynamic>> foods = [
    {'name': "힘멜" , 'count':0, 'image': 'assets/img.png'},
    {'name': "하이터", 'count':0, 'image': 'assets/img_1.png'},
    {'name': "아이젠", 'count':0, 'image': 'assets/img_2.png'},
    {'name': "프리렌", 'count':0, 'image': 'assets/img_3.png'},
  ];
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: foods.length,
      itemBuilder: (context, i){
        return ListTile(
          leading: Image.asset(foods[i]['image']),
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            // mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(foods[i]['name'].toString()+" "),
              Container(
                child: Row(
                  children: [
                    Text("LV: "),
                    Text(foods[i]['count'].toString()),
                  ],
                ),
              ),
            ],
          ),
          trailing: ElevatedButton(
              onPressed: (){
                // var countingNum = 0;
                setState(() {
                  foods[i]['count']++;
                  // countingNums[i]++;
                  // print("얍!!"+countingNum.toString());
                });
              },
              child: Text("레베루 업!!"),
          ),
        );
      },
    );
  }
}
