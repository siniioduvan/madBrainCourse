void main() {}

abstract class AbstractFilm {
  String? id;
  String? title;
  String? picture;
  double? voteAverage;
  String? releaseDate;
  String? description;
  late String language;

}

class Film extends AbstractFilm with LanguageConvert {

}

enum Language { russian, english }

mixin LanguageConvert implements AbstractFilm {

  late Language lan;

  Language convertStringToEnum() {
    if (language == 'russian') {
      lan = Language.russian;
    } else if (language == 'english') {
      lan = Language.english;
    }
    return lan;
  }
}

extension LanguageEnum on Language {

  String toPrettyString(Language lan) {
    late String lang;
    if (lan == Language.russian) {
      lang = "russian";
    } else if (lan == Language.english) {
      lang = "english";
    }
    return lang;
  }
}