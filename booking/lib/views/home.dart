import 'package:booking/views/movies_builder.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.grey[100],
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: MoviesBuilder());
  }
}
