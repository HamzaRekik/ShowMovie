import 'package:flutter/material.dart';

import '../models/movies.dart';

class MovieWidget extends StatelessWidget {
  MovieWidget({required this.movie});
  final Movie movie;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 10),
      height: 200,
      width: 340,
      child: Row(
        children: [
          Expanded(
              child: Image(
            image:
                NetworkImage("https://image.tmdb.org/t/p/w500${movie.image}"),
            height: 200,
            width: 200,
            fit: BoxFit.cover,
          )),
          Expanded(
              flex: 2,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Expanded(
                        child: Row(
                      children: [
                        Expanded(
                            flex: 4,
                            child: Align(
                              alignment: Alignment.topLeft,
                              child: Text(
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                movie.title,
                                textAlign: TextAlign.left,
                              ),
                            )),
                        Container(
                            child: Text(
                          "${movie.rate.round()}",
                        ))
                      ],
                    )),
                    Expanded(
                        child: Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        movie.date,
                        textAlign: TextAlign.left,
                      ),
                    )),
                    Expanded(
                        flex: 6,
                        child: Align(
                          alignment: Alignment.topLeft,
                          child: Text(
                            maxLines: 9,
                            overflow: TextOverflow.ellipsis,
                            movie.description,
                            textAlign: TextAlign.left,
                          ),
                        )),
                  ],
                ),
              ))
        ],
      ),
    );
  }
}
