import 'dart:async';

import 'package:intl/intl.dart' as intl;
import 'package:intl/date_symbols.dart' as intl;
import 'package:intl/date_symbol_data_custom.dart' as date_symbol_data_custom;
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

/// A custom set of date patterns for the `xh` locale.
///
/// These are not accurate and are just a clone of the date patterns for the
/// `no` locale to demonstrate how one would write and use custom date patterns.
// #docregion Date
const nnLocaleDatePatterns = {
  'd': 'd.',
  'E': 'ccc',
  'EEEE': 'cccc',
  'LLL': 'LLL',
// #enddocregion Date
  'LLLL': 'LLLL',
  'M': 'L.',
  'Md': 'd.M.',
  'MEd': 'EEE d.M.',
  'MMM': 'LLL',
  'MMMd': 'd. MMM',
  'MMMEd': 'EEE d. MMM',
  'MMMM': 'LLLL',
  'MMMMd': 'd. MMMM',
  'MMMMEEEEd': 'EEEE d. MMMM',
  'QQQ': 'QQQ',
  'QQQQ': 'QQQQ',
  'y': 'y',
  'yM': 'M.y',
  'yMd': 'd.M.y',
  'yMEd': 'EEE d.MM.y',
  'yMMM': 'MMM y',
  'yMMMd': 'd. MMM y',
  'yMMMEd': 'EEE d. MMM y',
  'yMMMM': 'MMMM y',
  'yMMMMd': 'd. MMMM y',
  'yMMMMEEEEd': 'EEEE d. MMMM y',
  'yQQQ': 'QQQ y',
  'yQQQQ': 'QQQQ y',
  'H': 'HH',
  'Hm': 'HH:mm',
  'Hms': 'HH:mm:ss',
  'j': 'HH',
  'jm': 'HH:mm',
  'jms': 'HH:mm:ss',
  'jmv': 'HH:mm v',
  'jmz': 'HH:mm z',
  'jz': 'HH z',
  'm': 'm',
  'ms': 'mm:ss',
  's': 's',
  'v': 'v',
  'z': 'z',
  'zzzz': 'zzzz',
  'ZZZZ': 'ZZZZ',
};

/// A custom set of date symbols for the `nn` locale.
///
/// These are not accurate and are just a clone of the date symbols for the
/// `no` locale to demonstrate how one would write and use custom date symbols.
// #docregion Date2
const nnDateSymbols = {
  'NAME': 'xh',
  'ERAS': <dynamic>[
    'f.Kr.',
    'e.Kr.',
  ],
// #enddocregion Date2
  'ERANAMES': <dynamic>[
    'før Kristus',
    'etter Kristus',
  ],
  'NARROWMONTHS': <dynamic>[
    'J',
    'F',
    'M',
    'A',
    'M',
    'J',
    'J',
    'A',
    'S',
    'O',
    'N',
    'D',
  ],
  'STANDALONENARROWMONTHS': <dynamic>[
    'J',
    'F',
    'M',
    'A',
    'M',
    'J',
    'J',
    'A',
    'S',
    'O',
    'N',
    'D',
  ],
  'MONTHS': <dynamic>[
    'januar',
    'februar',
    'mars',
    'april',
    'mai',
    'juni',
    'juli',
    'august',
    'september',
    'oktober',
    'november',
    'desember',
  ],
  'STANDALONEMONTHS': <dynamic>[
    'januar',
    'februar',
    'mars',
    'april',
    'mai',
    'juni',
    'juli',
    'august',
    'september',
    'oktober',
    'november',
    'desember',
  ],
  'SHORTMONTHS': <dynamic>[
    'jan.',
    'feb.',
    'mar.',
    'apr.',
    'mai',
    'jun.',
    'jul.',
    'aug.',
    'sep.',
    'okt.',
    'nov.',
    'des.',
  ],
  'STANDALONESHORTMONTHS': <dynamic>[
    'jan',
    'feb',
    'mar',
    'apr',
    'mai',
    'jun',
    'jul',
    'aug',
    'sep',
    'okt',
    'nov',
    'des',
  ],
  'WEEKDAYS': <dynamic>[
    'sundag',
    'monday',
    'tuesday',
    'wednesday',
    'thursday',
    'friday',
    'saturday',
  ],
  'STANDALONEWEEKDAYS': <dynamic>[
    'sunday',
    'monday',
    'tuesday',
    'wednesday',
    'thursday',
    'friday',
    'saturday',
  ],
  'SHORTWEEKDAYS': <dynamic>[
    'sun.',
    'mon.',
    'tue.',
    'wed.',
    'thu.',
    'fri.',
    'sat.',
  ],
  'STANDALONESHORTWEEKDAYS': <dynamic>[
    'sun.',
    'mon.',
    'tue.',
    'wed.',
    'thu.',
    'fri.',
    'sat.',
  ],
  'NARROWWEEKDAYS': <dynamic>[
    'S',
    'M',
    'T',
    'W',
    'T',
    'F',
    'S',
  ],
  'STANDALONENARROWWEEKDAYS': <dynamic>[
    'S',
    'M',
    'T',
    'W',
    'T',
    'F',
    'S',
  ],
  'SHORTQUARTERS': <dynamic>[
    'K1',
    'K2',
    'K3',
    'K4',
  ],
  'QUARTERS': <dynamic>[
    '1. kvartal',
    '2. kvartal',
    '3. kvartal',
    '4. kvartal',
  ],
  'AMPMS': <dynamic>[
    'a.m.',
    'p.m.',
  ],
  'DATEFORMATS': <dynamic>[
    'EEEE d. MMMM y',
    'd. MMMM y',
    'd. MMM y',
    'dd.MM.y',
  ],
  'TIMEFORMATS': <dynamic>[
    'HH:mm:ss zzzz',
    'HH:mm:ss z',
    'HH:mm:ss',
    'HH:mm',
  ],
  'AVAILABLEFORMATS': null,
  'FIRSTDAYOFWEEK': 0,
  'WEEKENDRANGE': <dynamic>[
    5,
    6,
  ],
  'FIRSTWEEKCUTOFFDAY': 3,
  'DATETIMEFORMATS': <dynamic>[
    '{1} {0}',
    '{1} \'kl\'. {0}',
    '{1}, {0}',
    '{1}, {0}',
  ],
};

