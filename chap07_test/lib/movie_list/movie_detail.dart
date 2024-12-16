import 'package:flutter/material.dart';

class MovieDetailPage extends StatelessWidget {
  final String movieTitle;
  final String movieDirector;
  final String movieDescription;


  const MovieDetailPage({
    super.key,
    required this.movieTitle,
    required this.movieDirector,
    required this.movieDescription,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(movieTitle),
      ),
      body: Column(
        children: [
          Text("감독: "+movieDirector.toString()),
          Text("줄거리 요약: "+movieDescription.toString()),
        ],
      ),
    );
  }
}
