import 'package:film/components/constants.dart';
import 'package:film/components/locals/locals.dart';
import 'package:film/presentation/bloc/home_block.dart';
import 'package:film/presentation/bloc/home_event.dart';
import 'package:film/presentation/bloc/home_state.dart';
import 'package:film/presentation/settings/pages/setting_page.dart';
import 'package:film/presentation/widgets/movie_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FavouritesScreen extends StatelessWidget {
  const FavouritesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(Icons.menu),
            onPressed: () {},
          ),
          title: Text(context.locale.favouritesTitle),
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
        backgroundColor: MovieColors.backgroundBlackColor,
        body: Column(
          children: [
            // Поле поиска
            BlocBuilder<HomeBloc, HomeState>(
              buildWhen: (oldState, newState) =>
                  oldState.favouritesMovies != newState.favouritesMovies,
              builder: (context, state) {
                return Expanded(
                  child: ListView.builder(
                    itemBuilder: (BuildContext context, int index) {
                      final currentCardModel = state.favouritesMovies?[index];

                      return MovieCard(
                        textButton: context.locale.deleteFavourites,
                        // callback по клику на кнопку
                        onClickFavoriteButton: () {
                          //отправляем событие в блок
                          context.read<HomeBloc>().add(
                                ChangedFavourites(
                                  model: currentCardModel,
                                ),
                              );
                        },
                        movieCardModel: currentCardModel,
                        key: ValueKey<int>(currentCardModel.hashCode),
                      );
                    },
                    itemCount: state.favouritesMovies?.length ?? 0,
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
