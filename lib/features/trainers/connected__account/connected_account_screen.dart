import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../utils/app_strings/app_strings.dart';

class ConnectedAccountScreen extends StatelessWidget {
  const ConnectedAccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: AppBar(
        scrolledUnderElevation: 0,
        backgroundColor: Colors.transparent,
        title: Text(
          "Connected Account".tr,
        ),
        centerTitle: true,
      ),
    );
  }
}
