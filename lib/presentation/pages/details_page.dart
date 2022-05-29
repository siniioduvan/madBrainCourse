import 'package:cached_network_image/cached_network_image.dart';
import 'package:film/components/constants.dart';
import 'package:film/components/locals/locals.dart';
import 'package:film/domain/models/movie_card_model.dart';
import 'package:film/presentation/settings/pages/setting_page.dart';
import 'package:flutter/material.dart';

class DetailsPage extends StatelessWidget {
  static const String path = "/details";
  final MovieCardModel model;

  const DetailsPage({required this.model, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(context.locale.detailsTitle),
          actions: <Widget>[
            IconButton(
              icon: const Icon(Icons.settings),
              onPressed: () {
                Navigator.pushNamed(
                  context,
                  SettingsPage.path,
                );
              },
            ),
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              CachedNetworkImage(
                imageUrl: '${model.picture}',
                fit: BoxFit.cover,
                errorWidget: (_, __, ___) =>
                    Image.network(MovieQuery.pisecImageUrl),
                cacheManager: MoviePictures.pictureCache,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10, right: 10, left: 10),
                child: Text(
                  '${model.title} (${model.releaseDate})',
                  textAlign: TextAlign.justify,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: Theme.of(context).textTheme.headline5,
                ),
              ),
              Text('${model.status}'),
              Text('${model.description}'),
            ],
          ),
        ),
      ),
    );
  }
}
