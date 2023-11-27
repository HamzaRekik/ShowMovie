import 'package:flutter/material.dart';

import 'favourite_movie.dart';

class FavoritsList extends StatelessWidget {
  FavoritsList({
    required this.movies,
    required this.onMovieDeleted,
  });
  final List<Map<String, dynamic>> movies;
  final VoidCallback onMovieDeleted;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 1,
                crossAxisSpacing: 3.0,
                mainAxisSpacing: 7.0,
              ),
              itemCount: movies.length,
              itemBuilder: (context, index) {
                return FavouriteMovie(
                  movie: movies[index],
                  onMovieDeleted: onMovieDeleted,
                );
              },
            ),
          ),
          SizedBox(
            height: 60,
          )
        ],
      ),
    );
  }
}
