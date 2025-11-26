import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:my_trainer/utils/color/app_colors.dart';
import 'package:my_trainer/utils/extension/base_extension.dart';

class PasswordRequirement extends StatelessWidget {
  final String text;
  final bool isMet;
  final bool isDarkMode;

  const PasswordRequirement({
    super.key,
    required this.text,
    required this.isMet,
    required this.isDarkMode,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 8.h),
      child: Row(
        children: [
          Container(
            width: 18.w,
            height: 18.w,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: isMet ? AppColors.greenTextColor.withValues(alpha: 0.1) : Colors.transparent,
              border: Border.all(
                color: isMet ? AppColors.greenTextColor : AppColors.grayTextSecondaryColor.withValues(alpha: 0.5),
                width: 1,
              ),
            ),
            child: isMet
                ? Icon(
              Icons.check_circle,
              size: 18.w,
              color: AppColors.greenTextColor,
            )
                : Icon(
              Icons.circle_outlined,
              size: 18.w,
              color: AppColors.grayTextSecondaryColor.withValues(
                  alpha: 0.5),
            ),
          ),
          Gap(10.w),
          Text(
            text,
            style: context.bodyMedium.copyWith(
              fontSize: 14.sp,
              fontWeight: FontWeight.w500,
              color: isMet
                  ? AppColors.greenTextColor
                  : AppColors.grayTextSecondaryColor,
            ),
          ),
        ],
      ),
    );
  }
}