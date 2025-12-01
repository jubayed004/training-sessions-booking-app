import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:my_trainer/core/router/route_path.dart';
import 'package:my_trainer/core/router/routes.dart';
import 'package:my_trainer/features/user/bookings/widgets/reschedule_modal_bottom_sheet.dart';
import 'package:my_trainer/features/other/widgets/settings_disclosure_item.dart';
import 'package:my_trainer/utils/color/app_colors.dart';

class PasswordAndSecurityScreen extends StatelessWidget {
  const PasswordAndSecurityScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: AppBar(
        scrolledUnderElevation: 0,
        backgroundColor: Colors.transparent,
        title: Text(
            'Password & Security'.tr
        ),
        centerTitle: true,
      ),

      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 16.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SettingsDisclosureItem(
              title: 'Change Password'.tr,
              icon: Iconsax.lock_1,
              onTap: ()=>AppRouter.route.pushNamed(RoutePath.changePasswordScreen),
            ),
            Gap(16.h),

            SettingsDisclosureItem(
              title: 'Delete account'.tr,
              icon: Iconsax.trash,
              itemTextColor: AppColors.appbarTextColor,
              onTap: () {
                showRescheduleModal(
                  context,
                  title: 'Hey!'.tr,
                  message: 'Are you sure you want to delete your account? All your data will be lost after deletion.'.tr,
                  confirmButtonText: 'Delete'.tr,
                  onConfirm: () {
                    // Call your controller method here after user confirms
                    // controller.cancelSession(sessionId);
                    Get.snackbar('Action', 'Cancellation confirmed and processing.');
                  },
                );
              },
              isLast: true,
            ),
          ],
        ),
      ),
    );
  }
}