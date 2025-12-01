import 'package:get/get.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:my_trainer/features/user/coach/model/coach_model.dart';

class CoachController extends GetxController {
  var coaches = <Coach>[].obs;
  static const _pageSize = 10;
  var isLoading = false.obs;
  var currentPage = 0;
  final PagingController<int, Coach> pagingController = PagingController(firstPageKey: 0);

  @override
  void onInit() {
    super.onInit();
    pagingController.addPageRequestListener((pageKey) {
      _fetchCoaches(pageKey);
    });
  }

  Future<void> _fetchCoaches(int pageKey) async {
    isLoading.value = true;
    try {
      await Future.delayed(Duration(seconds: 2));
      List<Coach> newCoaches = List.generate(_pageSize, (index) {
        int currentIndex = pageKey + index;
        return Coach(
          name: 'Coach ${currentIndex + 1}',
          rating: 4.5 + (currentIndex % 5) * 0.1,
          price: 30 + (currentIndex % 5) * 5,
          location: 'Location ${currentIndex + 1}',
          skills: ['Skill ${currentIndex + 1}', 'Skill ${(currentIndex + 2) % 5 + 1}'],
          image: 'assets/images/coach${(currentIndex % 3) + 1}.jpg',
        );
      });
      final isLastPage = newCoaches.length < _pageSize;
      if (isLastPage) {
        pagingController.appendLastPage(newCoaches);
      } else {
        final nextPageKey = pageKey + newCoaches.length;
        pagingController.appendPage(newCoaches, nextPageKey);
      }
      coaches.addAll(newCoaches);
    } catch (e) {
      pagingController.error = e;
    } finally {
      isLoading.value = false;
    }
  }

  @override
  void onClose() {
    pagingController.dispose();
    super.onClose();
  }
}