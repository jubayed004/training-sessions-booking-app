import 'package:get/get.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:my_trainer/features/user/coach/model/coach_model.dart';

class CoachController extends GetxController {
  var coaches = <Coach>[].obs;
  var isLoading = false.obs;
  var currentPage = 0;

}