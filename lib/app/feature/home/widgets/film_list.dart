import 'package:film/app/feature/settings/pages/setting_page.dart';
import 'package:film/app/models/film_card_models.dart';
import 'package:film/app/widgets/film_tile.dart';
import 'package:flutter/material.dart';


class HomePage extends StatefulWidget {
  const HomePage({Key? key,required this.title}) : super(key: key);

  final String title;


  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    bool filterWeight = false;

    final List<Film> film = getFilm();

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
      body: ListView.builder(
        itemBuilder: (BuildContext context, int index) {
          return FilmTile.fromFilm(model: film[index % film.length]);
        },
      ),
    );
  }
}