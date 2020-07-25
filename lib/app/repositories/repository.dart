import 'package:sqflite/sqflite.dart';
import './database_connection.dart';

class Repository {
  DatabaseConnection _databaseConnection;

  Repository() {
    //initialize database connection
    _databaseConnection = DatabaseConnection();
  }

  static Database _database;

  Future<Database> get database async {
    if (_database != null) return _database;

    _database = await _databaseConnection.setDatabase();
    return _database;
  }

  //Inserting data to table
  insertData(String table, Map<String, dynamic> data) async {
    var connection = await database;
    return await connection.insert(table, data);
  }

  Future<dynamic> insertOrUpdateData(
      String table, Map<String, dynamic> data) async {
    var connection = await database;
    Map<String, dynamic> newValue = {};
    var result;

    //first, lets check if the date is avaible
    List<Map<String, dynamic>> check = await connection
        .query(table, where: 'date=?', whereArgs: [data['date']]);

    //if the length is greater than 0
    if (check.length > 0) {
      newValue = {
        'date': data['date'],
        "${data['type']}": check[0][data["type"]] + data['value'],
      };
      result = await connection.update(table, newValue);
    } else {
      newValue = {
        'date': data['date'],
        "${data['type']}": data['value'],
      };
      result = await insertData(table, newValue);
    }

    return result;
  }

  readData(String table) async {
    var connection = await database;
    return await connection.query(table);
  }

  //read data from table by ID
  Future<List<Map<String, dynamic>>> readDataById(String table, itemId) async {
    var connection = await database;
    return await connection.query(table, where: 'id=?', whereArgs: [itemId]);
  }

  //update data from table
  Future<int> updateData(String table, Map<String, dynamic> data) async {
    var connection = await database;
    return await connection
        .update(table, data, where: 'id=?', whereArgs: [data['id']]);
  }

  //delete data from table
  Future<int> deleteData(String table, itemId) async {
    var connection = await database;
    return await connection.rawDelete("DELETE FROM $table WHERE id=$itemId");
  }

  //delete all from table
  Future<int> deleteAllData(String table) async {
    var connection = await database;
    return await connection.rawDelete("DELETE FROM $table");
  }
}
