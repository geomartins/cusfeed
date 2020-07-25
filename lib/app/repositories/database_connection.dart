import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';

class DatabaseConnection {
  setDatabase() async {
    var directory = await getApplicationDocumentsDirectory();
    var path = join(directory.path, 'db_ratings_sqfl');
    var database =
        await openDatabase(path, version: 1, onCreate: _onCreatingDatabase);
    return database;
  }

  _onCreatingDatabase(Database database, int version) async {
    //ratings are bad, fair, good, very_good, excellent
    await database.execute(
        "CREATE TABLE ratings(id INTEGER PRIMARY KEY, date TEXT, bad INTEGER DEFAULT 0, fair INTEGER DEFAULT 0, good INTEGER DEFAULT 0, very_good INTEGER DEFAULT 0, excellent INTEGER DEFAULT 0)");
  }
}
