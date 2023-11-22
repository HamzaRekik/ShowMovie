import 'package:flutter/material.dart';

import '../models/movies.dart';

class MovieDetailPage extends StatelessWidget {
  final Movie movie;

  MovieDetailPage({required this.movie});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: Colors.deepPurple,
        child: Icon(Icons.favorite),
      ),
      body: Column(
        children: [
          Expanded(
            child: Image(
              image:
                  NetworkImage("https://image.tmdb.org/t/p/w500${movie.image}"),
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: SizedBox(
              height: 230,
              child: Column(
                children: [
                  SizedBox(height: 20),
                  Text("Rate: ${movie.rate.round()}"),
                  SizedBox(height: 10),
                  Text("Release Date: ${movie.date}"),
                  SizedBox(height: 10),
                  Text(
                    movie.description,
                    style: TextStyle(fontSize: 15),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
