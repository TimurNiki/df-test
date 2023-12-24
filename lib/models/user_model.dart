// ignore_for_file:  sort_constructors_first
// ignore_for_file: public_member_api_docs, lines_longer_than_80_chars

import 'package:equatable/equatable.dart';

// part 'user_model.g.dart';

class User extends Equatable {
  const User({required this.id, required this.username, required this.password, required this.fullName});

  final String id;
  final String username;
  final String password;
  final String fullName;

  @override
  List<Object> get props => [id, username, password, fullName];
}
