sealed class AnimalException implements Exception {
  final String message;
  final StackTrace? stackTrace;

  const AnimalException(this.message, [this.stackTrace]);

  @override
  String toString() {
    return message;
  }
}

class AnimalServiceException extends AnimalException {
  const AnimalServiceException(super.message, [super.stackTrace]);
}
