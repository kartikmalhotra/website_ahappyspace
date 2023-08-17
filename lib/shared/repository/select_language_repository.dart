import 'package:ahs_website/config/application.dart';
import 'package:ahs_website/shared/models/select_language_model.dart';

abstract class SelectlanguageRepository {
  List<LanguageData> getSupportedLanguage();
}

class SelectlanguageRepositoryImpl implements SelectlanguageRepository {
  @override
  List<LanguageData> getSupportedLanguage() {
    var _languageData = {
      "languageData": [
        {
          "language": "English",
          "languageCode": "en",
          "isSelected": Application.preferedLanguage == "en"
        },
        {
          "language": "Zulu",
          "languageCode": "zu",
          "isSelected": Application.preferedLanguage == "zu"
        },
        {
          "language": "Xhosa",
          "languageCode": "xh",
          "isSelected": Application.preferedLanguage == "xh"
        },
      ]
    };
    return LanguageModel.fromJson(_languageData).languageData!;
  }
}
