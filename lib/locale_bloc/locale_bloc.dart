import 'package:film/components/locals/locals.dart';
import 'package:film/locale_bloc/locale_event.dart';
import 'package:film/locale_bloc/locale_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LocaleBloc extends Bloc<LocaleEvent, LocaleState> {
  LocaleBloc() : super(const LocaleState(Locale('ru', 'RU'), false)) {
    on<ChangeLocaleEvent>(_onLocaleChanged);
  }

  void _onLocaleChanged(ChangeLocaleEvent event, Emitter<LocaleState> emit) {
    emit(state.copyWith(
        locale: event.isEnLocale
            ? availableLocales[enLocale]!
            : availableLocales[ruLocale]!,
        isEnLocale: event.isEnLocale));
  }
}
