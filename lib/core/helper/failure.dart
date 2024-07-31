/// Failure class to handle error message and status code
final class Failure {
  /// Constructor for failure
  const Failure(this.statusCode, this.message);
  final String message;
  final int statusCode;
}
