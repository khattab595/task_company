import 'package:intl/intl.dart';

class DateFormatter {
  static String DATE_FORMAT = 'dd-MM-yyyy';
  static String DATETIME_FORMAT = 'dd-MM-yyyy hh:mm:ss';
  static String formatDate(DateTime date) {
    return DateFormat(DATE_FORMAT).format(date);
  }

  static String formatDateTime(DateTime date) {
    return DateFormat(DATETIME_FORMAT).format(date);
  }

  static String formatToTime(String date) {
    DateTime dateTime = DateFormat('yyyy-MM-ddThh:mm:ss').parse(date);
    return DateFormat('yyyy-MM-dd').format(dateTime);
  }
  static String formatChatDate(String dateChat){
    try {
      final date = DateTime.parse(dateChat);
      final now = DateTime.now();
      final diff = now.difference(DateTime.parse(date.toString()));
      if (diff.inDays > 0) {
        return '${date.day}-${date.month}/${date.year}';
      } else if (diff.inHours > 0) {
        final formattedTime = DateFormat.jm().format(date);
        return formattedTime;
      } else {
        final formattedTime = DateFormat.jm().format(date);
        return formattedTime;
      }
    } on Exception {
      return '';
    }
  }
// convert from date string 20-8-2024 to 20 oct 2024
  static String formatOrderStatusDateString(String dateString){
    try {
      final DateFormat inputFormat = DateFormat('dd-MM-yyyy');
      final DateFormat outputFormat = DateFormat('dd\nMMM');
      DateTime date = inputFormat.parse(dateString);
      String formattedDate = outputFormat.format(date);
      return formattedDate;
    } on Exception {
      return '';
    }
  }

  static String formatTimestampString(String dateString, {String format = 'yyyy-MM-dd'}){
    // final lang = injector<ServicesLocator>().languageCode;
    try {
      print('formatTimestampString dateString: $dateString');
      final DateFormat inputFormat = DateFormat('yyyy-MM-dd hh:mm:ss');
      final DateFormat outputFormat = DateFormat(format);
      DateTime date = inputFormat.parse(dateString);
      String formattedDate = outputFormat.format(date);
      return formattedDate;
    } on Exception catch (e) {
      print('formatTimestampString error: $e');
      return '';
    }
  }
}