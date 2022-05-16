import 'package:film/app/feature/home/widgets/button/primary_button.dart';
import 'package:film/app/feature/home/widgets/image_network.dart';
import 'package:film/app/models/film_card_models.dart';
import 'package:flutter/material.dart';

class _RatingChip extends StatelessWidget {
  const _RatingChip(this.voteAverage, {Key? key}) : super(key: key);

  final double voteAverage;

  @override
  Widget build(BuildContext context) {
    return Chip(
      avatar: const Icon(
        Icons.star,
        color: Colors.yellow,
      ),
      label: Text(
        voteAverage.toStringAsFixed(1),
        style: Theme.of(context)
            .textTheme
            .headline6
            ?.copyWith(color: Colors.white),
      ),
      backgroundColor: Theme.of(context).primaryColor,
    );
  }
}

class FilmCard extends StatelessWidget {
  const FilmCard({
    //required this.id,
    required this.title,
    required this.picture,
    required this.voteAverage,
    Key? key,
  }) : super(key: key);

  factory FilmCard.fromFilm({
    required Film model,
    Key? key,
  }) {
    return FilmCard(
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
      child: Stack(
        children: [
          Positioned.fill(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: ImageNetwork(
                picture,
              ),
            ),
          ),
          Positioned(
            right: 4,
            top: 4,
            child: _RatingChip(voteAverage),
          ),
          Positioned(
            left: 8,
            right: 8,
            bottom: 8,
            child: PrimaryButton(
              'More',
              onPressed: () {},
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 75),
            child: Align(
                alignment: Alignment.bottomCenter,
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    boxShadow: const <BoxShadow>[
                      BoxShadow(
                        offset: Offset(1, 2),
                        blurRadius: 5,
                        spreadRadius: 2,
                      ),
                    ],
                  ),
                  child: Text(title,
                      style: TextStyle(color: Colors.white, fontSize: 18)),
                )),
          ),
        ],
      ),
    );
  }
}
