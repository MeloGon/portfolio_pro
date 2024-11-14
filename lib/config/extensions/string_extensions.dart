extension Converter on String {
  String get transformNewLine {
    return replaceAll(r'\n', '\n');
  }
}
