import 'package:flutter/material.dart';

import '../widgets/01_api_view_widget.dart';
import '../widgets/02_scroll_view_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    Center(
      child: Text(
        "메인 페이지",
        style: TextStyle(fontSize: 30),
      ),
    ),
    Center(
      child: ApiView(),
    ),
    Center(
      child: ScrollViewWidget(),
    ),
    Center(
      child: Text(
        "POST 연습",
        style: TextStyle(fontSize: 30),
      ),
    ),
  ];

  void _onTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("API 요청 연습"),
      ),
      body: _pages[_selectedIndex], // 스위치 말고 리스트의 인덱스 번호로도 가능..
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        type: BottomNavigationBarType.fixed,
        onTap: _onTapped,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "메인 페이지",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.list),
            label: "게시글 관리",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.list_alt),
            label: "스크롤",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add),
            label: "POST",
          ),
        ],
      ),
    );
  }
}
