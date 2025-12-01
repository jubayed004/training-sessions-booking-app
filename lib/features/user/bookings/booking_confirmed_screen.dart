import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax/iconsax.dart';
import 'package:my_trainer/core/router/routes.dart';
import 'package:my_trainer/share/widgets/button/custom_button.dart';
import 'package:my_trainer/share/widgets/network_image/custom_network_image.dart';
import 'package:my_trainer/utils/app_strings/app_strings.dart';
import 'package:my_trainer/utils/color/app_colors.dart';
import 'package:my_trainer/utils/extension/base_extension.dart';

class BookingConfirmationScreen extends StatelessWidget {
  const BookingConfirmationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    final primaryTextColor = isDarkMode ? AppColors.white : AppColors.blackMainTextColor;
    final secondaryTextColor = isDarkMode ? AppColors.white.withValues(alpha: 0.7) : AppColors.grayTextSecondaryColor;
    final cardBackgroundColor = isDarkMode ? AppColors.blackMainTextColor : Colors.white;

    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: AppBar(
        scrolledUnderElevation: 0,
        title: Text(
          "mytrainerr.".tr,
          style: Theme.of(context).textTheme.headlineSmall?.copyWith(
            color: isDarkMode ? Colors.white : Color(0xFFE94E6C),
            letterSpacing: -0.5,
          ),
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                padding: EdgeInsets.symmetric(horizontal: 24.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Gap(40.h),
                    Icon(
                      Icons.verified,
                      size: 80.r,
                      color:AppColors.primaryColor,
                    ),
                    Gap(24.h),
                    Text(
                     " Booking confirmed".tr,
                      style: GoogleFonts.montserrat(
                        fontWeight: FontWeight.w800,
                        fontSize: 24.sp,
                        color: primaryTextColor,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    Gap(8.h),
                    Text(
                      'Your session with Ann Smith is scheduled.'.tr,
                      style: context.bodyMedium,
                      textAlign: TextAlign.center,
                    ),
                    Gap(32.h),
                    Container(
                      padding: EdgeInsets.all(12.w),
                      decoration: BoxDecoration(
                        color: cardBackgroundColor,
                        borderRadius: BorderRadius.circular(20.r),
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
                          CustomNetworkImage(
                            height: 60.r,
                            width: 60.r,
                            imageUrl: "https://www.greatestphysiques.com/wp-content/uploads/2019/01/8-Week-Total-Workout-Program-for-Women.jpg",
                            borderRadius: BorderRadius.circular(12.r),
                            fit: BoxFit.cover,
                          ),
                          Gap(12.w),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [

                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'Ann Smith, 26',
                                      style: GoogleFonts.montserrat(
                                        fontWeight: FontWeight.w700,
                                        fontSize: 16.sp,
                                        color: primaryTextColor,
                                      ),
                                    ),
                                    Row(
                                      children: [
                                        Text(
                                          '4.9',
                                          style: context.titleSmall,
                                        ),
                                        Gap(4.w),
                                        Icon(Icons.star, color: AppColors.orangeSecondaryAccentColor, size: 18.r),
                                      ],
                                    ),
                                  ],
                                ),
                                Gap(6.h),

                                Wrap(
                                  spacing: 8.w,
                                  children: [

                                    Container(
                                      padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
                                      decoration: BoxDecoration(
                                        color: AppColors.grayTextSecondaryColor.withValues(alpha:  0.1),
                                        borderRadius: BorderRadius.circular(6.r),
                                      ),
                                      child: Text(
                                        'Yoga',
                                        style:context.labelMedium,
                                      ),
                                    ),
                                    // Tag 2
                                    Container(
                                      padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
                                      decoration: BoxDecoration(
                                        color: AppColors.grayTextSecondaryColor.withValues(alpha: 0.1),
                                        borderRadius: BorderRadius.circular(6.r),
                                      ),
                                      child: Text(
                                        'Stretching',
                                        style: context.labelMedium,
                                      ),
                                    ),
                                    // Tag 3
                                    Container(
                                      padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
                                      decoration: BoxDecoration(
                                        color: AppColors.grayTextSecondaryColor.withValues(alpha: 0.1),
                                        borderRadius: BorderRadius.circular(6.r),
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
                    ),
                    Gap(24.h),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
                      decoration: BoxDecoration(
                        color: cardBackgroundColor,
                        borderRadius: BorderRadius.circular(16.r),
                        boxShadow: [BoxShadow(color: Colors.black.withValues(alpha:  0.03), blurRadius: 8, offset: Offset(0, 4))],
                      ),
                      child: Row(
                        children: [
                          Container(
                            padding: EdgeInsets.all(10.r),
                            decoration: BoxDecoration(
                              color: AppColors.grayTextSecondaryColor.withValues(alpha: 0.1),
                              borderRadius: BorderRadius.circular(12.r),
                            ),
                            child: Icon(Iconsax.location, size: 24.r, color: secondaryTextColor),
                          ),
                          Gap(16.w),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  AppStrings.location.tr,
                                  style: GoogleFonts.montserrat(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 10.sp,
                                    color: AppColors.grayTextSecondaryColor,
                                    letterSpacing: 0.5,
                                  ),
                                ),
                                Gap(4.h),
                                Text(
                                  'Jägerstrasse 27, 10117 Berlin',
                                  style: GoogleFonts.montserrat(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 14.sp,
                                    color: primaryTextColor,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),

                    Gap(12.h),

                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
                      decoration: BoxDecoration(
                        color: cardBackgroundColor,
                        borderRadius: BorderRadius.circular(16.r),
                        boxShadow: [BoxShadow(color: Colors.black.withValues(alpha: 0.03), blurRadius: 8, offset: Offset(0, 4))],
                      ),
                      child: Row(
                        children: [
                          Container(
                            padding: EdgeInsets.all(10.r),
                            decoration: BoxDecoration(
                              color: AppColors.grayTextSecondaryColor.withValues(alpha: 0.1),
                              borderRadius: BorderRadius.circular(12.r),
                            ),
                            child: Icon(Iconsax.timer_1, size: 24.r, color: secondaryTextColor),
                          ),
                          Gap(16.w),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'TRAINING TIME',
                                  style: GoogleFonts.montserrat(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 10.sp,
                                    color: AppColors.grayTextSecondaryColor,
                                    letterSpacing: 0.5,
                                  ),
                                ),
                                Gap(4.h),
                                Text(
                                  '60 minutes',
                                  style: GoogleFonts.montserrat(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 14.sp,
                                    color: primaryTextColor,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Gap(12.h),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
                      decoration: BoxDecoration(
                        color: cardBackgroundColor,
                        borderRadius: BorderRadius.circular(16.r),
                        boxShadow: [BoxShadow(color: Colors.black.withValues(alpha: 0.03), blurRadius: 8, offset: Offset(0, 4))],
                      ),
                      child: Row(
                        children: [
                          Container(
                            padding: EdgeInsets.all(10.r),
                            decoration: BoxDecoration(
                              color: AppColors.grayTextSecondaryColor.withValues(alpha: 0.1),
                              borderRadius: BorderRadius.circular(12.r),
                            ),
                            child: Icon(Iconsax.calendar_tick, size: 24.r, color: secondaryTextColor),
                          ),
                          Gap(16.w),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'SESSION 01',
                                  style: GoogleFonts.montserrat(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 10.sp,
                                    color: AppColors.grayTextSecondaryColor,
                                    letterSpacing: 0.5,
                                  ),
                                ),
                                Gap(4.h),
                                Text(
                                  '21-10-2025 7:00 p.m',
                                  style: GoogleFonts.montserrat(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 14.sp,
                                    color: primaryTextColor,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Gap(12.h),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
                      decoration: BoxDecoration(
                        color: cardBackgroundColor,
                        borderRadius: BorderRadius.circular(16.r),
                        boxShadow: [BoxShadow(color: Colors.black.withValues(alpha: 0.03), blurRadius: 8, offset: Offset(0, 4))],
                      ),
                      child: Row(
                        children: [
                          Container(
                            padding: EdgeInsets.all(10.r),
                            decoration: BoxDecoration(
                              color: AppColors.grayTextSecondaryColor.withValues(alpha: 0.1),
                              borderRadius: BorderRadius.circular(12.r),
                            ),
                            child: Icon(Iconsax.receipt, size: 24.r, color: secondaryTextColor),
                          ),
                          Gap(16.w),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'CANCELLATION POLICY',
                                  style: GoogleFonts.montserrat(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 10.sp,
                                    color: AppColors.grayTextSecondaryColor,
                                    letterSpacing: 0.5,
                                  ),
                                ),
                                Gap(4.h),
                                Text(
                                  'Up to 12 hours before the appointment',
                                  style: GoogleFonts.montserrat(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 14.sp,
                                    color: primaryTextColor,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),

                    Gap(40.h), // Space at bottom
                  ],
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(24.w, 16.h, 24.w, 32.h),
              child: CustomButton(
                text: 'See my bookings'.tr,
                onTap: () {
            AppRouter.route.pop();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}