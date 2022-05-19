import 'package:flutter/material.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';

/// Константы для запросов
class MovieQuery {
  static const String baseUrl = 'https://breakingbadapi.com/api/characters';
  static const String pisecImageUrl = 'https://a.d-cd.net/KiAAAgCig-A-960.jpg';
  static const String nothingImageUrl =
      'https://venturebeat.com/wp-content/uploads/2014/07/imgur-search.png?fit=400%2C236&strip=all';

  static const String initialQ = 'white';
}

/// Константы локализации
class MovieLocal {
  static const String error = 'Ошибка';
  static const String unknown = 'Неизвестно';
  static const String ratingPrefix = 'Оценка: ';
  static const String ratingSuffix = '/ 10';
  static const String search = 'Поиск';
}

/// Константы изображений
class MoviePictures {
  static CacheManager pictureCache =
      CacheManager(Config('movieImg', stalePeriod: const Duration(days: 7)));
}

/// Константы для цветов
class MovieColors {
  static const Color greenColor = Color.fromRGBO(54, 164, 94, 1);
  static const Color greyColor = Color.fromRGBO(84, 84, 84, 1);
  static const Color cardBlackColor = Color.fromRGBO(28, 28, 28, 1.0);
  static const Color backgroundBlackColor = Color.fromRGBO(16, 16, 16, 1.0);
}
