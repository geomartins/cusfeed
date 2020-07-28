import './error.dart';
import './snackbar.dart';
import './date.dart';

class Pick extends Object with Error, Snackbar, Date {}

Pick mPick = new Pick();
