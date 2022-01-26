class Failure implements Exception {
  final int? statusCode;
  final String? message;
  const Failure({
    this.statusCode,
    this.message,
  });

  @override
  String toString() => 'Failure(statusCode: $statusCode, message: $message)';
}

class LogOutFailure implements Exception {}
