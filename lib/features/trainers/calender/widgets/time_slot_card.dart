import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_trainer/core/custom_assets/assets.gen.dart';
import 'package:my_trainer/utils/color/app_colors.dart';

class TimeSlotCard extends StatelessWidget {
  final Map<String, dynamic> slot;
  final bool isDarkMode;

  const TimeSlotCard({Key? key, required this.slot, required this.isDarkMode})
    : super(key: key);

  @override
  Widget build(BuildContext context) {
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
                            child: Assets.images.upcomeingsessionimage.image(),
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
  }
}
