class Movie {
  int? _id;
  String _image;
  String _title;
  String _description;
  double _rate;
  String _date;

  Movie({
    int? id,
    required String image,
    required String title,
    required String description,
    required double rate,
    required String date,
  })  : _id = id,
        _image = image,
        _title = title,
        _description = description,
        _rate = rate,
        _date = date;

  factory Movie.fromJson(Map<String, dynamic> json) {
    return Movie(
      id: json['id'] as int?,
      image: json["image"] as String,
      title: json['title'] as String,
      description: json['description'] as String,
      rate: (json['rate'] ?? 0).toDouble() as double,
      date: json['date'] as String,
    );
  }

  int? get id => _id;
  set id(int? value) => _id = value;

  String get image => _image;
  set image(String value) => _image = value;

  String get title => _title;
  set title(String value) => _title = value;

  String get description => _description;
  set description(String value) => _description = value;

  double get rate => _rate;
  set rate(double value) => _rate = value;

  String get date => _date;
  set date(String value) => _date = value;

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{
      'id': _id,
      'image': _image,
      'title': _title,
      'description': _description,
      'rate': _rate,
      'date': _date,
    };

    return data;
  }
}
