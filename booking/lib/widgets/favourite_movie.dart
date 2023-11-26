import 'package:booking/models/models.dart';
import 'package:flutter/material.dart';

class FavouriteMovie extends StatelessWidget {
  const FavouriteMovie({
    // required this.movie,
    super.key,
  });
  // final Movie movie;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
          image: NetworkImage(
              "https://image.tmdb.org/t/p/w500/ykl4EIbQIddiBYTrq5hghgDL9Ky.jpg"),
          fit: BoxFit.cover,
        )),
        child: Center(
            child: IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.favorite,
                  color: Colors.deepPurple,
                  size: 37,
                ))),
      ),
    );
  }
}
