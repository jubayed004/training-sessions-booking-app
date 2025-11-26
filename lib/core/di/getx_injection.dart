import 'package:get/get.dart';
import 'package:my_trainer/share/controller/language_controller.dart';

void initGetx() {

  //Auth
  Get.lazyPut(() => LanguageController(), fenix: true);


}