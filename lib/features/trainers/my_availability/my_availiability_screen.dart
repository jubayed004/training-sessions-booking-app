import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_trainer/utils/app_strings/app_strings.dart';

class MyAvailiabilityScreen extends StatelessWidget {
  const MyAvailiabilityScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: AppBar(
        scrolledUnderElevation: 0,
        backgroundColor: Colors.transparent,
        title: Text(
          AppStrings.myAvailability.tr,
        ),
        centerTitle: true,
      ),
    );
  }
}
