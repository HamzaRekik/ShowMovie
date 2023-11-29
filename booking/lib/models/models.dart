class Movie {
  int id;
  String image;
  String background;
  String title;
  String description;
  double rate;
  String date;
  Movie({
    required this.id,
    required this.image,
    required this.background,
    required this.title,
    required this.description,
    required this.rate,
    required this.date,
  });

  factory Movie.fromJson(Map<String, dynamic> json) {
    return Movie(
      id: json["id"],
      image: json["poster_path"] ?? '',
      background: json["backdrop_path"] ?? '',
      title: json['title'] ?? json['name'],
      description: json['overview'],
      rate: json['vote_average'],
      date: json['release_date'] ?? json["first_air_date"],
    );
  }
}

class FavouriteMovie {
  Movie movie;
  String userID;

  FavouriteMovie({required this.movie, required this.userID});
}
