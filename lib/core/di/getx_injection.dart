import 'package:get/get.dart';
import 'package:my_trainer/features/auth/controller/auth_controller.dart';
import 'package:my_trainer/features/other/controller/other_controller.dart';
import 'package:my_trainer/features/trainers/calender/controller/calender_controller.dart';
import 'package:my_trainer/features/trainers/trainer_nav/controller/nav_controller.dart';
import 'package:my_trainer/features/user/bookings/controller/bookings_controller.dart';
import 'package:my_trainer/features/user/coach/controller/coach_controller.dart';
import 'package:my_trainer/features/user/nav/controller/navigation_controller.dart';
import 'package:my_trainer/share/controller/language_controller.dart';

void initGetx() {
  //Auth
  Get.lazyPut(() => LanguageController(), fenix: true);
  Get.lazyPut(() => NavigationController(), fenix: true);
  Get.lazyPut(() => NavController(), fenix: true);
  Get.lazyPut(() => AuthController(), fenix: true);
  Get.lazyPut(() => CoachController(), fenix: true);
  Get.lazyPut(() => BookingsController(), fenix: true);
  Get.lazyPut(() => OtherController(), fenix: true);
  Get.lazyPut(() => CalenderController(), fenix: true);
}
