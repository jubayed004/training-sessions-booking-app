import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:my_trainer/core/custom_assets/assets.gen.dart'; // Assumed to provide .svg assets
import 'package:my_trainer/utils/app_strings/app_strings.dart';
import 'package:my_trainer/utils/color/app_colors.dart';
import 'package:my_trainer/utils/extension/base_extension.dart';
import 'package:my_trainer/share/widgets/network_image/custom_network_image.dart'; // Assuming this component exists

class SessionCardWidgets extends StatelessWidget {
  final String name;
  final int age;
  final double rating;
  final String trainerImageUrl;
  final String mainActivity;
  final int moreActivitiesCount;
  final String dateTime;
  final String location;
  final String statusText;
  final String? outlinedButtonText;
  final VoidCallback onReschedulePressed;
  final VoidCallback? onCancelPressed;
  final VoidCallback? onReviewPressed;

  const SessionCardWidgets({
    super.key,
    required this.name,
    required this.age,
    required this.rating,
    required this.trainerImageUrl,
    required this.mainActivity,
    required this.moreActivitiesCount,
    required this.dateTime,
    required this.location,
    required this.statusText,
    required this.onReschedulePressed,
    this.onCancelPressed,
    this.onReviewPressed,
   this.outlinedButtonText,
  });

  Map<String, Color> _getBadgeColors(String status) {
    final statusLower = status.toLowerCase();
    if (statusLower == 'canceled') {
      return {
        'background': const Color(0xFFFFEBEE), // Very light red
        'text': const Color(0xFFE94E6C) // Red/Pink
      };
    } else if (statusLower == 'confirmed') {
      return {
        'background': const Color(0xFFE0F7FA), // Very light teal
        'text': const Color(0xFF00ACC1) // Teal
      };
    } else if (statusLower == 'completed') {
      return {
        'background': const Color(0xFFE8F5E9), // Very light green
        'text': const Color(0xFF43A047) // Green
      };
    } else {
      // Default/Pending
      return {
        'background': const Color(0xFFFFFDE7),
        'text': const Color(0xFFFFB300)
      };
    }
  }

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    final primaryColor = isDarkMode ? AppColors.white : AppColors.blackMainTextColor;
    final cardBackgroundColor = isDarkMode ? AppColors.blackMainTextColor : Colors.white;

    final statusLower = statusText.toLowerCase();
    final badgeColors = _getBadgeColors(statusText);
    final statusBadgeColor = badgeColors['background']!;
    final statusTextColor = badgeColors['text']!;

    final isCanceled = statusLower == 'canceled';
    final isConfirmed = statusLower == 'confirmed';
    final isCompleted = statusLower == 'completed';

    // Text color for info rows (Date, Location)
    final infoTextColor = isDarkMode ? AppColors.white : AppColors.grayTextSecondaryColor;

