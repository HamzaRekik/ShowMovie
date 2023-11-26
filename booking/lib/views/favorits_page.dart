import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../widgets/favourite_movie.dart';

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
  List<Map<String, dynamic>> movies = [];

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
          crossAxisSpacing: 1.0,
          mainAxisSpacing: 1.0,
        ),
        itemCount: 16,
        itemBuilder: (context, index) {
          return FavouriteMovie();
        },
      ),
    );
  }
}
