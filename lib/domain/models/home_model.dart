import 'package:film/domain/models/movie_card_model.dart';

/// Чистая модель нашего главного окна
class HomeModel {
  final List<MovieCardModel>? results;

  HomeModel({this.results});
}
