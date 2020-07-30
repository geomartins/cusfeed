class RatingModel {
  final String createdAt;
  final int bad;
  final int fair;
  final int good;
  final int veryGood;
  final int excellent;
  final int total;

  RatingModel.json(Map<String, dynamic> data)
      : createdAt = data['date'],
        bad = data['bad'],
        fair = data['fair'],
        good = data['good'],
        veryGood = data['very_good'],
        excellent = data['excellent'],
        total = data['total'];
}
