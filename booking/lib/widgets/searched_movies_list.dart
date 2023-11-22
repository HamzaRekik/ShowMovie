import 'package:booking/models/movies.dart';
import 'package:flutter/cupertino.dart';

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
        return MovieWidget(movie: movies[index]);
      }),
    );
  }
}
