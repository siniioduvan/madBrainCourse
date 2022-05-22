import 'package:film/presentation/pages/main_page.dart';
import 'package:film/presentation/pages/not_found_page.dart';
import 'package:film/presentation/settings/pages/setting_page.dart';
import 'package:flutter/material.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter courses',
      initialRoute: MainPage.path,
      onGenerateRoute: (RouteSettings settings) {
        if (settings.name == MainPage.path) {
          return MaterialPageRoute(
            builder: (context) {
              return const MainPage();
            },
          );
        }

        if (settings.name == SettingsPage.path) {
          return MaterialPageRoute(
            builder: (context) {
              return const SettingsPage();
            },
          );
        }

        return MaterialPageRoute(
          // Более короткая версия функции
          // (_, __, ___ и так далее) обозначают неиспользуемые параметры
          builder: (_) => const NotFoundPage(),
        );
      },
    );
  }
}