// // #docregion Delegate
// class _XhMaterialLocalizationsDelegate
//     extends LocalizationsDelegate<MaterialLocalizations> {
//   const _XhMaterialLocalizationsDelegate();

//   @override
//   bool isSupported(Locale locale) => locale.languageCode == 'xh';

//   @override
//   Future<MaterialLocalizations> load(Locale locale) async {
//     final String localeName = intl.Intl.canonicalizedLocale(locale.toString());

//     // The locale (in this case `xh`) needs to be initialized into the custom
//     // date symbols and patterns setup that Flutter uses.
//     date_symbol_data_custom.initializeDateFormattingCustom(
//       locale: localeName,
//       patterns: nnLocaleDatePatterns,
//       symbols: intl.DateSymbols.deserializeFromMap(nnDateSymbols),
//     );

//     return SynchronousFuture<MaterialLocalizations>(
//       XhMaterialLocalizationsDelegate(
//         localeName: localeName,
//         // The `intl` library's NumberFormat class is generated from CLDR data
//         // (see https://github.com/dart-lang/intl/blob/master/lib/number_symbols_data.dart).
//         // Unfortunately, there is no way to use a locale that isn't defined in
//         // this map and the only way to work around this is to use a listed
//         // locale's NumberFormat symbols. So, here we use the number formats
//         // for 'en_US' instead.
//         decimalFormat: intl.NumberFormat('#,##0.###', 'en_US'),
//         twoDigitZeroPaddedFormat: intl.NumberFormat('00', 'en_US'),
//         // DateFormat here will use the symbols and patterns provided in the
//         // `date_symbol_data_custom.initializeDateFormattingCustom` call above.
//         // However, an alternative is to simply use a supported locale's
//         // DateFormat symbols, similar to NumberFormat above.
//         fullYearFormat: intl.DateFormat('y', localeName),
//         compactDateFormat: intl.DateFormat('yMd', localeName),
//         shortDateFormat: intl.DateFormat('yMMMd', localeName),
//         mediumDateFormat: intl.DateFormat('EEE, MMM d', localeName),
//         longDateFormat: intl.DateFormat('EEEE, MMMM d, y', localeName),
//         yearMonthFormat: intl.DateFormat('MMMM y', localeName),
//         shortMonthDayFormat: intl.DateFormat('MMM d'),
//       ),
//     );
//   }

//   @override
//   bool shouldReload(_XhMaterialLocalizationsDelegate old) => false;
// }
// // #enddocregion Delegate

