// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'show_card_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ShowCardDTO _$ShowCardDTOFromJson(Map<String, dynamic> json) => ShowCardDTO(
      id: json['char_id'] as int?,
      nickname: json['nickname'] as String?,
      picture: json['img'] as String?,
      birthday: json['birthday'] as String?,
      name: json['name'] as String?,
      status: json['status'] as String?,
    );

Map<String, dynamic> _$ShowCardDTOToJson(ShowCardDTO instance) =>
    <String, dynamic>{
      'char_id': instance.id,
      'name': instance.name,
      'birthday': instance.birthday,
      'img': instance.picture,
      'nickname': instance.nickname,
      'status': instance.status,
    };
