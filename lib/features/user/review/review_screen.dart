import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_trainer/utils/color/app_colors.dart';

class ReviewScreen extends StatelessWidget {
  const ReviewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: AppBar(
        scrolledUnderElevation: 0,
        title: Text(
          "mytrainerr.".tr,
          style: Theme.of(context).textTheme.headlineSmall?.copyWith(
            color: Color(0xFFE94E6C),
            letterSpacing: -0.5,
          ),
        ),
      ),
      body: ListView.separated(
        padding: EdgeInsets.all(16.w),
        itemCount: 8, // Mock count matching the scroll in screenshot
        separatorBuilder: (context, index) => Gap(12.h),
        itemBuilder: (context, index) => _buildReviewCard(),
      ),
    );
  }

  Widget _buildReviewCard() {
    return Container(
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(
              0.04,
            ), // Slightly increased opacity for visibility
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
        border: Border.all(
          color: AppColors.bgSecondaryButtonColor.withOpacity(0.5),
        ), // Added subtle border
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              CircleAvatar(
                radius: 20.r,
                backgroundImage: const NetworkImage(
                  'https://images.unsplash.com/photo-1494790108377-be9c29b29330?w=200',
                ),
              ),
              Gap(12.w),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Ann Smith',
                    style: GoogleFonts.montserrat(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w800,
                      color: AppColors.blackMainTextColor,
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                  Text(
                    '24-10-2025',
                    style: GoogleFonts.montserrat(
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w500,
                      color: AppColors.grayTextSecondaryColor,
                    ),
                  ),
                ],
              ),
              const Spacer(),
              Row(
                children: [
                  Text(
                    '5.0',
                    style: GoogleFonts.montserrat(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w700,
                      color: AppColors.blackMainTextColor,
                    ),
                  ),
                  Gap(4.w),
                  Icon(Icons.star, color: Colors.amber, size: 20.r),
                ],
              ),
            ],
          ),
          Gap(12.h),
          Text(
            'Lorem ipsum dolor sit amet consectetur. Felis et lacus ut egestas urna aliquam scelerisque pretium mauris. Risus aliquam varius ut a. In est viverra dui.',
            style: GoogleFonts.montserrat(
              fontSize: 13.sp,
              fontWeight: FontWeight.w500,
              color: AppColors.blackMainTextColor,
              height: 1.4,
            ),
          ),
        ],
      ),
    );
  }
}
