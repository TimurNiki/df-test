// ignore_for_file:  sort_constructors_first, must_be_immutable
// ignore_for_file: public_member_api_docs, lines_longer_than_80_chars
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
part 'user_model.g.dart';

@JsonSerializable()
class User extends Equatable {
  final String? id;
  final String? username;
  final String? password;
  final String? fullName;

  const User({
    this.id,
    this.username,
    this.password,
    this.fullName,
  });

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  Map<String, dynamic> toJson() => _$UserToJson(this);

  @override
  List<Object?> get props => [id, username, password, fullName];

  User copyWith({
    String? id,
    String? username,
    String? password,
    String? fullName,
  }) {
    return User(
      id: id ?? this.id,
      username: username ?? this.username,
      password: password ?? this.password,
      fullName: fullName ?? this.fullName,
    );
  }
}
