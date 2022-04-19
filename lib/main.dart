import 'package:flutter/material.dart';

abstract class AbstractFilm {
  const AbstractFilm(this.id, this.title, this.picture, this.voteAverage,
      this.releaseDate, this.description, this.language);

  final String id;
  final String title;
  final String picture;
  final double voteAverage;
  final String releaseDate;
  final String description;
  final String language;

  void aboutFilm();
}

enum Language { russian, english, france, deutsch }

extension LanguageExtension on Language {
  String toPrettyString() {
    switch (this) {
      case Language.deutsch:
        return 'Немецкий';
      case Language.english:
        return 'Английский';
      case Language.france:
        return 'Французский';
      case Language.russian:
        return 'Русский';
    }
  }
}

class Film extends AbstractFilm with languageConvert{
  const Film({
    required String id,
    required String title,
    required String picture,
    required double voteAverage,
    required String releaseDate,
    required String description,
    required String language,
  }) : super(
      id,
      title,
      picture,
      voteAverage,
      releaseDate,
      description,
      language);

  @override
  void aboutFilm() {
    print('Фильм: $title, описание: $description, рейтинг: $voteAverage');
  }

}

mixin languageConvert {
  Language? getLanguage (String language) {
    switch (language) {
      case 'russian':
        return Language.russian;
      case 'english':
        return Language.english;
      case 'france':
        return Language.france;
      case 'deutsch':
        return Language.deutsch;
    }
  }
}

List<Film> _getFilm() {
  return [
    const Film(
        id: "01",
        title: "Зеленая миля",
        picture:
            'https://avatars.mds.yandex.net/get-kinopoisk-image/1599028/4057c4b8-8208-4a04-b169-26b0661453e3/600x900',
        voteAverage: 9.1,
        releaseDate: '6 декабря 1999',
        description:
            'Пол Эджкомб — начальник блока смертников в тюрьме «Холодная гора», каждый из узников которого однажды проходит «зеленую милю» по пути к месту казни. Пол повидал много заключённых и надзирателей за время работы. Однако гигант Джон Коффи, обвинённый в страшном преступлении, стал одним из самых необычных обитателей блока.,',
        language: 'russian'),
    const Film(
        id: '02',
        title: 'Побег из Шоушенка',
        picture:
            'https://avatars.mds.yandex.net/get-kinopoisk-image/1599028/0b76b2a2-d1c7-4f04-a284-80ff7bb709a4/600x900',
        voteAverage: 9.1,
        releaseDate: '10 сентября 1994',
        description:
            'Бухгалтер Энди Дюфрейн обвинён в убийстве собственной жены и её любовника. Оказавшись в тюрьме под названием Шоушенк, он сталкивается с жестокостью и беззаконием,',
        language: 'russian'),
    const Film(
        id: '03',
        title: 'Список Шиндлера',
        picture:
            'https://avatars.mds.yandex.net/get-kinopoisk-image/1773646/b327ada7-d790-49ae-8b24-374497a0980c/600x900',
        voteAverage: 8.8,
        releaseDate: '30 ноября 1993',
        description:
            'История немецкого промышленника, спасшего тысячи жизней во время Холокоста. Драма Стивена Спилберга',
        language: 'russian'),
    const Film(
        id: '04',
        title: 'Властелин колец',
        picture:
            'https://avatars.mds.yandex.net/get-kinopoisk-image/4303601/e410c71f-baa1-4fe5-bb29-aedb4662f49b/600x900',
        voteAverage: 8.6,
        releaseDate: '01 декабря 2003',
        description:
            'Повелитель сил тьмы Саурон направляет свою бесчисленную армию под стены Минас-Тирита, крепости Последней Надежды.',
        language: 'russian')
  ];
}

void main() {
  List<Film> film = _getFilm();
}
