import 'package:flutter/material.dart';


class FavouriteWidget extends StatelessWidget {
  FavouriteWidget({required this.movie});
  final Map<String, dynamic> movie;

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
              image: NetworkImage(
                "https://image.tmdb.org/t/p/w500${movie['image']}",
              ),
              height: 200,
              width: 200,
              fit: BoxFit.cover,
            ),
          ),
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
                              movie['title'].toString(),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.left,
                            ),
                          ),
                        ),
                        Container(
                          child: Text(
                            "${movie['rate'].round()}",
                          ),
                        )
                      ],
                    ),
                  ),
                  Expanded(
                    child: Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        movie['date'].toString(),
                        textAlign: TextAlign.left,
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 6,
                    child: Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        movie['description'].toString(),
                        maxLines: 9,
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.left,
                      ),
                    ),
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
