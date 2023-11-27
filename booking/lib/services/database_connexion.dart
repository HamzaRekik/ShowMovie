import 'package:booking/models/movie.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class MovieDatabase {
  static Database? _db;
  static int get _version => 1;

  static Future<void> getDb() async {
    if (_db == null) await initDB();
  }

  static Future<void> initDB() async {
    String databasePath = await getDatabasesPath();
    String _path = join(databasePath, 'movies.db');
    _db = await openDatabase(_path, version: _version, onCreate: _onCreate);
  }

  static _onCreate(Database db, int version) async {
    String sql =
        'CREATE TABLE movies (id INTEGER PRIMARY KEY,image TEXT,title TEXT,description TEXT,rate REAL,date TEXT)';
    await db.execute(sql);
  }

  static Future<List<Map<String, dynamic>>> retrieveMovies() async {
    await getDb();
    return _db!.query("movies");
  }

  static Future<int> insertMovie(Movie movie) async {
    await getDb();
    return _db!.insert("movies", movie.toJson());
  }

  static Future<int> updateMovie(Movie movie) async {
    await getDb();
    return _db!.update("movies", movie.toJson(),
        where: 'id = ?', whereArgs: [movie.id]);
  }

  static Future<int> deleteMovie(int id) async {
    await getDb();
    return _db!.delete("movies", where: 'id = ?', whereArgs: [id]);
  }
}
