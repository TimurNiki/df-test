import 'package:json_annotation/json_annotation.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
part 'rlist.g.dart';

@visibleForTesting
Map<String, RList> db = {};



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


// // import 'package:equatable/equatable.dart';

// // Map<String, RList> db = {};

// // class RList extends Equatable{
// //   const RList({required this.id, required this.name});

// // final String id;
// // final String name;

// //   @override
// //   // TODO: implement props
// //   List<Object?> get props => [id,name];

// // }