import 'package:circular_bottom_navigation/tab_item.dart';
import 'package:flutter/material.dart';

List<TabItem> tabItems = List.of([
  TabItem(Icons.home, "Home", Colors.blue,
      labelStyle: TextStyle(fontWeight: FontWeight.normal)),
  TabItem(Icons.search, "Search", Colors.orange,
      labelStyle: TextStyle(fontWeight: FontWeight.normal)),
  TabItem(Icons.favorite, "Favorites", Colors.red,
      labelStyle: TextStyle(fontWeight: FontWeight.normal)),
  TabItem(Icons.supervised_user_circle, "Account", Colors.cyan,
      labelStyle: TextStyle(fontWeight: FontWeight.normal)),
]);
