class ScopeError implements Exception {
  final String message;

  ScopeError(this.message);

  @override
  String toString() => 'ScopeError: $message';
}
