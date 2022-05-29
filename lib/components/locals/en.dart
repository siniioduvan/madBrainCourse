import 'package:film/components/locals/locale_base.dart';

class LocaleEn implements LocaleBase {
  @override
  String get error => 'Error';

  @override
  String get unknown => 'Unknown';

  @override
  String get ratingPrefix => 'Rating: ';

  @override
  String get ratingSuffix => '/ 10';

  @override
  String get search => 'Search';

  @override
  String get switchLanguage => 'Switch language';

  @override
  String get deleteFavourites => 'Delete favourites';

  @override
  String get addFavourites => 'Add in favourites';

  @override
  String get breakingBad => 'Breaking Bad';

  @override
  String get favourite => 'Favourite';

  @override
  String get more => 'More';

  @override
  String get detailsTitle => 'Details';

  @override
  String get favouritesTitle => 'Favourites';

  @override
  String get feedTitle => 'Breaking Bad';

  @override
  String get settingsBack => 'Back';

  @override
  String get settingsClearName => 'Clear Name';

  @override
  String get settingsExit => 'Exit';

  @override
  String get settingsGetName => 'Get Name';

  @override
  String get settingsSaveName => 'Save Name';

  @override
  String get settingsTitle => 'Settings';
}
