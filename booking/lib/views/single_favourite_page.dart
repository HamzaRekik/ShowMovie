import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class FavouriteDetailPage extends StatefulWidget {
  final Map<String, dynamic> movie;

  FavouriteDetailPage({required this.movie});

  @override
  State<FavouriteDetailPage> createState() => _MovieDetailPageState();
}

class _MovieDetailPageState extends State<FavouriteDetailPage> {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  bool isMovieAdded = false;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  void initState() {
    super.initState();
    _checkMovieExists();
  }

  Future<void> _checkMovieExists() async {
    try {
      User? user = _auth.currentUser;

      if (user != null) {
        QuerySnapshot<Map<String, dynamic>> querySnapshot = await _firestore
            .collection('films')
            .where('title', isEqualTo: widget.movie['title'])
            .where('userId', isEqualTo: user.uid)
            .limit(1)
            .get();

        if (querySnapshot.docs.isNotEmpty) {
          setState(() {
            isMovieAdded = true;
          });
        } else {
          setState(() {
            isMovieAdded = false;
          });
        }
      }
    } catch (e) {
      print('Error checking movie existence: $e');
    }
  }

  Future<void> _toggleMovieStatus() async {
    try {
      if (!isMovieAdded) {
        await _addMovieToFavorites();
      } else {
        await _removeMovieFromFavorites();
      }
    } catch (e) {
      print('Error toggling movie status: $e');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Failed to perform operation. Please try again.'),
          duration: Duration(seconds: 2),
        ),
      );
    }
  }

  Future<void> _addMovieToFavorites() async {
    User? user = _auth.currentUser;
    String postId = _firestore.collection('films').doc().id;
    DocumentReference filmRef = _firestore.collection('films').doc();

    await filmRef.set({
      'image': widget.movie['image'],
      'title': widget.movie['title'],
      'rate': widget.movie['rate'],
      'date': widget.movie['date'],
      'description': widget.movie['description'],
      'idf': postId,
      'userId': user?.uid
    });

    setState(() {
      isMovieAdded = true;
    });

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Movie added to your favorites successfully!'),
        duration: Duration(seconds: 2),
      ),
    );
  }

  Future<void> _removeMovieFromFavorites() async {
    QuerySnapshot querySnapshot = await _firestore
        .collection('films')
        .where('title', isEqualTo: widget.movie['title'])
        .get();

    querySnapshot.docs.forEach((doc) {
      doc.reference.delete();
    });

    setState(() {
      isMovieAdded = false;
    });

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Movie removed from your favorites!'),
        duration: Duration(seconds: 2),
      ),
    );
    Navigator.of(context).pushReplacementNamed('/');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _toggleMovieStatus();
        },
        backgroundColor: isMovieAdded ? Colors.red : Colors.white70,
        child: Icon(
          Icons.favorite,
          color: isMovieAdded ? Colors.white : Colors.grey,
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: Image(
              image: NetworkImage(
                  "https://image.tmdb.org/t/p/w500${widget.movie['image']}"),
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: SizedBox(
              height: 230,
              child: Column(
                children: [
                  SizedBox(height: 20),
                  Text("Rate: ${widget.movie['rate'].round()}"),
                  SizedBox(height: 10),
                  Text("Release Date: ${widget.movie['date']}"),
                  SizedBox(height: 10),
                  Text(
                    widget.movie['description'],
                    style: TextStyle(fontSize: 15),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
