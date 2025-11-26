import 'package:get/get.dart';
import 'language_controller.dart';


class GetControllers {
  static final GetControllers _singleton = GetControllers._internal();

  GetControllers._internal();

  static GetControllers get instance => _singleton;


  LanguageController getLanguageController() {
    if (!Get.isRegistered<LanguageController>()) {
      Get.put(LanguageController(),permanent: true);
    }
    return Get.find<LanguageController>();
  }


}
