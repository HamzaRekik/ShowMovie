import 'package:booking/views/movies_builder.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  final Function toggleTheme;
  final bool isDarkMode;

  const Home({super.key, required this.toggleTheme, required this.isDarkMode});
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.symmetric(horizontal: 10), child: MoviesBuilder());
  }
}
