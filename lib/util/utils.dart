bool isNumeric(String str) {
  return double.tryParse(str) != null;
}

String getDateString(DateTime date) {
  return '${('0' + date.day.toString()).substring(0, 2)}/${('0' + date.month.toString()).substring(0, 2)}/${date.year}';
}
