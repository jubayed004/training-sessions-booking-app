import 'package:get/get.dart';
import 'package:my_trainer/share/model/language_model.dart';

class AppConfig {

  //API Base URL
  // static const String baseURL = "http://10.10.20.52:5002/api";
  static const String baseURL = "http://10.10.20.9:7050";
  static const String fontFamily = "";

  //Default Language Key
  static const String defaultLanguageKey = "en";

  static const defaultProfile = "https://img.freepik.com/premium-photo/casual-young-man-shirt_146377-2992.jpg";

  static List<LanguageModel> languages = [
    // LanguageModel(imageUrl: "", languageName: 'german'.tr, countryCode: 'DE', languageCode: 'de'),
    LanguageModel(imageUrl: "", languageName: 'english'.tr, countryCode: 'US', languageCode: 'en'),
  ];

}