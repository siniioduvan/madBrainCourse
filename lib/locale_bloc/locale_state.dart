import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class LocaleState extends Equatable {
  const LocaleState(this.locale, this.isEnLocale);

  final bool isEnLocale;
  final Locale locale;

  LocaleState copyWith({Locale? locale, isEnLocale}) => LocaleState(
    locale ?? this.locale,
    isEnLocale ?? this.isEnLocale,
  );

  @override
  List<Object> get props => [locale];
}
