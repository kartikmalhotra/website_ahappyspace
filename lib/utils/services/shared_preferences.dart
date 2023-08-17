import 'package:ahs_website/constants/const.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> setLocale(String languageCode) async {
  SharedPreferences _prefs = await SharedPreferences.getInstance();
  await _prefs.setString(AppConstants.languageCode, languageCode);
}

Future<String> getLocale() async {
  SharedPreferences _prefs = await SharedPreferences.getInstance();
  String languageCode = _prefs.getString(AppConstants.languageCode) ?? "en";
  return languageCode;
}

Future<void> setPhoneCountryCode(String phoneCode) async {
  SharedPreferences _prefs = await SharedPreferences.getInstance();
  await _prefs.setString(AppConstants.countryPhoneCode, phoneCode);
}

// Future<String> getPhoneCountryCode() async {
//   SharedPreferences _prefs = await SharedPreferences.getInstance();
//   String languageCode = _prefs.getString(AppConstants.countryPhoneCode) ??
//       Application.countryCode ??
//       'ZA';
//   return languageCode;
// }


// Locale _locale(String languageCode) {
//   switch (languageCode) {
//     case AppConstants.english:
//       return const Locale(AppConstants.english, 'US');
//     case AppConstants.xhosa:
//       return const Locale(AppConstants.xhosa, "ZA");
//     case AppConstants.zulu:
//       return const Locale(AppConstants.zulu, "ZA");
//     default:
//       return const Locale(AppConstants.english, 'US');
//   }
// }
