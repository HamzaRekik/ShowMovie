import 'package:flutter/material.dart';

import '../models/trip.dart';
import '../widgets/app_drawer.dart';
import 'category_screen.dart';
import 'favourite_screen.dart';

class TabsScreen extends StatefulWidget {
  final List<Trip> favoriteTrip;
  const TabsScreen(this.favoriteTrip, {super.key});

  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  late int _screenIndex = 0;
  void _screens(int index) {
    setState(() {
      _screenIndex = index;
    });
  }

  late List<Map<String, Object>> listScreens;
  @override
  void initState() {
    listScreens = [
      {
        'screen': const CatScreen(),
        'title': 'Categories',
      },
      {
        'screen': FavouritScreen(widget.favoriteTrip),
        'title': 'Favorites',
      },
    ];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> myWidgets = listScreens.map((item) {
      return item['screen'] as Widget;
    }).toList();

    List<String> titles = listScreens.map((item) {
      return item['title'] as String;
    }).toList();

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.blue[400],
        title: Text(
          titles[_screenIndex],
          style: const TextStyle(
            fontWeight: FontWeight.w400,
            fontSize: 22,
          ),
        ),
      ),
      drawer: const AppDrawer(),
      body: myWidgets[_screenIndex],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.blue[400],
        selectedItemColor: Colors.yellowAccent,
        unselectedItemColor: Colors.white,
        currentIndex: _screenIndex,
        onTap: _screens,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.dashboard),
            label: "Category",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.star),
            label: "favorites",
          ),
        ],
      ),
    );
  }
}


// class TabsScreens extends StatelessWidget {
//   const TabsScreens({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return DefaultTabController(
//       length: 2,
//       child: Scaffold(
//         appBar: AppBar(
//           centerTitle: true,
//           elevation: 0,
//           backgroundColor: Colors.blue[400],
//           title: const Text(
//             "Categories",
//             style: TextStyle(
//               fontWeight: FontWeight.w400,
//               fontSize: 22,
//             ),
//           ),
//           bottom: const TabBar(tabs: [
//             Tab(
//               icon: Icon(Icons.dashboard),
//               text: "Category",
//             ),
//             Tab(
//               icon: Icon(Icons.star),
//               text: "favorites",
//             )
//           ]),
//           actions: [
//             IconButton(
//               onPressed: () => {},
//               icon: const Icon(Icons.menu),
//             ),
//           ],
//         ),
//         body: const TabBarView(
//           children: [
//             CatScreen(),
//             FavouritScreen(),
//           ],
//         ),
//       ),
//     );
//   }
// }
