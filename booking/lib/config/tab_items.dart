import 'package:circular_bottom_navigation/tab_item.dart';
import 'package:flutter/material.dart';

List<TabItem> tabItems = List.of([
  TabItem(Icons.home, "Home", Colors.deepPurple,
      labelStyle: const TextStyle(fontWeight: FontWeight.normal)),
  TabItem(Icons.search, "Search", Colors.deepPurple,
      labelStyle: const TextStyle(fontWeight: FontWeight.normal)),
  TabItem(Icons.favorite, "Favorites", Colors.deepPurple,
      labelStyle: const TextStyle(fontWeight: FontWeight.normal)),
  TabItem(Icons.data_array_rounded, "SQLITE", Colors.deepPurple,
      labelStyle: const TextStyle(fontWeight: FontWeight.normal)),
  TabItem(Icons.settings, "Settings", Colors.deepPurple,
      labelStyle: const TextStyle(fontWeight: FontWeight.normal)),
]);
