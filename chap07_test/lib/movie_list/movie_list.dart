import 'package:flutter/material.dart';

import 'movie_detail.dart';

class MovieList extends StatelessWidget {
  MovieList(this.movies, {super.key});
  final List<Map<String,String>> movies;

  // MyPage myPage = MyPage();

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: movies.length,
      itemBuilder: (context, i){
        return ListTile(
          title: Text(movies[i]["movieTitle"].toString()),
          subtitle: Text((movies[i]["movieDirector"].toString())),
          trailing: IconButton(
            icon: Icon(Icons.delete),
            onPressed: () {
              movies.removeAt(i);
              },
          ),
          onTap: (){
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => MovieDetailPage(
                  movieTitle: movies[i]["movieTitle"].toString(),
                  movieDirector: movies[i]["movieDirector"].toString(),
                  movieDescription: movies[i]["movieDescription"].toString(),
                ),
              ),
            );
          },
        );
      },
    );
  }
}
