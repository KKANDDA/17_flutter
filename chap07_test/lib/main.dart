import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'add_movie/add_movie.dart';
import 'movie_list/movie_list.dart';
import 'movie_search/movie_search.dart';

/*
list.where().contains().toList();
*/

void main () {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home:
      MyPage(),
    );
  }
}

class MyPage extends StatefulWidget {
  const MyPage({super.key});

  @override
  State<MyPage> createState() => _MyPageState();
}

class _MyPageState extends State<MyPage> {

  List<Map<String, String>> movies = [
    {"movieTitle": "title", "movieDirector": "name", "movieDescription": "description"},
  ];
  List<Map<String,String>> _searchResults = [];


  int _selectedIndex = 0;



  void changeSelectedIndex(title,dir,desc){
    setState(() {
      movies.add({"movieTitle": title, "movieDirector": dir, "movieDescription": desc});
      _selectedIndex = 0;
    });
  }

  void findByTitle(query){
    setState(() {
      _searchResults = movies
          .where((movie) => (movie["movieTitle"] ?? "")
          .contains(query)).toList();
    });
  }

  Widget _getPage(){
    switch(_selectedIndex){
      case 0:
        return MovieList(movies);
      case 1:
        return AddMovie(changeSelectedIndex);
      case 2:
        return MovieSearch(findByTitle, _searchResults ?? []);
      default:
        return Center(child: Text("페이지 없음"),
        );
    }
  }

  void _onItemTapped(int index){
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("영화 관리 앱"),
      ),
      body: _getPage(),
      bottomNavigationBar: BottomNavigationBar(
          showUnselectedLabels: true,
          currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        items: [
          BottomNavigationBarItem(
            label: "영화 목록",
            icon: Icon(Icons.list_outlined),
            activeIcon: Icon(Icons.list),
          ),
          BottomNavigationBarItem(
            label: "영화 등록",
            icon: Icon(Icons.add_outlined),
            activeIcon: Icon(Icons.add),
          ),
          BottomNavigationBarItem(
            label: "영화 검색",
            icon: Icon(Icons.search_outlined),
            activeIcon: Icon(Icons.search),
          ),
        ],
      ),
    );
  }
}

