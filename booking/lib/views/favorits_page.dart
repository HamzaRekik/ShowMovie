import 'package:booking/views/single_favourite_page.dart';
import 'package:booking/widgets/favourit_widget.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FavoritsView extends StatefulWidget {
  final Function toggleTheme;
  final bool isDarkMode;

  const FavoritsView(
      {super.key, required this.toggleTheme, required this.isDarkMode});

  @override
  State<FavoritsView> createState() => _MoviesBuilderState();
}

class _MoviesBuilderState extends State<FavoritsView> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  List<Map<String, dynamic>> movies = []; // List to store fetched movies

  @override
  void initState() {
    super.initState();
    _fetchPosts();
  }

  Future<void> _fetchPosts() async {
    try {
      User? user = _auth.currentUser;

      QuerySnapshot querySnapshot = await _firestore
          .collection('films')
          .where('userId', isEqualTo: user?.uid)
          .get();

      if (querySnapshot.docs.isNotEmpty) {
        setState(() {
          movies = querySnapshot.docs
              .map((doc) => doc.data() as Map<String, dynamic>)
              .toList();
        });
      }
    } catch (e) {
      print('Error fetching posts: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
<<<<<<< HEAD
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Favourite Movies",
          style: TextStyle(color: Colors.deepPurple),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 8.0,
          mainAxisSpacing: 8.0,
        ),
        itemCount: 15,
        itemBuilder: (context, index) {
          return FavouriteMovie();
        },
      ),
    );
  }
}

class FavouriteMovie extends StatelessWidget {
  const FavouriteMovie({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        height: 200,
        child: Column(
          children: [
            Expanded(
              flex: 2,
              child: Image.network(
                'https://image.tmdb.org/t/p/w500/ctMserH8g2SeOAnCw5gFjdQF8mo.jpg',
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "hom",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text("hello"),
            ),
          ],
        ),
      ),
    );
=======
    if (movies.isEmpty) {
      return Center(
        child: CircularProgressIndicator(),
      );
    } else {
      return CustomScrollView(
        physics: BouncingScrollPhysics(),
        slivers: [
          SliverToBoxAdapter(
            child: SizedBox(
              height: 35,
            ),
          ),
          SliverToBoxAdapter(
            child: Text(
              "Favourite Movies",
              style: TextStyle(fontSize: 35),
            ),
          ),
          SliverToBoxAdapter(
            child: SizedBox(
              height: 20,
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                return GestureDetector(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return FavouriteDetailPage(movie: movies[index]);
                    }));
                  },
                  child: FavouriteWidget(
                    movie: movies[index],
                  ),
                );
              },
              childCount: movies.length,
            ),
          ),
          SliverToBoxAdapter(
            child: SizedBox(
              height: 55,
            ),
          ),
        ],
      );
    }
>>>>>>> 475406363b1f678593777d3d578a09b451469f7c
  }
}
