// ignore_for_file: public_member_api_docs, collection_methods_unrelated_type
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
part 'rlist.g.dart';

@JsonSerializable()
class RList extends Equatable {
  const RList({required this.id, required this.name});

  factory RList.fromJson(Map<String, dynamic> json) => _$RListFromJson(json);

  final String? id;
  final String? name;

  Map<String, dynamic> toJson() => _$RListToJson(this);

  @override
  List<Object?> get props => [id, name];

  RList copyWith({
    String? id,
    String? name,
  }) {
    return RList(
      id: id ?? this.id,
      name: name ?? this.name,
    );
  }
}
