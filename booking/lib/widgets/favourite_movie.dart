import 'package:booking/services/favourite_movies_service.dart';
import 'package:flutter/material.dart';

class FavouriteMovie extends StatefulWidget {
  const FavouriteMovie({
    required this.onMovieDeleted,
    required this.movie,
    super.key,
  });
  final VoidCallback onMovieDeleted;
  final Map movie;

  @override
  State<FavouriteMovie> createState() => _FavouriteMovieState();
}

class _FavouriteMovieState extends State<FavouriteMovie> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 7),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12.0),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.3),
            spreadRadius: 2,
            blurRadius: 5,
            offset: Offset(0, 3),
          ),
        ],
        image: DecorationImage(
          image: NetworkImage(
            "https://image.tmdb.org/t/p/w500${widget.movie['image']}",
          ),
          fit: BoxFit.cover,
        ),
      ),
      child: Stack(
        children: [
          Positioned(
            top: 10,
            right: 10,
            child: IconButton(
              onPressed: () async {
                try {
                  await FavouriteMoviesService()
                      .deleteDocument(widget.movie['title']);
                  widget.onMovieDeleted();
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      backgroundColor: Colors.deepPurple,
                      content: Text(
                        '${widget.movie['title']} removed from favorites.',
                        style: TextStyle(color: Colors.white),
                      ),
                      behavior: SnackBarBehavior.floating,
                      duration: Duration(seconds: 2),
                    ),
                  );
                } catch (e) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      backgroundColor: Colors.deepPurple,
                      content: Text(
                        'An error occured...',
                        style: TextStyle(color: Colors.white),
                      ),
                      behavior: SnackBarBehavior.floating,
                      duration: Duration(seconds: 2),
                    ),
                  );
                  print(e);
                }
              },
              icon: Icon(
                Icons.favorite,
                color: Colors.deepPurple,
                size: 30,
              ),
            ),
          ),
          Positioned(
            bottom: 10,
            left: 10,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.movie['title'],
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 4),
                Text(
                  'Release Date: ${widget.movie['date']}',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 12,
                  ),
                ),
                Text(
                  'Rating: ${widget.movie['rate'].round()}',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
