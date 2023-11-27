import 'package:booking/models/models.dart';
import 'package:booking/services/movies_service.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import '../widgets/searched_movies_builder.dart';

class SearchView extends StatefulWidget {
  final Function toggleTheme;
  final bool isDarkMode;

  const SearchView(
      {super.key, required this.toggleTheme, required this.isDarkMode});
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
      child: Stack(children: [
        CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: SizedBox(
                height: 40,
              ),
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.3),
                        spreadRadius: 1,
                        blurRadius: 4,
                        offset: Offset(0, 2),
                      ),
                    ],
                  ),
                  child: TextField(
                    onSubmitted: (value) => searchMovies(value),
                    style: TextStyle(fontSize: 16),
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.search, color: Colors.grey),
                      hintText: 'Search movies...',
                      hintStyle: TextStyle(color: Colors.grey),
                      contentPadding:
                          EdgeInsets.symmetric(vertical: 14, horizontal: 16),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: BorderSide.none,
                      ),
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
      ]),
    );
  }
}
