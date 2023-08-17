class LanguageModel {
  List<LanguageData>? languageData;

  LanguageModel({this.languageData});

  LanguageModel.fromJson(Map<String, dynamic> json) {
    if (json['languageData'] != null) {
      languageData = <LanguageData>[];
      json['languageData'].forEach((v) {
        languageData!.add(LanguageData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    if (languageData != null) {
      data['languageData'] = languageData!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class LanguageData {
  String? language;
  String? languageCode;
  bool? isSelected;

  LanguageData({this.language, this.languageCode, this.isSelected});

  LanguageData.fromJson(Map<String, dynamic> json) {
    language = json['language'];
    languageCode = json['languageCode'];
    isSelected = json['isSelected'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['language'] = language;
    data['languageCode'] = languageCode;
    data['isSelected'] = isSelected;
    return data;
  }
}
