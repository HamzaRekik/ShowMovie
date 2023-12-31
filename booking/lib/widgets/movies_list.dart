import 'package:booking/views/single_movie_page.dart';
import 'package:booking/widgets/movie_widget.dart';
import 'package:flutter/material.dart';
import '../models/models.dart';

class MoviesList extends StatelessWidget {
  MoviesList({super.key, required this.movies});
  final List<Movie> movies;

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      physics: BouncingScrollPhysics(),
      slivers: [
        const SliverToBoxAdapter(
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
