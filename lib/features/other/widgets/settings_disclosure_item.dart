import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:get/get.dart';
import 'package:my_trainer/utils/color/app_colors.dart';

class SettingsDisclosureItem extends StatelessWidget {
  final String title;
  final VoidCallback onTap;
  final IconData? icon;
  final bool isLast;
  final Color? itemTextColor;

  const SettingsDisclosureItem({
    super.key,
    required this.title,
    required this.onTap,
    this.icon,
    this.isLast = false,
    this.itemTextColor,
  });

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    final effectiveItemTextColor = itemTextColor ?? (isDarkMode ? AppColors.white : const Color(0xFF4B5563));

    return Padding(
      padding: EdgeInsets.only(bottom: isLast ? 0 : 12.h),
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
          decoration: BoxDecoration(
            color: isDarkMode ? AppColors.blackMainTextColor : Colors.white,
            borderRadius: BorderRadius.circular(12.r),
            boxShadow: [
              BoxShadow(color: Colors.black.withValues( alpha: 0.02), blurRadius: 5, offset: const Offset(0, 2)),
            ],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  if (icon != null) ...[
                    Icon(icon, size: 20.r, color: effectiveItemTextColor),
                    Gap(12.w),
                  ],
                  Text(
                    title.tr,
                    style: GoogleFonts.montserrat(
                      fontWeight: FontWeight.w500,
                      fontSize: 14.sp,
                      color: effectiveItemTextColor,
                    ),
                  ),
                ],
              ),
              Icon(
                Icons.arrow_forward_ios_rounded,
                size: 14.r,
                color: AppColors.grayTextSecondaryColor,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
