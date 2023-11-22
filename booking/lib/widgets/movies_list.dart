import 'package:booking/views/single_movie_page.dart';
import 'package:booking/widgets/movie_widget.dart';
import 'package:flutter/material.dart';
import '../models/movies.dart';

class MoviesList extends StatelessWidget {
  MoviesList({required this.movies});
  List<Movie> movies;

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      physics: BouncingScrollPhysics(),
      slivers: [
        SliverToBoxAdapter(
          child: SizedBox(
            height: 35,
          ),
        ),
        SliverToBoxAdapter(
          child: Text(
            "Popular Movies",
            style: TextStyle(fontSize: 35),
          ),
        ),
        SliverToBoxAdapter(
          child: SizedBox(
            height: 20,
          ),
        ),
        SliverList(
          delegate: SliverChildBuilderDelegate(childCount: movies.length,
              (context, index) {
            return GestureDetector(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return MovieDetailPage(movie: movies[index]);
                }));
              },
              child: MovieWidget(
                movie: movies[index],
              ),
            );
          }),
        ),
        SliverToBoxAdapter(
          child: SizedBox(
            height: 55,
          ),
        ),
      ],
    );
  }
}
