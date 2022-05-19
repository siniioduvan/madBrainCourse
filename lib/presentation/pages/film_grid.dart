import 'package:film/domain/models/film_card_models.dart';
import 'package:film/presentation/settings/pages/setting_page.dart';
import 'package:flutter/material.dart';

import '../../components/widgets/film_grid_card.dart';

class FilmGrid extends StatelessWidget {
  FilmGrid({Key? key}) : super(key: key);

  final List<Film> film = getFilm();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[900],
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.menu),
            onPressed: () {},
          ),
          title: Text('Films'),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.sort),
              onPressed: () {},
            ),
            IconButton(
              icon: const Icon(Icons.settings),
              onPressed: () {
                Navigator.pushNamed(
                  context,
                  '/settings',
                  arguments: const SettingsArguments('BOBIK'),
                );
              },
            ),
          ],
        ),
        body: GridView.builder(
          itemBuilder: (BuildContext context, int index) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: FilmCard.fromFilm(model: film[index % film.length]),
            );
          },
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 2 / 3,
          ),
        ));
  }
}
