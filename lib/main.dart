import 'package:film/app/feature/home/pages/home_page.dart';
import 'package:film/app/feature/home/widgets/button/main_page.dart';
import 'package:film/app/feature/home/widgets/film_grid.dart';
import 'package:film/app/feature/settings/pages/not_found_page.dart';
import 'package:film/app/feature/settings/pages/setting_page.dart';
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
      title: 'Films',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
      ),
      initialRoute: '/',
      onGenerateRoute: (settings) {
        if (settings.name == MainPage.path) {
          return MaterialPageRoute(
            builder: (context) {
              return const MainPage();
            },
          );
        }
        if (settings.name == SettingsPage.path) {
          final SettingsArguments arguments =
          settings.arguments as SettingsArguments;
          return MaterialPageRoute(
            builder: (context) {
              return SettingsPage(
                arguments: arguments,
              );
            },
          );
        }
        return MaterialPageRoute(
          builder: (_) => const NotFoundPage(),
        );
      },
    );
  }
}