// /// A custom set of localizations for the 'nn' locale. In this example, only
// /// the value for openAppDrawerTooltip was modified to use a custom message as
// /// an example. Everything else uses the American English (en_US) messages
// /// and formatting.
// class XhMaterialLocalizationsDelegate extends GlobalMaterialLocalizations {
//   const XhMaterialLocalizationsDelegate({
//     String localeName = 'nn',
//     required intl.DateFormat fullYearFormat,
//     required intl.DateFormat compactDateFormat,
//     required intl.DateFormat shortDateFormat,
//     required intl.DateFormat mediumDateFormat,
//     required intl.DateFormat longDateFormat,
//     required intl.DateFormat yearMonthFormat,
//     required intl.DateFormat shortMonthDayFormat,
//     required intl.NumberFormat decimalFormat,
//     required intl.NumberFormat twoDigitZeroPaddedFormat,
//   }) : super(
//           localeName: localeName,
//           fullYearFormat: fullYearFormat,
//           compactDateFormat: compactDateFormat,
//           shortDateFormat: shortDateFormat,
//           mediumDateFormat: mediumDateFormat,
//           longDateFormat: longDateFormat,
//           yearMonthFormat: yearMonthFormat,
//           shortMonthDayFormat: shortMonthDayFormat,
//           decimalFormat: decimalFormat,
//           twoDigitZeroPaddedFormat: twoDigitZeroPaddedFormat,
//         );

// // #docregion Getters
//   @override
//   String get moreButtonTooltip => r'KANINZI';

//   @override
//   String get aboutListTileTitleRaw => r'Malunga $applicationName';

//   @override
//   String get alertDialogLabel => r'Isilumkiso';
// // #enddocregion Getters

//   @override
//   String get anteMeridiemAbbreviation => r'AM';

//   @override
//   String get backButtonTooltip => r'Emva';

//   @override
//   String get cancelButtonLabel => r'RHOXA';

//   @override
//   String get closeButtonLabel => r'VALA';

//   @override
//   String get closeButtonTooltip => r'Vala';

//   @override
//   String get collapsedIconTapHint => r'Yandisa';

//   @override
//   String get continueButtonLabel => r'QHUBEKA';

//   @override
//   String get copyButtonLabel => r'IKOPIA';

//   @override
//   String get cutButtonLabel => r'SIKA';

//   @override
//   String get deleteButtonTooltip => r'Cima';

//   @override
//   String get dialogLabel => r'Incoko yababini';

//   @override
//   String get drawerLabel => r'Imenyu yokukhangela';

//   @override
//   String get expandedIconTapHint => r'Ukuwa';

//   @override
//   String get firstPageTooltip => r'Iphepha lokuqala';

//   @override
//   String get hideAccountsLabel => r'Fihla iiakhawunti';

//   @override
//   String get lastPageTooltip => r'Iphepha lokugqibela';

//   @override
//   String get licensesPageTitle => r'Iilayisensi';

//   @override
//   String get modalBarrierDismissLabel => r'Gxotha';

//   @override
//   String get nextMonthTooltip => r'Kwinyanga elandelayo';

//   @override
//   String get nextPageTooltip => r'Iphepha elilandelayo';

//   @override
//   String get okButtonLabel => r'Kulungile';

//   @override
//   // A custom drawer tooltip message.
//   String get openAppDrawerTooltip => r'Ingcebiso yeMenu yokuHamba ngokweSiko';

// // #docregion Raw
//   @override
//   String get pageRowsInfoTitleRaw => r'$firstRow–$lastRow of $rowCount';

//   @override
//   String get pageRowsInfoTitleApproximateRaw =>
//       r'$firstRow–$lastRow of about $rowCount';
// // #enddocregion Raw

//   @override
//   String get pasteButtonLabel => r'Ncamathisela';

//   @override
//   String get popupMenuLabel => r'Imenyu evelelayo';

//   @override
//   String get postMeridiemAbbreviation => r'PM';

//   @override
//   String get previousMonthTooltip => r'Inyanga edlulileyo';

//   @override
//   String get previousPageTooltip => r'Iphepha elidlulileyo';

//   @override
//   String get refreshIndicatorSemanticLabel => r'Hlaziya';

//   @override
//   String? get remainingTextFieldCharacterCountFew => null;

//   @override
//   String? get remainingTextFieldCharacterCountMany => null;

//   @override
//   String get remainingTextFieldCharacterCountOne => r'Kushiyeke unobumba omnye';

