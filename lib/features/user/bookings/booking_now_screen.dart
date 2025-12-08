import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax/iconsax.dart';
import 'package:my_trainer/share/widgets/button/custom_button.dart';
import 'package:my_trainer/utils/color/app_colors.dart';

import 'package:go_router/go_router.dart';
import 'package:my_trainer/core/router/route_path.dart';

class BookingNowScreen extends StatelessWidget {
  const BookingNowScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      appBar: AppBar(
        scrolledUnderElevation: 0,
        title: Text(
          "mytrainerr.".tr,
          style: Theme.of(context).textTheme.headlineSmall?.copyWith(
            color: AppColors.appbarTextColor,
            letterSpacing: -0.5,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: AppColors.blackMainTextColor),
          onPressed: () => context.pop(),
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Gap(10.h),
                    Text(
                      'Select and confirm session',
                      style: GoogleFonts.montserrat(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w500,
                        color: AppColors.grayTextSecondaryColor,
                      ),
                    ),
                    Gap(16.h),

                    // Trainer Card
                    Container(
                      padding: EdgeInsets.all(12.w),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(16.r),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.02),
                            blurRadius: 10,
                            offset: const Offset(0, 4),
                          ),
                        ],
                      ),
                      child: Row(
                        children: [
                          Container(
                            width: 60.r,
                            height: 60.r,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12.r),
                              image: DecorationImage(
                                image: NetworkImage(
                                  'https://images.unsplash.com/photo-1494790108377-be9c29b29330?w=200',
                                ),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          Gap(16.w),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Text(
                                      'Ann Smith, 26',
                                      style: GoogleFonts.montserrat(
                                        fontSize: 16.sp,
                                        fontWeight: FontWeight.w800,
                                        color: AppColors.blackMainTextColor,
                                        fontStyle: FontStyle.italic,
                                      ),
                                    ),
                                  ],
                                ),
                                Gap(4.h),
                                Row(
                                  children: [
                                    Text(
                                      '4.9',
                                      style: GoogleFonts.montserrat(
                                        fontSize: 14.sp,
                                        fontWeight: FontWeight.w600,
                                        color: AppColors.blackMainTextColor,
                                      ),
                                    ),
                                    Gap(4.w),
                                    Icon(
                                      Icons.star,
                                      color: Colors.amber,
                                      size: 18.r,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          Icon(
                            Icons.arrow_forward_ios,
                            size: 16.r,
                            color: AppColors.grayTextSecondaryColor,
                          ),
                        ],
                      ),
                    ),
                    Gap(16.h),

                    // Details Card
                    Container(
                      padding: EdgeInsets.all(16.w),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(16.r),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.02),
                            blurRadius: 10,
                            offset: const Offset(0, 4),
                          ),
                        ],
                      ),
                      child: Column(
                        children: [
                          _buildDetailRow(
                            icon: Iconsax.location,
                            title: 'LOCATION',
                            value: 'Jägerstrasse 27, 10117 Berlin',
                          ),
                          Gap(16.h),
                          Divider(
                            height: 1,
                            color: AppColors.bgSecondaryButtonColor,
                          ),
                          Gap(16.h),
                          _buildDetailRow(
                            icon: Iconsax.timer_1,
                            title: 'TRAINING TIME',
                            value: '60 minutes',
                          ),
                          Gap(16.h),
                          Divider(
                            height: 1,
                            color: AppColors.bgSecondaryButtonColor,
                          ),
                          Gap(16.h),
                          _buildDetailRow(
                            icon: Iconsax.money, // Or a similar icon
                            title: 'PRICING OPTIONS',
                            value: '5x session',
                          ),
                          Gap(16.h),
                          Divider(
                            height: 1,
                            color: AppColors.bgSecondaryButtonColor,
                          ),
                          Gap(16.h),
                          _buildDetailRow(
                            icon: Iconsax.calendar_tick,
                            title: 'CANCELLATION POLICY',
                            value: 'Up to 12 hours before the appointment',
                          ),
                        ],
                      ),
                    ),
                    Gap(24.h),

                    // Price Overview Header
                    Text(
                      'PRICE OVERVIEW',
                      style: GoogleFonts.montserrat(
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w600,
                        color: AppColors.grayTertiaryTextColor,
                      ),
                    ),
                    Gap(8.h),

                    // Price Overview Card
                    Container(
                      padding: EdgeInsets.all(16.w),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(16.r),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.02),
                            blurRadius: 10,
                            offset: const Offset(0, 4),
                          ),
                        ],
                      ),
                      child: Column(
                        children: [
                          _buildPriceRow('5x session', '€100.00'),
                          Gap(12.h),
                          _buildPriceRow('Service fee', '€1.30'),
                          Gap(16.h),
                          Divider(
                            height: 1,
                            color: AppColors.bgSecondaryButtonColor,
                          ),
                          Gap(16.h),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Overall',
                                style: GoogleFonts.montserrat(
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.w600,
                                  color: AppColors.grayTextSecondaryColor,
                                ),
                              ),
                              Text(
                                '€101.30',
                                style: GoogleFonts.montserrat(
                                  fontSize: 20.sp,
                                  fontWeight: FontWeight.w800,
                                  color: AppColors.blackMainTextColor,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Gap(100.h), // Spacing for bottom button
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
      bottomSheet: Container(
        color: AppColors.backgroundColor,
        padding: EdgeInsets.only(
          left: 16.w,
          right: 16.w,
          bottom: 24.h,
          top: 12.h,
        ),
        child: CustomButton(
          text: 'Confirm booking (€101.30)',
          onTap: () {
            context.pushNamed(RoutePath.bookingConfirmationScreen);
          },
        ),
      ),
    );
  }

  Widget _buildDetailRow({
    required IconData icon,
    required String title,
    required String value,
  }) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: EdgeInsets.all(10.r),
          decoration: BoxDecoration(
            color: AppColors.bgSecondaryButtonColor,
            borderRadius: BorderRadius.circular(12.r),
          ),
          child: Icon(
            icon,
            size: 20.r,
            color: AppColors.grayTextSecondaryColor,
          ),
        ),
        Gap(16.w),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: GoogleFonts.montserrat(
                  fontSize: 10.sp,
                  fontWeight: FontWeight.w600,
                  color: AppColors.grayTertiaryTextColor,
                  letterSpacing: 0.5,
                ),
              ),
              Gap(4.h),
              Text(
                value,
                style: GoogleFonts.montserrat(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w600,
                  color: AppColors.blackMainTextColor,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildPriceRow(String label, String price) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: GoogleFonts.montserrat(
            fontSize: 14.sp,
            fontWeight: FontWeight.w500,
            color: AppColors.grayTextSecondaryColor,
          ),
        ),
        Text(
          price,
          style: GoogleFonts.montserrat(
            fontSize: 14.sp,
            fontWeight: FontWeight.w600,
            color: AppColors.blackMainTextColor,
          ),
        ),
      ],
    );
  }
}
