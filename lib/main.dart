
import 'package:film/app/feature/home/pages/home_page.dart';
import 'package:film/app/feature/home/widgets/film_grid.dart';
import 'package:film/app/models/film_card_models.dart';
import 'package:film/app/widgets/film_card.dart';
import 'package:flutter/material.dart';


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
      home: FilmGrid(),
    );
  }
}
