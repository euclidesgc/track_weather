class Utils {
  static String convertTimestampToDateString(int timestamp) {
    final DateTime date = DateTime.fromMillisecondsSinceEpoch(timestamp * 1000);
    final String formattedDate =
        "${date.day}/${date.month}/${date.year} ${date.hour}:${date.minute}:${date.second}";
    return formattedDate;
  }
}
