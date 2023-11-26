import 'package:booking/models/models.dart';
import 'package:booking/views/single_movie_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'movie_widget.dart';

class SearchedMoviesList extends StatelessWidget {
  const SearchedMoviesList({
    super.key,
    required this.movies,
  });

  final List<Movie> movies;

  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildBuilderDelegate(childCount: movies.length,
          (context, index) {
        return GestureDetector(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return MovieDetailPage(movie: movies[index]);
              }));
            },
            child: MovieWidget(movie: movies[index]));
      }),
    );
  }
}
