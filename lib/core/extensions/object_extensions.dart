extension ObjectExtensions on Object? {
  int get toInt => double.tryParse(toString())?.toInt() ?? 0;

  double get toDouble => double.tryParse(toString()) ?? 0;

  bool get toBoolean => bool.tryParse(toString()) ?? false;

  /// if you want to pass a default value

  int toInt2(int value) => double.tryParse(toString())?.toInt() ?? value;

  double toDouble2(double value) => double.tryParse(toString()) ?? value;

  bool toBoolean2(bool value) => bool.tryParse(toString()) ?? value;
}
