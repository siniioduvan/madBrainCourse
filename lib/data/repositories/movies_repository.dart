import 'package:dio/dio.dart';
import 'package:film/components/dialogs/error_dialog.dart';
import 'package:film/components/constants.dart';
import 'package:film/data/dtos/show_card_dto.dart';
import 'package:film/data/mappers/show_mapper.dart';
import 'package:film/domain/models/home_model.dart';
import 'package:film/domain/models/movie_card_model.dart';
import 'package:flutter/material.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

/// Репозиторий для получения данных о фильмах
class MoviesRepository {
  /// Наш основной объект для выполнения запросов
  static final Dio _dio = Dio()
    ..interceptors.add(PrettyDioLogger(
      requestHeader: true,
      requestBody: true,
    ));

  /// Метод получения данных
  static Future<HomeModel?> loadData(
    BuildContext context, {
    required String q,
  }) async {
    try {
      // Выполняем запрос
      const String url = MovieQuery.baseUrl;
      final Response<dynamic> response = await _dio.get<List<dynamic>>(
        url,
        queryParameters: <String, dynamic>{'q': q},
      );

      // Парсим ДТО
      final dtos = <ShowCardDTO>[];
      final responseList = response.data as List<dynamic>;
      for (final data in responseList) {
        dtos.add(ShowCardDTO.fromJson(data as Map<String, dynamic>));
      }

      // Конвертируем ДТО в модели
      final movieModels = <MovieCardModel>[];
      for (final dto in dtos) {
        movieModels.add(dto.toDomain());
      }

      // Собираем модели карточек фильмов и возвращаем единую модель
      final HomeModel model = HomeModel(results: movieModels);
      return model;
    } on DioError catch (error) {
      // todo отправка в Firebase Crashlytics

      // При ошибке покажем ее в диалоге
      final statusCode = error.response?.statusCode;
      showErrorDialog(context, error: statusCode?.toString() ?? '');
      return null;
    }
  }
}
