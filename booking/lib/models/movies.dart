class Movie {
  String image;
  String title;
  String description;
  double rate;
  String date;
  Movie({
    required this.image,
    required this.title,
    required this.description,
    required this.rate,
    required this.date,
  });



  factory Movie.fromJson(Map<String, dynamic> json) {
    return Movie(
      image: json["poster_path"] ?? '',
      title: json['title'] ?? json['name'] ?? '',
      description: json['overview'] ?? '',
      rate: (json['vote_average'] ?? 0).toDouble(),
      date: json['release_date'] ?? json["first_air_date"] ?? '',
    );
  }
}
