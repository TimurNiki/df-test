import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
part 'item_rep.g.dart';



@JsonSerializable()

/// TaskList class
class Item extends Equatable {
  /// Constructor
  const Item({
    required this.id,
    required this.listid,
    required this.name,
    required this.description,
    required this.status,
  });

  /// deserialization
  factory Item.fromJson(Map<String, dynamic> json) =>
      _$ItemFromJson(json);

  /// copyWith method
  Item copyWith(
      {String? id,
      String? listid,
      String? name,
      String? description,
      bool? status}) {
    return Item(
      id: id ?? this.id,
      listid: listid ?? this.listid,
      name: name ?? this.name,
      description: description ?? this.description,
      status: status ?? this.status,
    );
  }

  /// Item's id
  final String id;

  /// List id of where the item belongs
  final String listid;

  /// Item's name
  final String name;

  /// Item's description
  final String description;

  /// Item's status
  final bool status;

  /// Serialization
  Map<String, dynamic> toJson() => _$ItemToJson(this);

  @override
  List<Object?> get props => [id, name];
}
