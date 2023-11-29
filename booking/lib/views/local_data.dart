import 'package:booking/models/movie.dart';
import 'package:booking/services/films_services.dart';
import 'package:booking/views/sql_lite/add_film_page.dart';
import 'package:booking/views/sql_lite/film_widget.dart';
import 'package:booking/views/sql_lite/single_film_page.dart';
import 'package:flutter/material.dart';

class LocalData extends StatefulWidget {
  final Function toggleTheme;
  final bool isDarkMode;

  const LocalData(
      {super.key, required this.toggleTheme, required this.isDarkMode});

  @override
  State<LocalData> createState() => _LocalDataState();
}

class _LocalDataState extends State<LocalData> {
  List<Movie> _clList = [];
  final _clService = FilmService();

  @override
  void initState() {
    super.initState();
    getAllClasseDetails();
  }

  Future<void> getAllClasseDetails() async {
    var classes = await _clService.listeClasses();
    setState(() {
      _clList = classes.cast<Movie>();
    });
  }

  Future<void> _showSuccessSnackBar(String message) async {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      physics: const BouncingScrollPhysics(),
      slivers: [
        SliverToBoxAdapter(
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.deepPurple,
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => AddFilmPage(
                        toggleTheme: widget.toggleTheme,
                        isDarkMode: widget.isDarkMode)),
              ).then((data) async {
                if (data != null) {
                  await getAllClasseDetails();
                  await _showSuccessSnackBar('Movie added successfully');
                }
              });
            },
            child: Icon(Icons.add),
          ),
        ),
        SliverPadding(
          padding: const EdgeInsets.symmetric(vertical: 15.0),
          sliver: SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                return GestureDetector(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return MovieDetailPage(movie: _clList[index]);
                    }));
                  },
                  child: MovieWidget(
                    movie: _clList[index],
                  ),
                );
              },
              childCount: _clList.length,
            ),
          ),
        ),
      ],
    );
  }
}
