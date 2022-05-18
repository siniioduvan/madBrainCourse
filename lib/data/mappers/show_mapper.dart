

import 'package:film/data/dtos/show_card_dto.dart';
import 'package:film/domain/models/movie_card_model.dart';

/// Функция преобразования из [ShowCardDTO] в [MovieCardModel]
extension ShowCardFromDTOToDomain on ShowCardDTO {
  MovieCardModel toDomain() {
    return MovieCardModel(
      id: characters?.id ?? 0,
      title: characters?.name ?? '',
      picture: characters?.picture ?? '',
      releaseDate: characters?.birthday,
      description: characters?.description,
    );
  }
}
