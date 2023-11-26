import 'package:flutter/material.dart';

class LocalData extends StatelessWidget {
  final Function toggleTheme;
  final bool isDarkMode;

  const LocalData(
      {super.key, required this.toggleTheme, required this.isDarkMode});
  @override
  Widget build(BuildContext build) {
    return Center(
      child: Text("SQL LITE"),
    );
  }
}
