import 'package:film/components/locals/locale_base.dart';

class LocaleRu implements LocaleBase {
  @override
  String get error => 'Ошибка';

  @override
  String get unknown => 'Неизвестно';

  @override
  String get ratingPrefix => 'Оценка: ';

  @override
  String get ratingSuffix => '/ 10';

  @override
  String get search => 'Поиск';

  @override
  String get switchLanguage => 'Сменить язык';

  @override
  String get deleteFavourites => 'Удалить из избранного';

  @override
  String get addFavourites => 'Добавить в избранное';

  @override
  String get breakingBad => 'Во все тяжкие';

  @override
  String get favourite => 'Избранное';

  @override
  String get more => 'Подробнее';

  @override
  String get detailsTitle => 'Подробно';

  @override
  String get favouritesTitle => 'Избранное';

  @override
  String get feedTitle => 'Во все тяжкие';

  @override
  String get settingsBack => 'Назад';

  @override
  String get settingsClearName => 'Очистить Имя';

  @override
  String get settingsExit => 'Выход';

  @override
  String get settingsGetName => 'Получить Имя';

  @override
  String get settingsSaveName => 'Сохранить имя';

  @override
  String get settingsTitle => 'Настройки';
}