    return Container(
      width: 1.sw,
      padding: EdgeInsets.all(12.w),
      margin: EdgeInsets.only(bottom: 16.h), // Add bottom margin for list spacing
      decoration: BoxDecoration(
        color: cardBackgroundColor,
        borderRadius: BorderRadius.circular(16.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Trainer Image
              CustomNetworkImage(
                height: 65.r,
                width: 65.r,
                imageUrl: trainerImageUrl,
                borderRadius: BorderRadius.circular(12.r),
                fit: BoxFit.cover,
              ),
              Gap(12.w),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Name, Age, Verification, and Status Badge Row
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Text(
                              '$name, $age',
                              style: GoogleFonts.montserrat(
                                fontWeight: FontWeight.w800,
                                fontSize: 14.sp,
                                color: primaryColor,
                              ),
                              overflow: TextOverflow.ellipsis,
                            ),
                            Gap(6.w),
                            Assets.icons.verifyed.svg(width: 16.w, height: 16.w), // Verification icon
                          ],
                        ),
                        Gap(8.w),
                        // Status Badge
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
                          decoration: BoxDecoration(
                            color: statusBadgeColor,
                            borderRadius: BorderRadius.circular(16.r),
                          ),
                          child: Text(
                            statusText.tr,
                            style: GoogleFonts.montserrat(
                              fontWeight: FontWeight.w600,
                              fontSize: 12.sp,
                              color: statusTextColor,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Gap(4.h),
                    // Rating and Activities Row
                    Row(
                      children: [
                        // Rating Chip
                        Row(
                          children: [
                            Text(
                              rating.toStringAsFixed(1),
                              style: context.labelMedium.copyWith(
                                fontWeight: FontWeight.w700,
                                color: primaryColor,
                              ),
                            ),
                            Gap(4.w),
                            Icon(Icons.star, color: AppColors.orangeSecondaryAccentColor, size: 16.r),
                          ],
                        ),
                        Gap(12.w),
                        // Main Activity Chip
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
                          decoration: BoxDecoration(
                            color: AppColors.grayTextSecondaryColor.withOpacity(0.1),
                            borderRadius: BorderRadius.circular(8.r),
                          ),
                          child: Text(
                            mainActivity,
                            style: GoogleFonts.montserrat(
                              fontWeight: FontWeight.w500,
                              fontSize: 12.sp,
                              color: infoTextColor,
                            ),
                          ),
                        ),
                        Gap(6.w),
                        // +N More Chip
                        if (moreActivitiesCount > 0)
                          Container(
                            padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
                            decoration: BoxDecoration(
                              color: AppColors.grayTextSecondaryColor.withOpacity(0.1),
                              borderRadius: BorderRadius.circular(8.r),
                            ),
                            child: Text(
                              '+$moreActivitiesCount more',
                              style: GoogleFonts.montserrat(
                                fontWeight: FontWeight.w500,
                                fontSize: 12.sp,
                                color: infoTextColor,
                              ),
                            ),
                          ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
          Gap(12.h),

          // Date Row
          Row(
            children: [
              Icon(Iconsax.calendar_2, size: 18.r, color: infoTextColor),
              Gap(8.w),
              Flexible(
                child: Text(
                  dateTime.tr,
                  style: GoogleFonts.montserrat(
                    fontWeight: FontWeight.w500,
                    fontSize: 14.sp,
                    color: infoTextColor,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
          Gap(8.h),

          // Location Row
          Row(
            children: [
              Icon(Iconsax.location, size: 18.r, color: infoTextColor),
              Gap(8.w),
              Flexible(
                child: Text(
                  location.tr,
                  style: GoogleFonts.montserrat(
                    fontWeight: FontWeight.w500,
                    fontSize: 14.sp,
                    color: infoTextColor,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
          Gap(16.h),

          // --- Buttons Section ---
          if (isCanceled)
            SizedBox(
              width: 1.sw,
              child: ElevatedButton(
                onPressed: onReschedulePressed,
                style: Theme.of(context).elevatedButtonTheme.style?.copyWith(
                  minimumSize: WidgetStateProperty.all(Size(1.sw, 48.h)),
                ),
                child: Text('Reschedule'.tr),
              ),
            ),

          if (isConfirmed)
            Row(
              children: [
                if (onCancelPressed != null)
                  Expanded(
                    child: OutlinedButton(
                      onPressed: onCancelPressed,
                      style: Theme.of(context).outlinedButtonTheme.style?.copyWith(
                        // Custom styling for the Cancel button
                        side: WidgetStateProperty.all( BorderSide(color: AppColors.grayTextSecondaryColor.withOpacity(0.5))),
                        foregroundColor: WidgetStateProperty.all(primaryColor),
                        backgroundColor: WidgetStateProperty.all(isDarkMode ? AppColors.blackMainTextColor : Colors.grey.shade100),
                        minimumSize: WidgetStateProperty.all(Size(double.infinity, 48.h)),
                      ),
                      child: Text(outlinedButtonText ?? AppStrings.cancel.tr),
                    ),
                  ),
                if (onCancelPressed != null) Gap(16.w),
                Expanded(
                  child: ElevatedButton(
                    onPressed: onReschedulePressed,
                    style: Theme.of(context).elevatedButtonTheme.style?.copyWith(
                      minimumSize: WidgetStateProperty.all(Size(double.infinity, 48.h)),
                    ),
                    child: Text('Reschedule'.tr),
                  ),
                ),
              ],
            ),

          if (isCompleted)
            SizedBox(
              width: 1.sw,
              child: ElevatedButton(
                onPressed: onReviewPressed ?? onReschedulePressed, // Default to reschedule if review is null
                style: Theme.of(context).elevatedButtonTheme.style?.copyWith(
                  minimumSize: WidgetStateProperty.all(Size(1.sw, 48.h)),
                ),
                child: Text('Review & Rate'.tr), // Assuming "Review & Rate" is the primary action for completed
              ),
            ),
        ],
      ),
    );
  }
}