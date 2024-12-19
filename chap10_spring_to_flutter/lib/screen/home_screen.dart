import 'package:flutter/material.dart';

import '../widgets/menu_delete_widget.dart';
import '../widgets/menu_insert_widget.dart';
import '../widgets/menu_list_all_widget.dart';
import '../widgets/update_widget.dart';
import 'main_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;
  
  // 탭에 따라 표시할 화면들
  final List<Widget> _pages = [
    MainScreen(),
      // Center(child: Text("메인 화면", style: TextStyle(fontSize: 30),),),
    MenuListAllWidget(),
      // Center(child: Text("조회 화면", style: TextStyle(fontSize: 30),),),
    MenuInsertWidget(),
      // Center(child: Text("등록 화면", style: TextStyle(fontSize: 30),),),
    MenuUpdateWidget(),
      // Center(child: Text("수정 화면", style: TextStyle(fontSize: 30),),),
    MenuDeleteWidget(),
      // Center(child: Text("삭제 화면", style: TextStyle(fontSize: 30),),),
  ];
  
  // 탭 선택시 호출 함수
  void _onTapped(int index){
    setState(() {
      _selectedIndex = index;
    });
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Flutter Test Restaurant"),
        backgroundColor: Colors.black,
      ),
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: _selectedIndex,
          onTap: _onTapped,
          type: BottomNavigationBarType.fixed,
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: "홈",),
            BottomNavigationBarItem(icon: Icon(Icons.search), label: "메뉴 조회",),
            BottomNavigationBarItem(icon: Icon(Icons.insert_chart), label: "메뉴 등록",),
            BottomNavigationBarItem(icon: Icon(Icons.update), label: "메뉴 수정",),
            BottomNavigationBarItem(icon: Icon(Icons.delete), label: "메뉴 삭제",),
          ]
      ),
    );
  }
}
