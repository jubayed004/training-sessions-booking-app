import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_trainer/features/user/home/widgets/notification_item_card.dart';
import 'package:my_trainer/features/user/home/widgets/session_card.dart';
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
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: AppBar(
        scrolledUnderElevation: 0,
        title: Text(
          "mytrainerr.".tr,
          style: Theme.of(context).textTheme.headlineSmall?.copyWith(
            color: isDarkMode ? Colors.white : const Color(0xFFE94E6C),
            letterSpacing: -0.5,
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// Greeting
            CustomAlignText(
              text: "Hello, Alex!",
              style: GoogleFonts.montserrat(
                fontWeight: FontWeight.w800,
                fontSize: 24.sp,
                color: isDarkMode ? AppColors.white : AppColors.blackMainTextColor,
              ),
            ),
            Gap(16),
            /// Book a session card
            CustomSessionCard(
              title: AppStrings.newSession.tr,
              description: AppStrings.easilySelectTime.tr,
              buttonText: AppStrings.bookASession.tr,
              imagePath: 'assets/images/home_book_a_session.png',
              onButtonPressed: () {
                print('Book a Session Pressed');
              },
            ),
            Gap(24),
            /// Upcoming Sessions Title
            CustomAlignText(
              text: AppStrings.upcomingSessions.tr,
              style: GoogleFonts.montserrat(
                fontWeight: FontWeight.w800,
                fontSize: 14.sp,
                color: isDarkMode
                    ? AppColors.white
                    : AppColors.grayTextSecondaryColor,
              ),
            ),
            Gap(8),
            /// --- CANCELED SESSION CARD ---
            SessionCard(
              name: 'Ann Smith',
              age: 26,
              rating: 4.9,
              mainActivity: 'Yoga',
              dateTime: '21-10-2025 7:00 p.m',
              location: 'e.g. B. Berlin or “Peak Fit...”',
              statusText: 'canceled',
              onReschedulePressed: () {
                print('Canceled Reschedule Pressed');
              },
            ),
            Gap(16),
            /// --- CONFIRMED SESSION CARD ---
            SessionCard(
              name: 'Ann Smith',
              age: 26,
              rating: 4.9,
              mainActivity: 'Yoga',
              dateTime: '21-10-2025 7:00 p.m',
              location: 'e.g. B. Berlin or “Peak Fit...”',
              statusText: 'canceled',
              onReschedulePressed: () {
                print('Confirmed Reschedule Pressed');
              },
              onCancelPressed: () {
                print('Confirmed Cancel Pressed');
              },
            ),
            Gap(24),

            CustomAlignText(
              text: AppStrings.latestActivities.tr,
              style: GoogleFonts.montserrat(
                fontWeight: FontWeight.w800,
                fontSize: 14.sp,
                color: isDarkMode
                    ? AppColors.white
                    : AppColors.grayTextSecondaryColor,
              ),
            ),
            Gap(8),
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: 10,
              itemBuilder: (_, index) {
                return NotificationItem(
                  status: 'message',
                  title: 'Session with James K. completed',
                  subtitle: 'YESTERDAY, 6:30 A.M',
                  onTap: () {},
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
