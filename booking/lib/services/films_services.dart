import 'package:booking/services/database_connexion.dart';

import '../models/movie.dart';

class FilmService {
//--------------------------------
//SQL LITE------------------------------->
//--------------------------------

  Future<List<Movie>> listeClasses() async {
    List<Map<String, dynamic>> cls = await MovieDatabase.retrieveMovies();
    return cls.map((item) => Movie.fromJson(item)).toList();
  }

//Méthode d’ajout
  Future<bool> ajouterClasse(Movie c) async {
    int res = await MovieDatabase.insertMovie(c);
    return res > 0 ? true : false;
  }

//Méthode modifier
  Future<bool> modifierClasse(Movie c) async {
    int res = await MovieDatabase.updateMovie(c);
    return res > 0 ? true : false;
  }

//Méthode supprimer
  Future<bool> supprimerClasse(Movie c) async {
    int res = await MovieDatabase.deleteMovie(c.id!);
    return res > 0 ? true : false;
  }
}
