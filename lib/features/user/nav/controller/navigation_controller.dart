import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_trainer/core/custom_assets/assets.gen.dart';
import 'package:my_trainer/features/user/bookings/bookings_screen.dart';
import 'package:my_trainer/features/user/chat/chat_screen.dart';
import 'package:my_trainer/features/user/coach/coach_screen.dart';
import 'package:my_trainer/features/user/home/home_screen.dart';
import 'package:my_trainer/features/user/profile/profile_screen.dart';

class NavigationController extends GetxController {
  RxInt selectedNavIndex = 0.obs;
  List<Widget> getPages() {
    return [
      HomeScreen(),
      CoachScreen(),
      BookingsScreen(),
      ChatScreen(),
      ProfileScreen(),
    ];
  }
  final List<SvgGenImage> icons = [
    Assets.icons.home,
    Assets.icons.profile2user,
    Assets.icons.calendar,
    Assets.icons.messages,
    Assets.icons.profile,
  ];

  final List<String> labels = [
    "Home",
    "Explore",
    "Chat",
    "My Pets",
    "Profile",
  ];
}
