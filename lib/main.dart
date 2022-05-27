import 'package:film/data/repositories/movies_repository.dart';
import 'package:film/error_bloc/error_bloc.dart';
import 'package:film/error_bloc/error_event.dart';
import 'package:film/presentation/bloc/home_block.dart';
import 'package:film/presentation/pages/main_page.dart';
import 'package:film/presentation/pages/not_found_page.dart';
import 'package:film/presentation/settings/pages/setting_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  /// Преинициализация перед инициализацией Firebase
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp();

  await FirebaseCrashlytics.instance.setCrashlyticsCollectionEnabled(true);
  FlutterError.onError = FirebaseCrashlytics.instance.recordFlutterError;

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ErrorBloc>(
      lazy: false,
      create: (context) => ErrorBloc(),
      child: RepositoryProvider<MoviesRepository>(
        create: (_) => MoviesRepository(
          onErrorHandler: (String code, String message) {
            context
                .read<ErrorBloc>()
                .add(ShowDialogEvent(title: code, message: message));
          },
        ),
        child: MaterialApp(
          title: 'Flutter courses',
          initialRoute: MainPage.path,
          onGenerateRoute: (RouteSettings settings) {
            if (settings.name == MainPage.path) {
              return MaterialPageRoute(
                builder: (context) {
                  return BlocProvider<HomeBloc>(
                      create: (context) =>
                          HomeBloc(context.read<MoviesRepository>()),
                      child: const MainPage());
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
        ),
      ),
    );
  }
}
