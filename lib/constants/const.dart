import 'package:flutter/material.dart';

const blueColor = Color(0xFF77a6f7);
const secondaryColor = Color(0xFF2A2D3E);
const bgColor = Colors.white;
const greenColor = Color(0xFF00db8e);
const textColor = Color(0xFF5f6366);

const defaultPadding = 16.0;

abstract class AppConstants {
  static String logoBanner = "assets/images/logo-banner.png";
  static String mobileHome = "assets/images/mobile_home.png";
  static String stackedLogo = "assets/images/logo-stacked.png";
  static String desktopTabHome =
      "assets/images/mom-and-daughter-rejoice-at-selling-home-moving-1920x1536.png";

  static const List<String> supportedLanguages = [
    'en',
    'xh',
    'zu',
  ];

  static const String languageCode = 'languageCode';
  static const String countryPhoneCode = 'cellPhoneCode';
  static const String english = 'en';
  static const String xhosa = 'xh';
  static const String zulu = 'zu';
}
