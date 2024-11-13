extension converter on String {
  String get transformNewLine {
    return replaceAll(r'\n', '\n');
  }
}