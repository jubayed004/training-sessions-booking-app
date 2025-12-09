import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CalenderController extends GetxController
    with GetTickerProviderStateMixin {
  // Tab Controller
  late TabController tabController;

  // State variables
  final RxBool saturdayConnect = false.obs;
  final RxBool sundayConnect = false.obs;
  final RxInt selectedListTab = 0.obs; // 0: upcoming, 1: past, 2: cancelled

  // Time slots data
  final RxList<Map<String, dynamic>> timeSlots = <Map<String, dynamic>>[
    {
      "time": "09:00 - 10:00",
      'name': 'Jubayed Islam',
      'status': 'Available',
      'hasMessage': true,
    },
    {
      'time': '10:10 - 11:10',
      'name': 'Jon Dhone',
      'status': 'Available',
      'hasMessage': false,
    },
    {
      'time': '09:00 - 10:00',
      'name': 'Ann Smith',
      'status': 'Available',
      'hasMessage': true,
    },
    {
      'time': '10:10 - 11:10',
      'name': 'Jon Dhone',
      'status': 'Available',
      'hasMessage': false,
    },
    {
      'time': '10:10 - 11:10',
      'name': 'Jon Dhone',
      'status': 'Available',
      'hasMessage': false,
    },
    {
      'time': '10:10 - 11:10',
      'name': 'Jon Dhone',
      'status': 'Available',
      'hasMessage': false,
    },
    {
      'time': '10:10 - 11:10',
      'name': 'Jon Dhone',
      'status': 'Available',
      'hasMessage': false,
    },
    {
      'time': '10:10 - 11:10',
      'name': 'Jon Dhone',
      'status': 'Available',
      'hasMessage': false,
    },
    {
      'time': '10:10 - 11:10',
      'name': 'Jon Dhone',
      'status': 'Available',
      'hasMessage': false,
    },
  ].obs;

  // Appointment data
  final RxList<Map<String, dynamic>>
  upcomingAppointments = <Map<String, dynamic>>[
    {
      'name': 'Ann Smith',
      'age': '26',
      'date': '21-10-2025 7:00 pm',
      'location': 'e.g. B-Berlin or "Peak Fit..."',
      'image':
          'https://xplorgym.co.uk/wp-content/uploads/2023/05/how-much-does-it-cost-to-open-a-gym.jpg',
    },
    {
      'name': 'Ann Smith',
      'age': '26',
      'date': '21-10-2025 7:00 pm',
      'location': 'e.g. B-Berlin or "Peak Fit..."',
      'image':
          'https://xplorgym.co.uk/wp-content/uploads/2023/05/how-much-does-it-cost-to-open-a-gym.jpg',
    },
  ].obs;

  final RxList<Map<String, dynamic>> pastAppointments = <Map<String, dynamic>>[
    {
      'name': 'Ann Smith',
      'age': '26',
      'date': '21-10-2025 7:00 pm',
      'location': 'e.g. B-Berlin or "Peak Fit..."',
      'image':
          'https://xplorgym.co.uk/wp-content/uploads/2023/05/how-much-does-it-cost-to-open-a-gym.jpg',
    },
  ].obs;

  final RxList<Map<String, dynamic>>
  cancelledAppointments = <Map<String, dynamic>>[
    {
      'name': 'Ann Smith',
      'age': '26',
      'date': '21-10-2025 7:00 pm',
      'location': 'e.g. B-Berlin or "Peak Fit..."',
      'image':
          'https://xplorgym.co.uk/wp-content/uploads/2023/05/how-much-does-it-cost-to-open-a-gym.jpg',
      'cancelReason': 'illness',
    },
  ].obs;

  @override
  void onInit() {
    super.onInit();
    tabController = TabController(length: 2, vsync: this);
  }

  @override
  void onClose() {
    tabController.dispose();
    super.onClose();
  }

  // Methods
  void toggleSaturdayConnect(bool value) {
    saturdayConnect.value = value;
  }

  void toggleSundayConnect(bool value) {
    sundayConnect.value = value;
  }

  void changeListTab(int index) {
    selectedListTab.value = index;
  }

  List<Map<String, dynamic>> getCurrentAppointments() {
    switch (selectedListTab.value) {
      case 1:
        return pastAppointments;
      case 2:
        return cancelledAppointments;
      default:
        return upcomingAppointments;
    }
  }

  void showEditBottomSheet(BuildContext context) {
    // This will be called from the screen
  }

  void showCancelBottomSheet(
    BuildContext context,
    Map<String, dynamic> appointment,
  ) {
    // This will be called from the screen
  }
}
