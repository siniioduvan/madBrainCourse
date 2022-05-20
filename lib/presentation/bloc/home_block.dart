import 'package:film/components/constants.dart';
import 'package:film/data/repositories/movies_repository.dart';
import 'package:film/presentation/bloc/home_event.dart';
import 'package:film/presentation/bloc/home_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final MoviesRepository repository;

  HomeBloc(this.repository) : super(const HomeState()) {
    on<LoadDataEvent>(_onLoadData);
    on<SearchChangedEvent>(_onSearchChanged);
  }

  String get search {
    final stateSearch = state.search;
    return (stateSearch != null && stateSearch.isNotEmpty)
        ? stateSearch
        : MovieQuery.initialQ;
  }

  void _onSearchChanged(SearchChangedEvent event, Emitter<HomeState> emit) {
    // search must be emitted before loading data
    emit(state.copyWith(search: event.search));
    emit(state.copyWith(data: repository.loadData(q: search)));
  }

  void _onLoadData(LoadDataEvent event, Emitter<HomeState> emit) {
    emit(state.copyWith(data: repository.loadData(q: search)));
  }
}
