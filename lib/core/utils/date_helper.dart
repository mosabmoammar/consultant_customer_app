import 'package:intl/intl.dart';

class DateHelper {
  static String getGroupHeader(DateTime date){
    final now = DateTime.now();
    final today = DateTime(now.year,now.month,now.day);
    final yesterday = today.subtract(const Duration(days: 1));
    final notificationDate = DateTime(date.year,date.month,date.day);

    if(notificationDate == today){
      return 'Today';
    } else if(notificationDate == yesterday){
      return 'Yesterday';
    }else if(notificationDate.year == now.year){
      return DateFormat('d MMMM').format(date);
    }else{
      return DateFormat('d MMMM yyyy').format(date);
    }
  }
}