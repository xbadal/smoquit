import 'package:intl/intl.dart';

String dateFormat(String date) {
  DateFormat dateFormat = DateFormat("yyyy-MM-ddTHH:mm:ss");
  DateTime dateTime = dateFormat.parse(date);
  String formattedDate = DateFormat('yyyy-MM-dd – HH:mm').format(dateTime);
  return formattedDate;
}

String dateFromTime(int timeInMillis) {
  DateTime dateTime = DateTime.fromMillisecondsSinceEpoch(timeInMillis);
  String formattedDate = DateFormat('yyyy-MM-dd – HH:mm').format(dateTime);
  return formattedDate;
}
String formattedTimeFromSeconds({required int timeInSecond}) {
  return '${(Duration(seconds: timeInSecond))}'.split('.')[0].padLeft(8, '0');
}