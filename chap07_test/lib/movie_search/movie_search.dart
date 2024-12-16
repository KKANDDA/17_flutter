import 'package:flutter/material.dart';

/*
검색

void _onSearch(String query){
  setState((){
  _searchResults =
  movies
  .where((movie)=>(movie['title'] ?? '')
  .contains(query)).toList();
}
* */
class MovieSearch extends StatelessWidget {
  MovieSearch(this.findByTitle, this._searchResults, {super.key});
  final List<Map<String, String>> _searchResults;
  final Function findByTitle;
  // List<Map<String, String>> _searchResults;
  // String title;
  late String query;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(20),
      child: Column(
        children: [
          TextField(
            decoration: InputDecoration(label: Text("제목으로 영화 찾기")),
            onChanged: (value){
              query = value;
            },
          ),
          SizedBox(height: 20,),
          ElevatedButton(
              onPressed: (){
                findByTitle(query);
              },
              child: Text("검색"),
          ),
          Expanded(child:
          ListView.builder(
            itemCount: _searchResults.length,
            itemBuilder: (context, i){
              return ListTile(
                title: Text(_searchResults[i]["movieTitle"].toString(),),
                subtitle: Text(_searchResults[i]["movieDirector"].toString(),),

              );
            }
          )),
        ],
      ),

    );
  }
}
