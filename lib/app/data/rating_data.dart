import 'package:flutter/material.dart';

class RatingData extends ChangeNotifier {
  bool isLoading = false;

  void updateLoading({bool type}) {
    isLoading = type;
    notifyListeners();
  }
}
