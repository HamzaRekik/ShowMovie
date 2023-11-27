import 'package:booking/views/favourits_page.dart';
import 'package:booking/views/home.dart';
import 'package:booking/views/search_page.dart';
import 'package:booking/views/settings.dart';
import 'package:flutter/material.dart';
import 'package:circular_bottom_navigation/circular_bottom_navigation.dart';
import '../config/tab_items.dart';
import '../views/local_data.dart';

class CircularTabBar extends StatefulWidget {
  final Function toggleTheme;
  final bool isDarkMode;

  const CircularTabBar(
      {super.key, required this.toggleTheme, required this.isDarkMode});

  @override
  _CircularTabBarState createState() => _CircularTabBarState();
}

class _CircularTabBarState extends State<CircularTabBar> {
  late final CircularBottomNavigationController _navigationController;
  late PageController _pageController = PageController(initialPage: 0);

  @override
  void initState() {
    super.initState();
    _navigationController = CircularBottomNavigationController(0);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        title: Text('Movies'),
        elevation: 0,
        centerTitle: true,
      ),
      body: Stack(children: [
        PageView(
          controller: _pageController,
          onPageChanged: (index) {
            setState(() {
              _navigationController.value = index;
            });
          },
          children: [
            Home(
                toggleTheme: widget.toggleTheme, isDarkMode: widget.isDarkMode),
            SearchView(
                toggleTheme: widget.toggleTheme, isDarkMode: widget.isDarkMode),
            Favourits(),
            LocalData(
                toggleTheme: widget.toggleTheme, isDarkMode: widget.isDarkMode),
            Settings(
                toggleTheme: widget.toggleTheme, isDarkMode: widget.isDarkMode)
          ],
        ),
        Positioned(
          bottom: 0,
          child: CircularBottomNavigation(
            tabItems,
            controller: _navigationController,
            selectedCallback: (selectedPos) {
              setState(() {
                _pageController.animateToPage(
                  selectedPos!,
                  duration: Duration(milliseconds: 300),
                  curve: Curves.bounceInOut,
                );
              });
            },
          ),
        ),
      ]),
    );
  }
}
