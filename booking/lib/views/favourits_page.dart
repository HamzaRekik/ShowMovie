import 'package:booking/widgets/favourite_movies_builder.dart';
import 'package:flutter/material.dart';

class Favourits extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: FavouriteMoviesBuilder());
  }
}
