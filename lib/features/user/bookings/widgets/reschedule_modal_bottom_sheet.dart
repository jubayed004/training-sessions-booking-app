import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_trainer/core/custom_assets/assets.gen.dart';
import 'package:my_trainer/core/router/routes.dart'; // Assuming AppRouter or Get.back() is used
import 'package:my_trainer/share/widgets/button/custom_button.dart'; // Assuming CustomButton
import 'package:my_trainer/utils/color/app_colors.dart';
import 'package:my_trainer/utils/extension/base_extension.dart';

Widget makeDismissable({required Widget child}) => GestureDetector(
  behavior: HitTestBehavior.opaque,
  onTap: () => Get.back(),
  child: GestureDetector(onTap: () {}, child: child),
);

void showRescheduleModal(
    BuildContext context, {
      required String title,
      required String message,
      required String confirmButtonText,
      required VoidCallback onConfirm,
    }) {
  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    backgroundColor: Colors.transparent,
    builder: (BuildContext context) {
      return ConfirmationModalBottomSheet(
        title: title,
        message: message,
        confirmButtonText: confirmButtonText,
        onConfirm: onConfirm,
      );
    },
  );
}
// ---------------------------------------------

class ConfirmationModalBottomSheet extends StatelessWidget {
  final String title;
  final String message;
  final String confirmButtonText;
  final VoidCallback onConfirm;

  const ConfirmationModalBottomSheet({
    super.key,
    required this.title,
    required this.message,
    required this.confirmButtonText,
    required this.onConfirm,
  });

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    final primaryTextColor = isDarkMode ? AppColors.white : AppColors.blackMainTextColor;

    return makeDismissable(
      child: DraggableScrollableSheet(
        initialChildSize: 0.40,
        minChildSize: 0.35,
        maxChildSize: 0.6,
        expand: false,
        builder: (_, controller) => Container(
          decoration: BoxDecoration(
            color: Theme.of(context).scaffoldBackgroundColor,
            borderRadius: BorderRadius.vertical(
              top: Radius.circular(30.r),
            ),
          ),
          child: SingleChildScrollView(
            controller: controller,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 32.h),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Center(
                    child: Assets.icons.vector.svg()
                  ),
                  Gap(24.h),
                  Text(
                    title,
                    style: GoogleFonts.montserrat(
                      fontWeight: FontWeight.w800,
                      fontSize: 22.sp,
                      color: primaryTextColor,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  Gap(12.h),
                  Text(
                    message,
                    style: context.bodyMedium.copyWith(
                      color: AppColors.grayTextSecondaryColor,
                      height: 1.5,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  Gap(36.h),
                  Row(
                    children: [
                      Expanded(
                        child: CustomButton(
                          text: 'Back'.tr,
                          onTap: () =>AppRouter.route.pop(),
                        ),
                      ),
                      Gap(16.w),
                      Expanded(
                        child: CustomButton(
                          text: confirmButtonText,
                          onTap: () {
                            onConfirm();
                            AppRouter.route.pop();
                          },
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}