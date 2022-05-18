import 'package:json_annotation/json_annotation.dart';
part 'show_card_dto.g.dart';

@JsonSerializable()
class ShowCardDTO {

  @JsonKey(name: 'characters')
  final ShowCardDataDTO? characters;

  ShowCardDTO({
    this.characters,
  });

  factory ShowCardDTO.fromJson(Map<String, dynamic> json) =>
      _$ShowCardDTOFromJson(json);
}

/// элемент show:
@JsonSerializable()
class ShowCardDataDTO {
  @JsonKey(name: 'char_id', defaultValue: 0)
  final int id;

  @JsonKey(name: 'name', defaultValue: '')
  final String name;

  @JsonKey(name: 'img')
  final String? picture;

  @JsonKey(name: 'birthday')
  final String? birthday;

  @JsonKey(name: 'occupation')
  final String? description;

  ShowCardDataDTO({
    required this.id,
    required this.name,
    required this.picture,
    this.birthday,
    this.description,
  });

  factory ShowCardDataDTO.fromJson(Map<String, dynamic> json) =>
      _$ShowCardDataDTOFromJson(json);
}

