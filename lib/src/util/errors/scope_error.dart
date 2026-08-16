/// error throwen by calling navigation method outside MainPage()
class ScopeError implements Exception {
  /// error message
  final String message;

  ///
  ScopeError(this.message);

  @override
  String toString() => 'ScopeError: $message';
}
