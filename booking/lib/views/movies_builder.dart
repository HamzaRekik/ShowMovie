import 'package:booking/services/movies_service.dart';
import 'package:booking/widgets/movies_list.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import '../models/movies.dart';

class MoviesBuilder extends StatefulWidget {
  String? title;
  @override
  State<MoviesBuilder> createState() => _MoviesBuilderState();
}

class _MoviesBuilderState extends State<MoviesBuilder> {
  var movies;

  checkQuery() {
    if (widget.title == null) {
      return MoviesService(Dio()).getMovies();
    } else
      return MoviesService(Dio()).getMovies(title: widget.title);
  }

  @override
  void initState() {
    movies = checkQuery();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Movie>>(
        future: movies,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return MoviesList(
              movies: snapshot.data!,
            );
          } else if (snapshot.hasError) {
            return Text("error");
          } else
            return Center(
              child: CircularProgressIndicator(),
            );
        });
  }
}
