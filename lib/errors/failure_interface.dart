abstract class IFailure implements Exception {
  final Exception? exception;
  final String message;

  IFailure(this.message, [this.exception]);
}
