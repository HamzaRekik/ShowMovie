import 'package:booking/services/favourite_movies_service.dart';
import 'package:booking/views/trailer_player.dart';
import 'package:flutter/material.dart';
import '../models/models.dart';

class MovieDetailPage extends StatefulWidget {
  final Movie movie;

  MovieDetailPage({required this.movie});

  @override
  State<MovieDetailPage> createState() => _MovieDetailPageState();
}

class _MovieDetailPageState extends State<MovieDetailPage> {
  var movieID;
  bool isFavorite = true;

  @override
  void initState() {
    super.initState();
    checkExistance();
    getMovieID();
  }

  Future<void> checkExistance() async {
    var isSelected = await FavouriteMoviesService()
        .checkFavouriteExistence(movie: widget.movie);

    setState(() {
      isFavorite = !isSelected;
    });
  }

  Future<void> getMovieID() async {
    var id =
        await FavouriteMoviesService().getMovieIdByTitle(widget.movie.title);
    setState(() {
      movieID = id;
    });
  }

  Future<void> deleteFromFvourite(String id) async {
    await FavouriteMoviesService().deleteFromFavourite(movieId: id);
    setState(() {
      isFavorite = true;
    });

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: Colors.deepPurple,
        content: Text(
          '${widget.movie.title} removed from favourits.',
          style: TextStyle(fontFamily: 'Poppins', color: Colors.white),
        ),
        behavior: SnackBarBehavior.floating,
        duration: Duration(seconds: 2),
      ),
    );
  }

  Future<void> selectMovie(Movie movie) async {
    var id = await FavouriteMoviesService().addToFavourite(movie: movie);
    setState(() {
      movieID = id;
      isFavorite = false;
    });

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: Colors.deepPurple,
        content: Text(
          '${widget.movie.title} added to your favorits!',
          style: TextStyle(fontFamily: 'Poppins', color: Colors.white),
        ),
        behavior: SnackBarBehavior.floating,
        duration: Duration(seconds: 2),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          isFavorite ? selectMovie(widget.movie) : deleteFromFvourite(movieID);
        },
        backgroundColor: Colors.deepPurple,
        child: isFavorite
            ? Icon(Icons.favorite_outline_outlined)
            : Icon(Icons.favorite),
      ),
      body: Column(
        children: [
          Expanded(
            child: Container(
              height: double.infinity,
              child: Image.network(
                "https://image.tmdb.org/t/p/w500${widget.movie.image}",
                fit: BoxFit.cover,
              ),
            ),
          ),
          Row(
            children: [
              SizedBox(
                width: 10,
              ),
              Expanded(
                child: ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.deepPurple,
                    ),
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return MyVideoPlayer(
                          movieID: widget.movie.id, //
                        );
                      }));
                    },
                    icon: Icon(Icons.play_arrow),
                    label: Text("Watch Trailer !")),
              ),
              SizedBox(
                width: 10,
              )
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
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
