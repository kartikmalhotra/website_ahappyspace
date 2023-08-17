// import 'dart:convert';
// import 'package:ahs_website/constants/const.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';

// class AppLocalizations {
//   final Locale locale;
//   late Map<String, String> _localizedStrings;

//   AppLocalizations(this.locale);

//   /// Helper method to keep the code in the widgets concise
//   /// Localizations are accessed using an InheritedWidget "of" syntax
//   static AppLocalizations? of(BuildContext context) {
//     return Localizations.of<AppLocalizations>(context, AppLocalizations);
//   }

//   /// Static member to have a simple access to the delegate from the MaterialApp
//   static const LocalizationsDelegate<AppLocalizations> delegate =
//       _AppLocalizationsDelegate();

//   /// Load the language JSON file from the "lang" folder
//   Future<bool> load() async {
//     String jsonString = await rootBundle
//         .loadString('assets/languages/${locale.languageCode}.json');
//     Map<String, dynamic> jsonMap = json.decode(jsonString);

//     _localizedStrings = jsonMap.map((key, value) {
//       return MapEntry(key, value.toString());
//     });

//     return true;
//   }

//   /// This method will be called from every widget which needs a localized text
//   String? translate(String? key) {
//     return _localizedStrings[key];
//   }
// }

// class _AppLocalizationsDelegate
//     extends LocalizationsDelegate<AppLocalizations> {
//   /// This delegate instance will never change (it doesn't even have fields!)
//   /// It can provide a constant constructor.
//   const _AppLocalizationsDelegate();

//   @override
//   bool isSupported(Locale locale) {
//     /// Include all of your supported language codes here
//     return AppConstants.supportedLanguages.contains(locale.languageCode);
//   }

//   @override
//   Future<AppLocalizations> load(Locale locale) async {
//     /// AppLocalizations class is where the JSON loading actually runs
//     AppLocalizations localizations = AppLocalizations(locale);
//     await localizations.load();
//     return localizations;
//   }

//   @override
//   bool shouldReload(_AppLocalizationsDelegate old) => false;
// }

// class FallbackLocalizationDelegate
//     extends LocalizationsDelegate<MaterialLocalizations> {
//   @override
//   bool isSupported(Locale locale) => true;
//   @override
//   Future<MaterialLocalizations> load(Locale locale) async =>
//       const DefaultMaterialLocalizations();
//   @override
//   bool shouldReload(_) => false;
// }

// class CupertinoFallbackDelegate
//     extends LocalizationsDelegate<CupertinoLocalizations> {
//   @override
//   bool isSupported(Locale locale) => true;
//   @override
//   Future<CupertinoLocalizations> load(Locale locale) async =>
//       const DefaultCupertinoLocalizations();
//   @override
//   bool shouldReload(_) => false;
// }
