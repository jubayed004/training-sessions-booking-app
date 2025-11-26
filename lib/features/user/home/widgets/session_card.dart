import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:my_trainer/core/custom_assets/assets.gen.dart';
import 'package:my_trainer/utils/app_strings/app_strings.dart';
import 'package:my_trainer/utils/color/app_colors.dart';
import 'package:my_trainer/utils/extension/base_extension.dart';

// We remove the SessionStatus enum and use a String instead.

class SessionCard extends StatelessWidget {
  final String name;
  final int age;
  final double rating;
  final String mainActivity;

  final String dateTime;
  final String location;
  final String statusText; // <-- Now a simple String for dynamic status from server
  final VoidCallback onReschedulePressed;
  final VoidCallback? onCancelPressed; // Optional for confirmed state

  const SessionCard({
    super.key,
    required this.name,
    required this.age,
    required this.rating,
    required this.mainActivity,

    required this.dateTime,
    required this.location,
    required this.statusText, // Make it required
    required this.onReschedulePressed,
    this.onCancelPressed, // Optional
  });

  Map<String, Color> _getBadgeColors(String status) {
    final statusLower = status.toLowerCase();
    if (statusLower == 'canceled') {
      return {
        'background': const Color(0xFFFFEBEE),
        'text': const Color(0xFFE94E6C) // Your accent color/red
      };
    } else if (statusLower == 'confirmed') {
      return {
        'background': const Color(0xFFE0F7FA), // Light cyan
        'text': const Color(0xFF00ACC1) // Blue-green
      };
    } else if (statusLower == 'completed') { // Handle the new 'Completed' state
      return {
        'background': const Color(0xFFE8F5E9), // Light green
        'text': const Color(0xFF43A047) // Darker green
      };
    } else {
      return {
        'background': const Color(0xFFFFFDE7), // Light yellow
        'text': const Color(0xFFFFB300) // Amber
      };
    }
  }

  bool _isCanceledStatus(String status) {
    return status.toLowerCase() == 'canceled';
  }
  bool _isConfirmedStatus(String status) {
    return status.toLowerCase() == 'confirmed';
  }

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    final primaryColor = isDarkMode ? AppColors.white : AppColors.blackMainTextColor;
    final cardBackgroundColor = isDarkMode ? AppColors.blackMainTextColor : Colors.white;

    final badgeColors = _getBadgeColors(statusText);
    final statusBadgeColor = badgeColors['background']!;
    final statusTextColor = badgeColors['text']!;
    final isCanceled = _isCanceledStatus(statusText);
    final isConfirmed = _isConfirmedStatus(statusText);

    return Container(
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.all(12.w),
      decoration: BoxDecoration(
        color: cardBackgroundColor,
        borderRadius: BorderRadius.circular(16.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha:  isDarkMode ? 0.05 : 0.05),
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
              Container(
                width: 65.r,
                height: 65.r,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12.r),
                  image: const DecorationImage(
                    image: AssetImage('assets/images/upcomeingsessionimage.png'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Gap(12.w),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          spacing: 6,
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
                            Assets.icons.verifyed.svg(width: 16)
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
                            statusText.tr, // Use .tr for dynamic translation
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
                      spacing: 6,
                      children: [
                        // Rating Chip
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
                          decoration: BoxDecoration(
                            color: AppColors.orangeSecondaryAccentColorNormal.withValues(alpha: 0.2),
                            borderRadius: BorderRadius.circular(8.r),
                          ),
                          child: Row(
                            spacing: 4,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                rating.toStringAsFixed(1),
                                style: context.labelMedium
                              ),
                               Icon(Icons.star, color: AppColors.orangeSecondaryAccentColor, size: 16,),
                            ],
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
                          decoration: BoxDecoration(
                            color: Theme.of(context).primaryColor.withValues(alpha: 0.1),
                            borderRadius: BorderRadius.circular(8.r),
                          ),
                          child: Text(
                            mainActivity,
                            style: context.labelLarge
                          ),
                        ),
                          Container(
                            padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
                            decoration: BoxDecoration(
                              color: AppColors.grayTextSecondaryColor.withValues(alpha: 0.1),
                              borderRadius: BorderRadius.circular(8.r),
                            ),
                            child: Text(
                              '+1 more',
                              style: context.labelMedium,
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
          Row(
            spacing: 8,
            children: [
              Icon(
                Iconsax.calendar_2,
                size: 18.r,
                color: context.iconColor,
              ),
              Flexible(
                child: Text(
                  dateTime.tr,
                  style: context.bodySmall,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
          Gap(8.h),
          Row(
            spacing: 8,
            children: [
              Icon(
                Iconsax.location,
                size: 18.r,
                color: context.iconColor,
              ),

              Flexible(
                child: Text(
                  location.tr,
                  style: context.bodySmall,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
          Gap(16.h),
          if (isCanceled)
            SizedBox(
              width: 1.sw,
              child: ElevatedButton(
                onPressed: onReschedulePressed,
                style: Theme.of(context).elevatedButtonTheme.style,
                child: Text(
                    'Reschedule',
                ),
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
                        foregroundColor: WidgetStateProperty.all(AppColors.redColor),
                      ),
                      child: const Text('Cancel'),
                    )

                  ),
                if (onCancelPressed != null) Gap(16.w),
                Expanded(
                  child: ElevatedButton(
                    onPressed: onReschedulePressed,
                    style: Theme.of(context).elevatedButtonTheme.style,
                    child: Text(
                        'Reschedule',
                    ),
                  ),
                ),
              ],
            ),
        ],
      ),
    );
  }
}