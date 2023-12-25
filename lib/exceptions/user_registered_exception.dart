// ignore_for_file: public_member_api_docs

class UserRException implements Exception{
  UserRException(this.message);

  final String message;
  @override
  String toString() => 'UserRException: $message';
}