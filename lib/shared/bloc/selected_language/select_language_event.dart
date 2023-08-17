part of 'select_language_bloc.dart';

@immutable
abstract class SelectlanguageEvent extends Equatable {
  // Passing class fields in a list to the Equatable super class
  const SelectlanguageEvent([List props = const []]) : super();
}

class LanguageChanged extends SelectlanguageEvent {
  final String? languageCode;

  LanguageChanged({required this.languageCode}) : super([languageCode]);

  @override
  List<String?> get props => [languageCode];
}