//   @override
//   String get remainingTextFieldCharacterCountOther =>
//       r'$remainingCount abalinganiswa abaseleyo';

//   @override
//   String? get remainingTextFieldCharacterCountTwo => null;

//   @override
//   String get remainingTextFieldCharacterCountZero => r'Akukho magama aseleyo';

//   @override
//   String get reorderItemDown => r'Shenxisa phantsi';

//   @override
//   String get reorderItemLeft => r'Move left';

//   @override
//   String get reorderItemRight => r'Move right';

//   @override
//   String get reorderItemToEnd => r'Move to the end';

//   @override
//   String get reorderItemToStart => r'Move to the start';

//   @override
//   String get reorderItemUp => r'Move up';

//   @override
//   String get rowsPerPageTitle => r'Rows per page:';

//   @override
//   ScriptCategory get scriptCategory => ScriptCategory.englishLike;

//   @override
//   String get searchFieldLabel => r'Search';

//   @override
//   String get selectAllButtonLabel => r'SELECT ALL';

//   @override
//   String? get selectedRowCountTitleFew => null;

//   @override
//   String? get selectedRowCountTitleMany => null;

//   @override
//   String get selectedRowCountTitleOne => r'1 item selected';

//   @override
//   String get selectedRowCountTitleOther => r'$selectedRowCount items selected';

//   @override
//   String? get selectedRowCountTitleTwo => null;

//   @override
//   String get selectedRowCountTitleZero => r'No items selected';

//   @override
//   String get showAccountsLabel => r'Show accounts';

//   @override
//   String get showMenuTooltip => r'Show menu';

//   @override
//   String get signedInLabel => r'Signed in';

//   @override
//   String get tabLabelRaw => r'Tab $tabIndex of $tabCount';

//   @override
//   TimeOfDayFormat get timeOfDayFormatRaw => TimeOfDayFormat.h_colon_mm_space_a;

//   @override
//   String get timePickerHourModeAnnouncement => r'Select hours';

//   @override
//   String get timePickerMinuteModeAnnouncement => r'Select minutes';

//   @override
//   String get viewLicensesButtonLabel => r'VIEW LICENSES';

//   @override
//   List<String> get narrowWeekdays =>
//       const <String>['S', 'M', 'T', 'W', 'T', 'F', 'S'];

//   @override
//   int get firstDayOfWeekIndex => 0;

//   static const LocalizationsDelegate<MaterialLocalizations> delegate =
//       _XhMaterialLocalizationsDelegate();

//   @override
//   String get calendarModeButtonLabel => r'Switch to calendar';

//   @override
//   String get dateHelpText => r'mm/dd/yyyy';

//   @override
//   String get dateInputLabel => r'Enter Date';

//   @override
//   String get dateOutOfRangeLabel => r'Out of range.';

//   @override
//   String get datePickerHelpText => r'SELECT DATE';

//   @override
//   String get dateRangeEndDateSemanticLabelRaw => r'End date $fullDate';

//   @override
//   String get dateRangeEndLabel => r'End Date';

//   @override
//   String get dateRangePickerHelpText => 'SELECT RANGE';

//   @override
//   String get dateRangeStartDateSemanticLabelRaw => 'Start date \$fullDate';

//   @override
//   String get dateRangeStartLabel => 'Start Date';

//   @override
//   String get dateSeparator => '/';

//   @override
//   String get dialModeButtonLabel => 'Switch to dial picker mode';

//   @override
//   String get inputDateModeButtonLabel => 'Switch to input';

//   @override
//   String get inputTimeModeButtonLabel => 'Switch to text input mode';

//   @override
//   String get invalidDateFormatLabel => 'Ifomati engasebenziyo.';

//   @override
//   String get invalidDateRangeLabel => 'Invalid range.';

//   @override
//   String get invalidTimeLabel => 'Enter a valid time';

//   @override
//   String get licensesPackageDetailTextOther => '\$licenseCount licenses';

//   @override
//   String get saveButtonLabel => 'SAVE';

//   @override
//   String get selectYearSemanticsLabel => 'Select year';

//   @override
//   String get timePickerDialHelpText => 'SELECT TIME';

//   @override
//   String get timePickerHourLabel => 'Hour';

//   @override
//   String get timePickerInputHelpText => 'ENTER TIME';

//   @override
//   String get timePickerMinuteLabel => 'Minute';

//   @override
//   String get unspecifiedDate => 'Date';

//   @override
//   String get unspecifiedDateRange => 'Date Range';
// }
