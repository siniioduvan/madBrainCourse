// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'show_card_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ShowCardDTO _$ShowCardDTOFromJson(Map<String, dynamic> json) => ShowCardDTO(
      id: json['char_id'] as int? ?? 0,
      name: json['name'] as String? ?? '',
      picture: json['img'] as String?,
      birthday: json['birthday'] as String?,
      description: json['occupation'] as String?,
    );

Map<String, dynamic> _$ShowCardDTOToJson(ShowCardDTO instance) =>
    <String, dynamic>{
      'char_id': instance.id,
      'name': instance.name,
      'img': instance.picture,
      'birthday': instance.birthday,
      'occupation': instance.description,
    };
