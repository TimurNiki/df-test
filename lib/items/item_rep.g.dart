// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'item_rep.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Item _$ItemFromJson(Map<String, dynamic> json) => Item(
      id: json['id'] as String,
      listid: json['listid'] as String,
      name: json['name'] as String,
      description: json['description'] as String,
      status: json['status'] as bool,
    );

Map<String, dynamic> _$ItemToJson(Item instance) => <String, dynamic>{
      'id': instance.id,
      'listid': instance.listid,
      'name': instance.name,
      'description': instance.description,
      'status': instance.status,
    };
