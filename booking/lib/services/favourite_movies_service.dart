import 'package:booking/models/models.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FavouriteMoviesService {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  User? user = FirebaseAuth.instance.currentUser;

  Future<String> addToFavourite({required Movie movie}) async {
    String userId = user!.uid;

    CollectionReference movies = firestore.collection('movies');
    DocumentReference film = await movies.add({
      'image': 'https://image.tmdb.org/t/p/w500${movie.image}',
      'title': movie.title,
      'description': movie.description,
      'rate': movie.rate,
      'date': movie.date,
      'userID': userId,
    });

    String movieID = film.id;
    return movieID;
  }

  Future<bool> checkFavouriteExistence({required Movie movie}) async {
    String userId = user!.uid;

    QuerySnapshot querySnapshot = await firestore
        .collection('movies')
        .where('userID', isEqualTo: userId)
        .where('title', isEqualTo: movie.title)
        .get();
    print("Is the movie in favourite? ${querySnapshot.docs.isNotEmpty}");
    return querySnapshot.docs.isNotEmpty;
  }

  Future<void> deleteFromFavourite({required String movieId}) async {
    await firestore.collection('movies').doc(movieId).delete();
  }

  Future<String> getMovieIdByTitle(String title) async {
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance
        .collection('movies')
        .where('title', isEqualTo: title)
        .get();

    if (querySnapshot.docs.isNotEmpty) {
      String documentId = querySnapshot.docs[0].id;
      return documentId;
    } else {
      return '';
    }
  }

  Future<List<Map<String, dynamic>>> fetchMovies() async {
    String userId = user!.uid;
    try {
      QuerySnapshot querySnapshot = await FirebaseFirestore.instance
          .collection('movies')
          .where('userID', isEqualTo: userId)
          .get();

      List<Map<String, dynamic>> movies =
          querySnapshot.docs.map((DocumentSnapshot doc) {
        return doc.data() as Map<String, dynamic>;
      }).toList();

      return movies;
    } catch (e) {
      print('Error fetching movies: $e');
      return [];
    }
  }

  Future<void> deleteDocument(String title) async {
    try {
      String id = await getMovieIdByTitle(title);
      await FirebaseFirestore.instance.collection('movies').doc(id).delete();
      print('Document deleted successfully');
    } catch (e) {
      print('Error deleting document: $e');
    }
  }
}
