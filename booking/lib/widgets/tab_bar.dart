import 'package:booking/views/favorits_page.dart';
import 'package:booking/views/home.dart';
import 'package:booking/views/search_page.dart';
import 'package:booking/views/settings.dart';
import 'package:flutter/material.dart';
import 'package:circular_bottom_navigation/circular_bottom_navigation.dart';
import '../config/tab_items.dart';

class CircularTabBar extends StatefulWidget {

  final Function toggleTheme;
  final bool isDarkMode;

  const CircularTabBar(
      {super.key, required this.toggleTheme, required this.isDarkMode});

  @override
  _CircularTabBarState createState() => _CircularTabBarState();
}

class _CircularTabBarState extends State<CircularTabBar> {
  int _currentIndex = 0;

  late final CircularBottomNavigationController _navigationController;
  late PageController _pageController =
      PageController(initialPage: _currentIndex);

  @override
  void initState() {
    super.initState();
    _navigationController = CircularBottomNavigationController(_currentIndex);
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
        title: Text('Movies'),
        elevation: 0,
        centerTitle: true,
      ),
      body: Stack(children: [
        PageView(
          controller: _pageController,
          onPageChanged: (index) {
            setState(() {
              _currentIndex = index;
              _navigationController.value = index;
            });
          },
          children: [Home(toggleTheme:widget.toggleTheme, isDarkMode: widget.isDarkMode), SearchView(toggleTheme:widget.toggleTheme, isDarkMode: widget.isDarkMode), FavoritsView(toggleTheme:widget.toggleTheme, isDarkMode: widget.isDarkMode), Settings(toggleTheme:widget.toggleTheme, isDarkMode: widget.isDarkMode)],
        ),
        Positioned(
          bottom: 0,
          child: CircularBottomNavigation(
            tabItems,
            controller: _navigationController,
            selectedCallback: (selectedPos) {
              setState(() {
                _currentIndex = selectedPos!;
                _pageController.animateToPage(
                  _currentIndex,
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
