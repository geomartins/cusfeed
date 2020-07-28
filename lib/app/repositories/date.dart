import 'package:intl/intl.dart';

mixin Date {
  String getCurrentDate() {
    var now = new DateTime.now();
    var formatter = new DateFormat('yyyy-MM-dd');
    String formattedDate = formatter.format(now);
    //print(formattedDate); // 2016-01-25
    return formattedDate;
  }
}
