import 'package:booking/models/movies.dart';
import 'package:booking/services/movies_service.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import '../widgets/searched_movies_builder.dart';

class SearchView extends StatefulWidget {
  @override
  State<SearchView> createState() => _SearchViewState();
}

class _SearchViewState extends State<SearchView> {
  List<Movie> movies = [];

  Future<void> searchMovies(String value) async {
    List<Movie> result = await MoviesService(Dio()).getMovies(title: value);
    setState(() {
      movies = result;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10),
      child: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: SizedBox(
              height: 40,
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: TextField(
                onSubmitted: (value) => searchMovies(value),
                decoration: InputDecoration(
                  hintText: 'Search movies...',
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 12, horizontal: 16),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: BorderSide(),
                  ),
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: SizedBox(
              height: 20,
            ),
          ),
          MoviezSearchListBuilder(
            movies: movies,
          ),
          SliverToBoxAdapter(
            child: SizedBox(
              height: 60,
            ),
          )
        ],
      ),
    );
  }
}
