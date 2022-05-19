import 'package:film/data/dtos/show_card_dto.dart';
import 'package:film/domain/models/movie_card_model.dart';

/// Функция преобразования из [ShowCardDTO] в [MovieCardModel]
extension ShowCardFromDTOToDomain on ShowCardDTO {
  MovieCardModel toDomain() {
    return MovieCardModel(
      id: id ?? 0,
      title: name ?? '',
      picture: picture ?? '',
      releaseDate: birthday,
      description: nickname,
      status: status,
    );
  }
}
