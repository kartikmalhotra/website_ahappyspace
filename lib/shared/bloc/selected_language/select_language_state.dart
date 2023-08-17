part of 'select_language_bloc.dart';

abstract class SelectLanguagesState extends Equatable {}

class LanguagesLoadedState extends SelectLanguagesState {
  final List<LanguageData> languages;
  LanguagesLoadedState({required this.languages}) : super();

  @override
  List<LanguageData> get props => languages;
}
