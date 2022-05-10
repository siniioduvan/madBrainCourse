
import 'package:film/app/feature/home/widgets/image_network.dart';
import 'package:film/app/models/film_card_models.dart';
import 'package:flutter/material.dart';

class FilmGridCard extends StatelessWidget {
  const FilmGridCard({
    //required this.id,
    required this.title,
    required this.picture,
    required this.voteAverage,
    Key? key,
  }) : super(key: key);

  factory FilmGridCard.fromFilm({
    required Film model,
    Key? key,
  }) {
    return FilmGridCard(
      //id: model.id,
      title: model.title,
      picture: model.picture,
      voteAverage: model.voteAverage,
      key: key,
    );
  }

  //final int id;
  final String title;
  final String picture;
  final double voteAverage;

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        boxShadow: const <BoxShadow>[
          BoxShadow(
            offset: Offset(1, 2),
            blurRadius: 5,
            spreadRadius: 2,
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: ImageNetwork(
          picture,
        ),
      ),
    );
  }
}