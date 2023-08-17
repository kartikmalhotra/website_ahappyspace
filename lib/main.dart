import 'dart:convert';

import 'package:ahs_website/config/application.dart';
import 'package:ahs_website/config/theme.dart';
import 'package:ahs_website/l10n/xh_intl.dart';
import 'package:ahs_website/screens/main/screen/main_screen.dart';
import 'package:ahs_website/shared/repository/select_language_repository.dart';
import 'package:ahs_website/utils/services/network_service.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:http/http.dart' as http;
import 'shared/bloc/selected_language/select_language_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // await _getUserLocation();
  Application.preferedLanguage = "en";
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider<SelectLanguageBloc>(
      create: ((context) =>
          SelectLanguageBloc(repository: SelectlanguageRepositoryImpl())),
      child: BlocBuilder<SelectLanguageBloc, SelectLanguagesState>(builder:
          (BuildContext languageContext, SelectLanguagesState languageState) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          scrollBehavior: AppScrollBehavior(),
          title: 'A Happy Space',
          locale: Locale(Application.preferedLanguage!, ""),
          supportedLocales: AppLocalizations.supportedLocales,
          localizationsDelegates: const [
            AppLocalizations.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
            // XhMaterialLocalizationsDelegate.delegate,
          ],
          theme: lightThemeData,
          home: const MainScreen(),
        );
      }),
    );
  }
}

Future<String> initPlatformState() async {
  final DeviceInfoPlugin deviceInfoPlugin = DeviceInfoPlugin();
  String deviceData = "";

  try {
    if (kIsWeb) {
      deviceData = _readWebBrowserInfo(await deviceInfoPlugin.webBrowserInfo);
    } else {}
  } catch (exe) {
    deviceData = "";
  }
  return deviceData;
}

String _readWebBrowserInfo(WebBrowserInfo data) {
  return describeEnum(data.browserName);
}

class AppScrollBehavior extends MaterialScrollBehavior {
  @override
  Set<PointerDeviceKind> get dragDevices => {
        PointerDeviceKind.touch,
        PointerDeviceKind.mouse,
      };
}
