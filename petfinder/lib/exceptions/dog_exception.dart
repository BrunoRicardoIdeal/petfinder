// ignore_for_file: public_member_api_docs, sort_constructors_first
class DogException implements Exception {
  String message;
  DogException({
    required this.message,
  }) {
    message = 'Dog Exception: $message';
  }

  @override
  String toString() => 'DogException(message: $message)';
}
