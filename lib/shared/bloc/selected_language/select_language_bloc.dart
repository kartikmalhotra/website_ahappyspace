import 'dart:async';

import 'package:ahs_website/config/application.dart';
import 'package:ahs_website/shared/models/select_language_model.dart';
import 'package:ahs_website/shared/repository/select_language_repository.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

part 'select_language_event.dart';
part 'select_language_state.dart';

class SelectLanguageBloc
    extends Bloc<SelectlanguageEvent, SelectLanguagesState> {
  SelectlanguageRepository repository;

  SelectLanguageBloc({required this.repository})
      : super(
            LanguagesLoadedState(languages: repository.getSupportedLanguage()));

  @override
  Stream<SelectLanguagesState> mapEventToState(
    SelectlanguageEvent event,
  ) async* {
    if (event is LanguageChanged) {
      switch (event.languageCode) {
        case "en":
          Application.preferedLanguage = "en";
          break;
        case "zu":
          Application.preferedLanguage = "zu";
          break;
        case "xh":
          Application.preferedLanguage = "xh";
          break;
        default:
          Application.preferedLanguage = "en";
      }
      yield LanguagesLoadedState(languages: repository.getSupportedLanguage());
    }
  }
}
