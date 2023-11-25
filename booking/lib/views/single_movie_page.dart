import 'package:flutter/material.dart';

import '../models/movies.dart';

class MovieDetailPage extends StatefulWidget {
  final Movie movie;

  MovieDetailPage({required this.movie});

  @override
  State<MovieDetailPage> createState() => _MovieDetailPageState();
}

class _MovieDetailPageState extends State<MovieDetailPage> {
  bool isFavorite = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            isFavorite = !isFavorite;
          });
        },
        backgroundColor: Colors.deepPurple,
        child: isFavorite
            ? Icon(Icons.favorite)
            : Icon(Icons.favorite_border_outlined),
      ),
      body: Column(
        children: [
          Expanded(
            child: Image(
              image: NetworkImage(
                  "https://image.tmdb.org/t/p/w500${widget.movie.image}"),
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
                  Text("Rate: ${widget.movie.rate.round()}"),
                  SizedBox(height: 10),
                  Text("Release Date: ${widget.movie.date}"),
                  SizedBox(height: 10),
                  Text(
                    widget.movie.description,
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
