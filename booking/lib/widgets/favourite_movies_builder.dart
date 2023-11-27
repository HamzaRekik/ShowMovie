import 'package:flutter/material.dart';

import '../services/favourite_movies_service.dart';
import 'favorits_list.dart';

class FavouriteMoviesBuilder extends StatefulWidget {
  @override
  State<FavouriteMoviesBuilder> createState() => _FavouriteMoviesBuilder();
}

class _FavouriteMoviesBuilder extends State<FavouriteMoviesBuilder> {
  var movies;

  @override
  void initState() {
    movies = FavouriteMoviesService().fetchMovies();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Map<String, dynamic>>>(
        future: movies,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return FavoritsList(
              onMovieDeleted: () {
                movies = FavouriteMoviesService().fetchMovies();
                setState(() {});
              },
              movies: snapshot.data!,
            );
          } else if (snapshot.data?.isEmpty == true) {
            return Center(
              child: Text("You got no favorite movies !"),
            );
          } else {
            return Center(
              child: CircularProgressIndicator(
                color: Colors.deepPurple,
              ),
            );
          }
        });
  }
}
