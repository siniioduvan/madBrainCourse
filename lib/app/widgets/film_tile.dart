import 'package:film/app/models/film_card_models.dart';
import 'package:flutter/material.dart';

class FilmTile extends StatelessWidget {
  const FilmTile({
    Key? key,
    required this.title,
    required this.language,
    required this.voteAverage,
    required this.description,
    required this.picture,
    required this.id,
    required this.releaseDate,
  }) : super(key: key);

  factory FilmTile.fromFilm({
    required Film model,
    Key? key,
  }) {
    return FilmTile(
      id: model.id.toString(),
      title: model.title,
      picture: model.picture,
      voteAverage: model.voteAverage,
      releaseDate: model.releaseDate,
      description: model.description,
      language: model.language,
      key: key,
    );
  }

  final String title;
  final String language;
  final double voteAverage;
  final String id;
  final String picture;
  final String description;
  final String releaseDate;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Expanded(
          child: Image.network(
            picture,
            loadingBuilder: (BuildContext context, Widget child,
                ImageChunkEvent? loadingProgress) {
              if (loadingProgress == null) {
                return child;
              }
              return const Center(
                child: CircularProgressIndicator(),
              );
            },
          ),
        ),
        Expanded(
          flex: 2,
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  title,
                  style: Theme.of(context).textTheme.headline5?.copyWith(color: Colors.white),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  child: Row(
                    children: <Widget>[
                      const Padding(
                        padding: EdgeInsets.only(right: 8),
                        child: Icon(
                          Icons.star,
                          color: Colors.yellow,
                        ),
                      ),
                      Text(
                        voteAverage.toStringAsFixed(1),
                        style: TextStyle(
                          fontSize: 16,
                          color: voteAverage < 4
                              ? Colors.red
                              : voteAverage >= 8
                                  ? Colors.green
                                  : Colors.black,
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 16, bottom: 8),
                  child: Text(
                    'Дата выхода: $releaseDate',
                    style: Theme.of(context).textTheme.headline6?.copyWith(color: Colors.white),
                  ),
                ),
                Text(description,
                  style: TextStyle(color: Colors.white),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
