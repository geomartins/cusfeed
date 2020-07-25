import '../repositories/repository.dart';

class RatingService {
  Repository repository;
  RatingService() {
    repository = new Repository();
  }
  Future<dynamic> insertRating(
      {Map<String, dynamic> data, String table}) async {
    return await repository.insertData(table, data);
  }

  Future<dynamic> fetchRatings({String table}) async {
    return await repository.readData(table);
  }

  Future deleteAllRatings({String table}) async {
    return await repository.deleteAllData(table);
  }

  Future<dynamic> insertOrUpdateRating(
      {String table, Map<String, dynamic> data}) async {
    return await repository.insertOrUpdateData(table, data);
  }
}
