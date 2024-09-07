import 'package:intl/intl.dart';

class DateConverter{
  static String formattedDate(String dateString){
    DateTime parsedDate = DateTime.parse(dateString);
    String formattedDate = DateFormat('MM/dd/yyyy').format(parsedDate);
    return formattedDate;
  }
}