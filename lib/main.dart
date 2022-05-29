import 'package:film/components/locals/locals.dart';
import 'package:film/data/repositories/movies_repository.dart';
import 'package:film/domain/models/movie_card_model.dart';
import 'package:film/error_bloc/error_bloc.dart';
import 'package:film/error_bloc/error_event.dart';
import 'package:film/locale_bloc/locale_bloc.dart';
import 'package:film/locale_bloc/locale_state.dart';
import 'package:film/presentation/bloc/home_block.dart';
import 'package:film/presentation/pages/main_page.dart';
import 'package:film/presentation/pages/not_found_page.dart';
import 'package:film/presentation/settings/pages/setting_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'presentation/pages/details_page.dart';

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
    return BlocProvider<LocaleBloc>(
      lazy: false,
      create: (_) => LocaleBloc(),
      child: BlocBuilder<LocaleBloc, LocaleState>(
        builder: (context, state) {
          return MaterialApp(
            title: 'Flutter courses',
            locale: state.locale,
            localizationsDelegates: <LocalizationsDelegate<dynamic>>[
              GlobalWidgetsLocalizations.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
              MyLocalizationsDelegate(initialLocals),
            ],
            supportedLocales: availableLocales.values,
            initialRoute: MainPage.path,
            onGenerateRoute: (RouteSettings settings) {
              if (settings.name == MainPage.path) {
                return MaterialPageRoute(
                  builder: (context) {
                    return BlocProvider<ErrorBloc>(
                      lazy: false,
                      create: (context) => ErrorBloc(),
                      child: RepositoryProvider<MoviesRepository>(
                        create: (_) => MoviesRepository(
                          onErrorHandler: (String code, String message) {
                            context.read<ErrorBloc>().add(
                                ShowDialogEvent(title: code, message: message));
                          },
                        ),
                        child: BlocProvider<HomeBloc>(
                            create: (context) =>
                                HomeBloc(context.read<MoviesRepository>()),
                            child: const MainPage()),
                      ),
                    );
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

              if (settings.name == DetailsPage.path) {
                final MovieCardModel model =
                settings.arguments as MovieCardModel;
                return MaterialPageRoute(
                  builder: (context) {
                    return DetailsPage(model: model);
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
        },
      ),
    );
  }
}
