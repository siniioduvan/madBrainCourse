import 'package:cached_network_image/cached_network_image.dart';
import 'package:film/components/button/primary_button.dart';
import 'package:film/components/constants.dart';
import 'package:film/domain/models/movie_card_model.dart';
import 'package:flutter/material.dart';

/// Элемент верстки нашей карточки с фильмом
class MovieCard extends StatelessWidget {
  final MovieCardModel? movieCardModel;
  final VoidCallback? onClickFavoriteButton;
  final String textButton;

  const MovieCard({
    this.movieCardModel,
    this.onClickFavoriteButton,
    required this.textButton,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 250,
      margin: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white54,
        borderRadius: const BorderRadius.all(Radius.circular(25)),
        boxShadow: <BoxShadow>[
          BoxShadow(
            color: Colors.black54.withOpacity(0.3),
            spreadRadius: 2,
            blurRadius: 2,
            offset: const Offset(0, 2), // changes position of shadow
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          ClipRRect(
            borderRadius: const BorderRadius.all(Radius.circular(25)),
            child: Container(
              height: 500,
              width: double.infinity,
              decoration: const BoxDecoration(
                color: MovieColors.cardBlackColor,
              ),
              child: CachedNetworkImage(
                imageUrl: '${movieCardModel?.picture}',
                fit: BoxFit.cover,
                errorWidget: (_, __, ___) =>
                    Image.network(MovieQuery.pisecImageUrl),
                cacheManager: MoviePictures.pictureCache,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10, right: 10, left: 10),
            child: Text(
              '${movieCardModel?.title} (${movieCardModel?.releaseDate})',
              textAlign: TextAlign.justify,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: Theme.of(context).textTheme.headline5,
            ),
          ),
          Text('${movieCardModel?.status}'),
          Padding(
            padding: const EdgeInsets.only(left: 10, right: 10, bottom: 10),
            child: PrimaryButton(
              textButton,
              onPressed: () {
                //Вызываем функци обратного вызова
                onClickFavoriteButton?.call();
              },
            ),
          )
        ],
      ),
    );
  }
}
