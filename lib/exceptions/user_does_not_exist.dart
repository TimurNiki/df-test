// ignore_for_file: public_member_api_docs

class UserDoesNotExistException implements Exception {
  UserDoesNotExistException(this.message);

  final String message;
  @override
  String toString() => 'UserDoesNotExistException: $message';
}
