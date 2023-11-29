import 'package:dio/dio.dart';

import '../models/models.dart';

class MoviesService {
  Dio dio;
  String url = "https://api.themoviedb.org/3";
  String bearerToken =
      "eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiI2N2EyZDhmODE3M2RjNGI3OTVkZTVkZmUyNTQ3ZDcwYyIsInN1YiI6IjY0MGM3OTRjMWFjMjkyMDBiOGNhNjFkNiIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.hKk9Ry0syxZKfzUmgALBmcJzZiffj2gC9p6bdiaVtyg";

  MoviesService(this.dio);

  Future<List<Movie>> getMovies({String? title}) async {
    try {
      List<Movie> movies = [];
      Response response;
      Options options =
          Options(headers: {'Authorization': 'Bearer $bearerToken'});

      if (title == null) {
        response = await dio.get("$url/trending/all/day?language=en-US",
            options: options);
      } else {
        response = await dio.get(
            "$url/search/movie?language=en-US&query=$title&adult=false",
            options: options);
      }

      for (var movie in response.data['results']) {
        if (movie["poster_path"] != null && movie["backdrop_path"] != null) {
          Movie m = Movie.fromJson(movie);
          movies.add(m);
        }
      }
      return movies;
    } catch (e) {
      print(e);
      return [];
    }
  }

  Future<String> getTrailer({required int movieID}) async {
    try {
      Options options =
          Options(headers: {'Authorization': 'Bearer $bearerToken'});
      Response response = await dio
          .get('$url/movie/$movieID/videos?language=en-US', options: options);
      String videoKey = response.data['results'][0]['key'];
      return videoKey;
    } on DioException catch (e) {
      print(e);
      return '';
    }
  }
}
