import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_trainer/utils/color/app_colors.dart';

class AppointmentCard extends StatelessWidget {
  final Map<String, dynamic> appointment;
  final bool isDarkMode;
  final int selectedListTab;
  final VoidCallback onCancel;
  final VoidCallback onMessage;

  const AppointmentCard({
    Key? key,
    required this.appointment,
    required this.isDarkMode,
    required this.selectedListTab,
    required this.onCancel,
    required this.onMessage,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool isPast = selectedListTab == 1;
    bool isCancelled = selectedListTab == 2;

    return Container(
      margin: EdgeInsets.only(bottom: 16),
      padding: EdgeInsets.all(16),
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
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CircleAvatar(
            radius: 28,
            backgroundImage: NetworkImage(appointment['image']),
          ),
          Gap(12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "${appointment['name']}, ${appointment['age']}",
                      style: GoogleFonts.montserrat(
                        fontWeight: FontWeight.w800,
                        fontSize: 15.sp,
                        color: isDarkMode
                            ? AppColors.white
                            : AppColors.blackMainTextColor,
                      ),
                    ),
                    if (isPast)
                      Text(
                        "Complete",
                        style: GoogleFonts.montserrat(
                          fontSize: 13.sp,
                          color: AppColors.primaryColor,
                          fontWeight: FontWeight.w600,
                        ),
                      )
                    else if (!isCancelled)
                      Text(
                        "Confirm",
                        style: GoogleFonts.montserrat(
                          fontSize: 13.sp,
                          color: AppColors.primaryColor,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                  ],
                ),
                Gap(4),
                Row(
                  children: [
                    Icon(
                      Icons.calendar_today,
                      size: 14,
                      color: AppColors.grayTertiaryTextColor,
                    ),
                    Gap(6),
                    Text(
                      appointment['date'],
                      style: GoogleFonts.montserrat(
                        fontSize: 13.sp,
                        color: AppColors.grayTertiaryTextColor,
                      ),
                    ),
                  ],
                ),
                Gap(4),
                Row(
                  children: [
                    Icon(
                      Icons.location_on,
                      size: 14,
                      color: AppColors.grayTertiaryTextColor,
                    ),
                    Gap(6),
                    Expanded(
                      child: Text(
                        appointment['location'],
                        style: GoogleFonts.montserrat(
                          fontSize: 13.sp,
                          color: AppColors.grayTertiaryTextColor,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
                Gap(12),
                if (isPast)
                  SizedBox(
                    width: double.infinity,
                    height: 40,
                    child: OutlinedButton(
                      onPressed: () {},
                      style: OutlinedButton.styleFrom(
                        side: BorderSide(
                          color: AppColors.grayTertiaryTextColor.withOpacity(
                            0.3,
                          ),
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      child: Text(
                        "See Review",
                        style: GoogleFonts.montserrat(
                          fontSize: 14.sp,
                          color: isDarkMode
                              ? AppColors.white
                              : AppColors.blackMainTextColor,
                        ),
                      ),
                    ),
                  )
                else if (!isCancelled)
                  Row(
                    children: [
                      Expanded(
                        child: OutlinedButton(
                          onPressed: onCancel,
                          style: OutlinedButton.styleFrom(
                            side: BorderSide(
                              color: AppColors.grayTertiaryTextColor
                                  .withOpacity(0.3),
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          child: Text(
                            "Cancel",
                            style: GoogleFonts.montserrat(
                              fontSize: 14.sp,
                              color: isDarkMode
                                  ? AppColors.white
                                  : AppColors.blackMainTextColor,
                            ),
                          ),
                        ),
                      ),
                      Gap(10),
                      Expanded(
                        child: ElevatedButton(
                          onPressed: onMessage,
                          style: ElevatedButton.styleFrom(
                            backgroundColor: AppColors.primaryColor,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.message,
                                size: 16,
                                color: Colors.white,
                              ),
                              Gap(6),
                              Text(
                                "message",
                                style: GoogleFonts.montserrat(
                                  fontSize: 14.sp,
                                  color: Colors.white,
                                ),
                              ),
                            ],
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
    );
  }
}
