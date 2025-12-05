import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_trainer/core/custom_assets/assets.gen.dart';
import 'package:my_trainer/features/trainers/accout/account_screen.dart';
import 'package:my_trainer/features/trainers/calender/calender_screen.dart';
import 'package:my_trainer/features/trainers/chat/business_chat_screen.dart';
import 'package:my_trainer/features/trainers/client/business_client_screen.dart';
import 'package:my_trainer/features/trainers/trainer_home/trainer_home_screen.dart';
import 'package:my_trainer/features/user/inbox/inbox_screen.dart';

class NavController extends GetxController{
  RxInt selectedNavIndex = 0.obs;
  List<Widget> getPages() {
    return [
      TrainerHomeScreen(),
      BusinessClientScreen(),
      CalenderScreen(),
      ChatListScreen(),
      AccountScreen(),
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
    "clients",
    "calendar",
    "Chat",
    "account",
  ];
}