class Formatters {
  const Formatters._();

  static String currency(num value) => value.toStringAsFixed(2);

  static String percent(num value) {
    final prefix = value >= 0 ? '+' : '';
    return '$prefix${value.toStringAsFixed(2)}%';
  }

  static String signedNumber(num value) {
    final prefix = value >= 0 ? '+' : '';
    return '$prefix${value.toStringAsFixed(2)}';
  }
}
