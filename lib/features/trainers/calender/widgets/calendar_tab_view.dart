import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_trainer/core/custom_assets/assets.gen.dart';
import 'package:my_trainer/utils/color/app_colors.dart';
import 'package:flutter_calenders/flutter_calenders.dart';
import '../controller/calender_controller.dart';
import 'edit_bottom_sheet.dart';

class CalendarTabView extends GetView<CalenderController> {
  const CalendarTabView({super.key});

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;

    return SingleChildScrollView(
      child: Column(
        children: [
          EventBasedCalender(
            padding: EdgeInsets.all(10),
            primaryColor: AppColors.tertiaryTextColor,
            backgroundColor: Colors.white,
            chooserColor: AppColors.blackMainTextColor,
            endYear: 3000,
            startYear: 1990,
            currentMonthDateColor: Colors.black,
            pastFutureMonthDateColor: Colors.grey,
            isSelectedColor: AppColors.primaryColor,
            onDateTap: (date) {
              print(date);
            },
            events: [],
          ),
          Gap(16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Tuesday, December 26th",
                style: GoogleFonts.montserrat(
                  fontWeight: FontWeight.w800,
                  fontSize: 14.sp,
                  color: isDarkMode
                      ? AppColors.white
                      : AppColors.blackMainTextColor,
                ),
              ),
              TextButton(
                onPressed: () {
                  showModalBottomSheet(
                    context: context,
                    isScrollControlled: true,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.vertical(
                        top: Radius.circular(20),
                      ),
                    ),
                    builder: (context) => EditBottomSheet(
                      timeSlots: controller.timeSlots,
                      isDarkMode:
                          Theme.of(context).brightness == Brightness.dark,
                    ),
                  );
                },
                child: Text("Edit"),
              ),
            ],
          ),

          // Availability switches
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Available all day".tr,
                style: GoogleFonts.montserrat(
                  fontWeight: FontWeight.w800,
                  fontSize: 14.sp,
                  color: isDarkMode ? AppColors.white : const Color(0xFF1D242D),
                ),
              ),
              Obx(
                () => Transform.scale(
                  scale: 0.7,
                  child: Switch(
                    value: controller.saturdayConnect.value,
                    onChanged: (newValue) {
                      controller.saturdayConnect.value = newValue;
                    },
                    activeColor: Colors.white,
                    activeTrackColor: AppColors.orangeSecondaryAccentColor,
                    inactiveThumbColor: Colors.white,
                    inactiveTrackColor: const Color(0xFFE5E7EB),
                    materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  ),
                ),
              ),
            ],
          ),
          Gap(8),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Mark this day as unavailable".tr,
                style: GoogleFonts.montserrat(
                  fontWeight: FontWeight.w800,
                  fontSize: 14.sp,
                  color: isDarkMode ? AppColors.white : const Color(0xFF1D242D),
                ),
              ),
              Obx(
                () => Transform.scale(
                  scale: 0.7,
                  child: Switch(
                    value: controller.sundayConnect.value,
                    onChanged: (newValue) {
                      controller.sundayConnect.value = newValue;
                    },
                    activeColor: Colors.white,
                    activeTrackColor: AppColors.orangeSecondaryAccentColor,
                    inactiveThumbColor: Colors.white,
                    inactiveTrackColor: const Color(0xFFE5E7EB),
                    materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  ),
                ),
              ),
            ],
          ),
          Gap(16),
          // Time slots list
          ...controller.timeSlots.map((slot) {
            return Container(
              padding: EdgeInsets.symmetric(horizontal: 12, vertical: 10),
              margin: EdgeInsets.only(bottom: 12),
              decoration: BoxDecoration(
                color: isDarkMode
                    ? AppColors.blackMainTextColor.withOpacity(0.1)
                    : Colors.white,
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.05),
                    blurRadius: 4,
                    offset: Offset(0, 2),
                  ),
                ],
              ),
              child: Row(
                children: [
                  Text(
                    slot['time'],
                    style: GoogleFonts.montserrat(
                      fontWeight: FontWeight.w800,
                      fontSize: 14.sp,
                      color: isDarkMode
                          ? AppColors.white
                          : (slot['hasMessage']
                                ? AppColors.blackMainTextColor
                                : AppColors.primaryColor),
                    ),
                  ),
                  SizedBox(width: 10),
                  Expanded(
                    child: slot['hasMessage']
                        ? Container(
                            padding: EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              color: Color(0xFFE2F8F8),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Row(
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(20),
                                  child: Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                    width: 30.w,
                                    height: 30.h,
                                    child: Assets.images.upcomeingsessionimage
                                        .image(),
                                  ),
                                ),
                                SizedBox(width: 8),
                                Expanded(
                                  child: Text(
                                    "Ann Smith",
                                    style: GoogleFonts.montserrat(
                                      fontWeight: FontWeight.w800,
                                      fontSize: 14.sp,
                                      color: isDarkMode
                                          ? AppColors.white
                                          : AppColors.blackMainTextColor,
                                    ),
                                  ),
                                ),
                                SizedBox(width: 8),
                                GestureDetector(
                                  onTap: () {},
                                  child: CircleAvatar(
                                    radius: 20,
                                    backgroundColor: AppColors.primaryColor,
                                    child: Center(
                                      child: Assets.icons.messages.svg(
                                        colorFilter: ColorFilter.mode(
                                          AppColors.white,
                                          BlendMode.srcIn,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          )
                        : Container(
                            padding: EdgeInsets.all(8),
                            decoration: BoxDecoration(
                              color: Color(0xFFE2F8F8),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Text(
                              "Available",
                              style: GoogleFonts.montserrat(
                                fontWeight: FontWeight.w800,
                                fontSize: 14.sp,
                                color: isDarkMode
                                    ? AppColors.white
                                    : AppColors.primaryColor,
                              ),
                            ),
                          ),
                  ),
                ],
              ),
            );
          }).toList(),
        ],
      ),
    );
  }
}
