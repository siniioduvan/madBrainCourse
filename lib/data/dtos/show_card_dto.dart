import 'package:json_annotation/json_annotation.dart';

part 'show_card_dto.g.dart';

/// Корневой элемент Json
@JsonSerializable()
class ShowCardDTO {
  @JsonKey(name: 'char_id')
  final int? id;

  @JsonKey(name: 'name')
  final String? name;

  @JsonKey(name: 'birthday')
  final String? birthday;

  @JsonKey(name: 'img')
  final String? picture;

  @JsonKey(name: 'nickname')
  final String? nickname;

  @JsonKey(name: 'status')
  final String? status;


  ShowCardDTO({
    this.id,
    this.nickname,
    this.picture,
    this.birthday,
    this.name,
    this.status,
  });

  factory ShowCardDTO.fromJson(Map<String, dynamic> json) =>
      _$ShowCardDTOFromJson(json);
}
