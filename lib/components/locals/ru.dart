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
}
