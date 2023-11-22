import 'package:circular_bottom_navigation/tab_item.dart';
import 'package:flutter/material.dart';

List<TabItem> tabItems = List.of([
  TabItem(Icons.home, "Home", Colors.deepPurple,
      labelStyle: TextStyle(fontWeight: FontWeight.normal)),
  TabItem(Icons.search, "Search", Colors.deepPurple,
      labelStyle: TextStyle(fontWeight: FontWeight.normal)),
  TabItem(Icons.favorite, "Favorites", Colors.deepPurple,
      labelStyle: TextStyle(fontWeight: FontWeight.normal)),
  TabItem(Icons.supervised_user_circle, "Account", Colors.deepPurple,
      labelStyle: TextStyle(fontWeight: FontWeight.normal)),
]);
