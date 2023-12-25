// ignore_for_file: public_member_api_docs, require_trailing_commas
import 'package:first_project/exceptions/user_does_not_exist.dart';
import 'package:first_project/exceptions/user_registered_exception.dart';
import 'package:first_project/models/user_model.dart';

final _userDb = <String, User>{};

final class UserService {
  Future<User> login(
      {required String username, required String password}) async {
    if (!_userDb.containsKey(username)) {
      throw UserDoesNotExistException('User does not exist');
    }
    return _userDb[username]!;
  }

  Future<void> register(
      {required String fullName,
      required String username,
      required String password}) async {
    if (_userDb.containsKey(username)) {
      throw UserRException('Username $username already exists in the database');
    }

    final id = _userDb.length.toString();

    final user = User(
        id: id, username: username, password: password, fullName: fullName);
    _userDb[username] = user;
  }
}
