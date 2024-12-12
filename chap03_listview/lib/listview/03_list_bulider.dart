import 'package:flutter/material.dart';

class ListApp3 extends StatelessWidget {
  const ListApp3({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text("리스트 테스트"),
        ),
      ),

      body: ListViewWidget(),

      floatingActionButton: FloatingActionButton(
          onPressed: (){},
        child: Icon(
          Icons.question_answer,
          color: Colors.white,
        ),
        backgroundColor: Colors.black,
      ),

      bottomNavigationBar: BottomAppBar(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(onPressed: (){}, icon: Icon(Icons.home)),
            IconButton(onPressed: (){}, icon: Icon(Icons.search)),
            IconButton(onPressed: (){}, icon: Icon(Icons.details)),
            IconButton(onPressed: (){}, icon: Icon(Icons.settings)),
          ],
        ),
      ),
    );
  }
}

/*
* ListView.builder() 위젯 안에 2가지 속성을 지정해 주면 된다.
* iemCount: 리스트 갯수
* itemBuilder: (){return 반복할 위젯}
* i라는 변수는 자동 생성 */

class ListViewWidget extends StatelessWidget {
  const ListViewWidget({super.key});

  @override
  Widget build(BuildContext context) { // context로 부모 트리를 인식할 수 있다. 형제는 모른다.
    return ListView.builder(
      itemCount: 15,
      itemBuilder: (context, i){
        print(i);
        return ListTile( // 커스텀에 한계가 있다. 디테일이 필요하다면 Row를 사용하자.
          leading: Image.asset("assets/old1.webp"),
          title: Text("힘멜의 마지막"),
          subtitle: Text("영웅이 잠들다."),
          trailing: IconButton(onPressed: (){}, icon: Icon(Icons.delete),),
          onTap: (){},
        );
      },
    );
  }
}

