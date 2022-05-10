class FilmCardModel {
  const FilmCardModel({
    required this.id,
    required this.title,
    required this.language,
    this.picture = '',
    this.voteAverage = 0,
    this.releaseDate = '',
    this.description = '',
  });

  final int id;
  final String title;
  final String picture;
  final double voteAverage;
  final String releaseDate;
  final String description;
  final String language;
}
