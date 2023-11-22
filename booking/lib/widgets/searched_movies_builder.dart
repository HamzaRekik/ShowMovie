import 'package:booking/widgets/searched_movies_list.dart';
import 'package:flutter/material.dart';

import '../models/movies.dart';

class MoviezSearchListBuilder extends StatefulWidget {
  const MoviezSearchListBuilder({
    required this.movies,
    Key? key,
  }) : super(key: key);

  final List<Movie> movies;

  @override
  State<MoviezSearchListBuilder> createState() =>
      _MoviezSearchListBuilderState();
}

class _MoviezSearchListBuilderState extends State<MoviezSearchListBuilder> {
  @override
  Widget build(BuildContext context) {
    if (widget.movies.isEmpty) {
      return SliverToBoxAdapter(
          child: SizedBox(
              height: 500,
              child: Center(
                  child: Text(
                "Find every movie you want...",
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.w700),
              ))));
    } else {
      return SearchedMoviesList(movies: widget.movies);
    }
  }
}
