import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart'; // For .tr()
import 'package:google_fonts/google_fonts.dart';
import 'package:my_trainer/utils/color/app_colors.dart'; // Import AppColors

class NotificationSettingItem extends StatelessWidget {
  final String title;
  final String description;
  final bool isEnabled;
  final ValueChanged<bool> onToggle;

  const NotificationSettingItem({
    super.key,
    required this.title,
    required this.description,
    required this.isEnabled,
    required this.onToggle,
  });

  @override
  Widget build(BuildContext context) {
    final cardColor = Colors.white;
    final switchActiveColor = AppColors.orangeSecondaryAccentColor;
    return Container(
      width: 1.sw,
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
      decoration: BoxDecoration(
        color: cardColor,
        borderRadius: BorderRadius.circular(12.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha:  0.05),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title.tr,
                  style: context.textTheme.titleMedium,
                ),
                Gap(4.h),
                Text(
                  description.tr,
                  style: context.textTheme.labelSmall,
                ),
              ],
            ),
          ),

          Gap(10.w),
          Transform.scale(
            scale: 0.9,
            child: Switch(
              value: isEnabled,
              onChanged: onToggle,
              activeColor: Colors.white,
              activeTrackColor: switchActiveColor,
              inactiveThumbColor: Colors.white,
              inactiveTrackColor: const Color(0xFFE5E7EB),
              materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
            ),
          ),
        ],
      ),
    );
  }
}