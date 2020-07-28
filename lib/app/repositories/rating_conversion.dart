class RatingConversion {
  int _bad;
  int _fair;
  int _good;
  int _veryGood;
  int _excellent;
  String _date;

  RatingConversion({Map<String, dynamic> rating}) {
    _bad = rating['bad'];
    _fair = rating['fair'];
    _good = rating['good'];
    _veryGood = rating['very_good'];
    _excellent = rating['excellent'];
    _date = rating['date'];
  }

  Map<String, dynamic> percentageConversion() {
    int total = _calculateTotal();

    return {
      'bad': ((_bad / total) * 100).toInt(),
      'fair': ((_fair / total) * 100).toInt(),
      'good': ((_good / total) * 100).toInt(),
      'very_good': ((_veryGood / total) * 100).toInt(),
      'excellent': ((_excellent / total) * 100).toInt(),
      'date': _date,
    };
  }

  int _calculateTotal() {
    int result = _bad + _fair + _good + _veryGood + _excellent;
    return result;
  }
}
