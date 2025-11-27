import 'package:get/get.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:my_trainer/features/user/coach/model/coach_model.dart';

class CoachController extends GetxController {
  // The list of coaches that will be displayed
  var coaches = <Coach>[].obs;

  // Pagination variables
  static const _pageSize = 10;
  var isLoading = false.obs;
  var currentPage = 0;

  // PagingController to handle page requests
  final PagingController<int, Coach> pagingController = PagingController(firstPageKey: 0);

  @override
  void onInit() {
    super.onInit();
    // Start loading the first page of data
    pagingController.addPageRequestListener((pageKey) {
      _fetchCoaches(pageKey);
    });
  }

  // Simulate fetching coaches with pagination
  Future<void> _fetchCoaches(int pageKey) async {
    // Set loading state to true while fetching data
    isLoading.value = true;

    try {
      // Simulate network delay
      await Future.delayed(Duration(seconds: 2));

      // Generate a list of coaches (this would typically come from an API)
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

      // Update state
      coaches.addAll(newCoaches);
    } catch (e) {
      // Handle errors
      pagingController.error = e;
    } finally {
      // Set loading state to false
      isLoading.value = false;
    }
  }

  @override
  void onClose() {
    pagingController.dispose();
    super.onClose();
  }
}