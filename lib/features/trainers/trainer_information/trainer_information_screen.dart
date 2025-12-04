import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TrainerInformationScreen extends StatelessWidget {
  const TrainerInformationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: AppBar(
        scrolledUnderElevation: 0,
        backgroundColor: Colors.transparent,
        title: Text(
          "Trainer Information".tr,
        ),
        centerTitle: true,
      ),
    );
  }
}
