String getDateOnly(String dateTimeString) {
  DateTime dateTime = DateTime.parse(dateTimeString);
  String dateOnly = dateTime.toString().split(' ')[0];
  return dateOnly;
}
