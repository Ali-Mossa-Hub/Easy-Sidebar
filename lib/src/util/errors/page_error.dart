class PageError implements Exception {
  final String message;

  PageError(this.message);

  @override
  String toString() => 'PageError: $message';
}
