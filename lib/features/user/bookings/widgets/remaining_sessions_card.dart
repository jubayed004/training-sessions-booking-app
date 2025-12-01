import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax/iconsax.dart';
import 'package:my_trainer/core/custom_assets/assets.gen.dart'; // For verifyed.svg
import 'package:my_trainer/share/widgets/network_image/custom_network_image.dart'; // Assumed component
import 'package:my_trainer/utils/color/app_colors.dart'; // Assumed component

class RemainingSessionsCard extends StatelessWidget {
  final String trainerName;
  final String trainerImageUrl;
  final int sessionsRemaining;
  final int totalSessions;
  final VoidCallback onChatPressed;
  final bool isVerified;

  const RemainingSessionsCard({
    super.key,
    required this.trainerName,
    required this.trainerImageUrl,
    required this.sessionsRemaining,
    required this.totalSessions,
    required this.onChatPressed,
    this.isVerified = true, // Default to true based on design
  });

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    final primaryTextColor = isDarkMode ? AppColors.white : AppColors.blackMainTextColor;
    final cardBackgroundColor = isDarkMode ? AppColors.blackMainTextColor : Colors.white;
    final secondaryTextColor = isDarkMode ? AppColors.black : AppColors.white;
    final progress = totalSessions > 0 ? (sessionsRemaining / totalSessions) : 0.0;

    return Container(
      width: 1.sw,
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
      decoration: BoxDecoration(
        color: cardBackgroundColor,
        borderRadius: BorderRadius.circular(16.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
            blurRadius: 10,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Row(
        children: [
          // Trainer Image
          CustomNetworkImage(
            height: 60.r,
            width: 60.r,
            imageUrl: trainerImageUrl,
            borderRadius: BorderRadius.circular(12.r),
            fit: BoxFit.cover,
          ),
          Gap(12.w),

          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  children: [
                    Text(
                      trainerName,
                      style: GoogleFonts.montserrat(
                        fontWeight: FontWeight.w800,
                        fontSize: 14.sp,
                        color: primaryTextColor,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                    if (isVerified) Gap(6.w),
                    if (isVerified)
                      Assets.icons.verifyed.svg(width: 16.w, height: 16.w),
                  ],
                ),
                Gap(8.h),
                Row(
                  children: [
                    Icon(
                      Iconsax.clock,
                      size: 16.r,
                    ),
                    Gap(4.w),
                    Text(
                      'REMAINING SESSION '.tr,
                      style:context.textTheme.labelMedium,
                    ),
                    Text(
                      '$sessionsRemaining',
                      style:context.textTheme.labelLarge?.copyWith(
                        color: AppColors.primaryColor
                      ),
                    ),
                    Text(
                      ' of $totalSessions',
                      style: context.textTheme.labelSmall,
                    ),
                  ],
                ),
                Gap(8.h),
                ClipRRect(
                  borderRadius: BorderRadius.circular(5.r),
                  child: LinearProgressIndicator(
                    value: progress,
                    backgroundColor: AppColors.backgroundsLinesColor,
                    valueColor: AlwaysStoppedAnimation<Color>(AppColors.primaryColor),
                    minHeight: 8.h,
                  ),
                ),
              ],
            ),
          ),
          Gap(16.w),
          GestureDetector(
            onTap: onChatPressed,
            child: CircleAvatar(
              radius: 30,
              backgroundColor: AppColors.tertiaryTextColor,
              child: Center(
                child:   Assets.icons.messages.svg(colorFilter: ColorFilter.mode(AppColors.white,BlendMode.srcIn )),
              ),
            ),
          ),
        ],
      ),
    );
  }
}