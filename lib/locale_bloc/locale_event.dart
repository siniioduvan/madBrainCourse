import 'package:equatable/equatable.dart';

abstract class LocaleEvent extends Equatable {
  const LocaleEvent();

  @override
  List<Object> get props => [];
}

class ChangeLocaleEvent extends LocaleEvent {
  final bool isEnLocale;

  const ChangeLocaleEvent(this.isEnLocale);

  @override
  List<Object> get props => [isEnLocale];
}
