import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_trainer/share/widgets/align/custom_align_text.dart';
import 'package:my_trainer/utils/app_strings/app_strings.dart';
import 'package:my_trainer/utils/color/app_colors.dart';

import 'widgets/custom_session_card.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "mytrainerr.".tr,
          style: Theme.of(context).textTheme.headlineSmall?.copyWith(color: isDarkMode ? Colors.white : Color(0xFFE94E6C), letterSpacing: -0.5),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
          child: Column(
            children: [
              CustomAlignText(
                text: "Hello, Alex!",
                style: GoogleFonts.montserrat(
                  fontWeight: FontWeight.w800,
                  fontSize: 24.sp,
                  color: isDarkMode ? AppColors.white : AppColors.blackMainTextColor,
                ),
              ),
              Gap(16),
              CustomSessionCard(
                title: AppStrings.newSession.tr,
                description: AppStrings.easilySelectTime.tr,
                buttonText: AppStrings.bookASession.tr,
                imagePath: 'assets/images/home_book_a_session.png',
                onButtonPressed: () {
                  print('Button pressed!');
                },
              ),
              Gap(16.h),
              CustomAlignText(
               text:  AppStrings.upcomingSessions.tr,
                style:GoogleFonts.montserrat(
                  fontWeight: FontWeight.w800,
                  fontSize: 14.sp,
                  color: isDarkMode ? AppColors.white : AppColors.grayTextSecondaryColor,
                ),
              )

            ],
          ),
        ),
      ),
    );
  }
}
