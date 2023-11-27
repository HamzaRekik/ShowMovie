import 'dart:io';

import 'package:booking/models/movie.dart';
import 'package:booking/services/films_services.dart';
import 'package:booking/views/sql_lite/edit_film_page.dart';
import 'package:flutter/material.dart';

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
  final _clService = FilmService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _showOptionsDialog(context, widget.movie);
        },
        foregroundColor: Colors.white,
        backgroundColor: Color(0xFF4163CD),
        child: const Icon(Icons.more_vert),
      ),
      body: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Expanded(
            child: Image(
              image: FileImage(File(widget.movie.image)) as ImageProvider,
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

  void _showOptionsDialog(BuildContext context, Movie post) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Post Options'),
          content: SingleChildScrollView(
            child: ListBody(
              children: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context); // Close the dialog
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => EditPostPage(movie: post),
                      ),
                    );
                  },
                  child: const Text('Edit Post'),
                ),
                const SizedBox(height: 10),
                ElevatedButton(
                  onPressed: () async {
                    try {
                      _clService.supprimerClasse(post);
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          backgroundColor: Color(0xFF4163CD),
                          content: Text(
                            'Post deleting successfully!',
                            style: TextStyle(
                                fontFamily: 'Poppins', color: Colors.white),
                          ),
                          behavior: SnackBarBehavior.floating,
                          duration: Duration(seconds: 2),
                        ),
                      );
                      Navigator.pop(context);
                      Navigator.pushReplacementNamed(context, '/');
                    } catch (error) {
                      print('Error deleting post: $error');
                    }
                  },
                  child: const Text('Delete Post'),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
