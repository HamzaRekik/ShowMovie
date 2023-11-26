import 'package:flutter/material.dart';
import '../models/models.dart';

class MovieDetailPage extends StatefulWidget {
  final Movie movie;

  MovieDetailPage({required this.movie});

  @override
  State<MovieDetailPage> createState() => _MovieDetailPageState();
}

nummberToStars(int nub) {
  Icon(Icons.star_border_outlined);
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
        mainAxisSize: MainAxisSize.max,
        children: [
          Expanded(
            child: Image(
              image: NetworkImage(
                  "https://image.tmdb.org/t/p/w500${widget.movie.image}"),
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: List.generate(
                        10,
                        (index) => Icon(
                          Icons.star,
                          color: index < widget.movie.rate.round()
                              ? Colors.amber
                              : Colors.grey,
                          size: 17,
                        ),
                      ),
                    ),
                    Text(
                      "Release Date: ${widget.movie.date}",
                      style:
                          TextStyle(fontSize: 16, fontStyle: FontStyle.italic),
                    ),
                  ],
                ),
                SizedBox(height: 20),
                Text(
                  widget.movie.description,
                  style: TextStyle(fontSize: 16),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
