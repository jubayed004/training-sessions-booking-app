import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:my_trainer/core/router/routes.dart';
import 'package:my_trainer/features/user/push_notifications/widgets/notification_setting_item.dart';
import 'package:my_trainer/share/widgets/button/custom_button.dart';

class PushNotificationScreen extends StatefulWidget {
  const PushNotificationScreen({super.key});

  @override
  State<PushNotificationScreen> createState() => _PushNotificationScreenState();
}

class _PushNotificationScreenState extends State<PushNotificationScreen> {
  ValueNotifier<bool> isBookingsUpdatesEnabled = ValueNotifier(true);


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: AppBar(
        scrolledUnderElevation: 0,
        backgroundColor: Colors.transparent,
        title: Text(
          'Push Notification'.tr,
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
          child: Column(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ValueListenableBuilder<bool>(
                      valueListenable: isBookingsUpdatesEnabled,
                      builder: (context, value, child) {
                        return NotificationSettingItem(
                          title: 'Bookings Updates'.tr,
                          description: 'Lorem ipsum dolor sit amet consectetur. Ipsum non lectus lacus scelerisque. Id consequat ut.',
                          isEnabled: value, //
                          onToggle: (bool newValue) {
                            isBookingsUpdatesEnabled.value = newValue; // ← No setState needed!
                          },
                        );
                      },
                    ),
                    Gap(16.h),
                  ],
                ),
              ),

              CustomButton(
                text: "Save".tr,
                onTap: () {
                  AppRouter.route.pop();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}