import 'package:get/get.dart';
import 'package:my_trainer/features/auth/controller/auth_controller.dart';
import 'package:my_trainer/features/user/coach/controller/coach_controller.dart';
import 'package:my_trainer/features/user/nav/controller/navigation_controller.dart';
import 'package:my_trainer/share/controller/language_controller.dart';

void initGetx() {

  //Auth
  Get.lazyPut(() => LanguageController(), fenix: true);
  Get.lazyPut(() => NavigationController(), fenix: true);
  Get.lazyPut(() => AuthController(), fenix: true);
  Get.lazyPut(() => CoachController(), fenix: true);


}