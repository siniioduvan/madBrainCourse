import 'package:flutter/material.dart';

import 'models/film_card_model.dart';

class FilmTile extends StatelessWidget {
  const FilmTile({
    required this.title,
    required this.voteAverage,
    required this.language,
    required this.picture,
    required this.releaseDate,
    required this.description,
    Key? key,
  }) : super(key: key);

  factory FilmTile.fromModel({
    required FilmTile model,
    Key? key,
  }) {
    return FilmTile(
      title: model.title,
      voteAverage: model.voteAverage,
      language: model.language,
      picture: model.picture,
      releaseDate: model.releaseDate,
      description: model.description,
      key: key,

    );
  }


  final String title;
  final double voteAverage;
  final String language;
  final String picture;
  final String releaseDate;
  final String description;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      color: Colors.grey,
      child: Row(
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
                    style: Theme.of(context).textTheme.headline5,
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
                      style: Theme.of(context).textTheme.headline6,
                    ),
                  ),
                  Text(description),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'FilmApp',
      theme: ThemeData(
          appBarTheme: const AppBarTheme(
        color: Colors.deepPurple,
      )),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    bool filterWeight = false;

    final film = getFilm();

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.menu),
          onPressed: () {},
        ),
        title: Text("Cписок фильмов"),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.sort),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(Icons.settings),
            onPressed: () {},
          ),
        ],
      ),

      body: SingleChildScrollView(
        child: Column(children: [
          Row(
            children: [
              Checkbox(
                value: filterWeight,
                onChanged: (bool? changeValue) {
                  setState(() {
                    filterWeight = changeValue ?? false;
                  });
                },
              ),
              const Text('только русские'),
            ],
          ),
          ...List.generate(film.length, (index) {
            return FilmTile(
              title: film[index].title,
              voteAverage: film[index].voteAverage,
              language: film[index]
                  .getLanguage(film[index].language)
                  .toPrettyString(),
              picture: film[index].picture,
              description: film[index].description,
              releaseDate: film[index].releaseDate,
            );
          })
        ]),
      ),
    );
  }
}
