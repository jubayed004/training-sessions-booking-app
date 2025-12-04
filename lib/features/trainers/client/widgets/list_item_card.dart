import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax/iconsax.dart';
import 'package:my_trainer/core/custom_assets/assets.gen.dart';
import 'package:my_trainer/utils/app_strings/app_strings.dart';
import 'package:my_trainer/utils/color/app_colors.dart';
import 'package:my_trainer/utils/extension/base_extension.dart';

class ClientCardWidget extends StatelessWidget {
  final String name;
  final String nextMeeting;
  final int remainingSessions;
  final int totalSessions;
  final VoidCallback onMessagePressed;

  const ClientCardWidget({
    super.key,
    required this.name,
    required this.nextMeeting,
    required this.remainingSessions,
    required this.totalSessions,
    required this.onMessagePressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(12),
       width: context.screenWidth,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.backgroundsLinesColor,width: 1)
      ),
      margin: EdgeInsets.only(bottom: 8),
      child: Row(
        spacing: 16,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: SizedBox(
              width: 56.w,
              height: 56.h,
              child: Assets.images.upcomeingsessionimage.image(),
            ),
          ),
          Expanded(
            child: Column(
              spacing: 10,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Ann Smith",
                  style: GoogleFonts.montserrat(
                    fontWeight: FontWeight.w800,
                    fontSize: 14.sp,
                    color: AppColors.blackMainTextColor,
                  ),
                ),
                Row(
                  spacing: 6,
                  children: [
                    Icon(Iconsax.calendar,size: 16,),
                    Text(
                      "Next meeting: tomorrow",
                      style: context.labelSmall.copyWith(
                        color: AppColors.blackMainTextColor
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "remaining session ",
                      style: context.labelLarge,
                    ),

                    RichText(

                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: '8  ',
                            style: context.labelLarge.copyWith(color: AppColors.primaryColor),

                          ),

                          TextSpan(
                            text: 'of 10',
                            style: context.labelSmall
                          ),

                        ],
                      ),
                    ),

                  ],
                ),
                FilledButton(
                  style: ButtonStyle(
                    backgroundColor: WidgetStateProperty.all(AppColors.primaryColor),
                  ),
                  onPressed: () {},
                  child: Center(
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Assets.icons.messages.svg(
                          colorFilter: ColorFilter.mode(AppColors.white, BlendMode.srcIn),
                        ),
                        Text(
                          AppStrings.message.tr,
                          style: context.titleSmall.copyWith(color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
            /*      Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Client Name
                Text(
                  name,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 4),
                // Next Meeting
                Text(
                  nextMeeting,
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey,
                  ),
                ),
                SizedBox(height: 4),
                // Remaining Sessions
                Text(
                  '$remainingSessions of $totalSessions sessions remaining',
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.blueAccent,
                  ),
                ),
              ],
            ),
          ),

          // Message Button
          ElevatedButton(
            onPressed: onMessagePressed,
            style: ElevatedButton.styleFrom(
              shape: CircleBorder(), backgroundColor: Colors.teal,
              padding: EdgeInsets.all(16), // Button color
            ),
            child: Icon(Icons.message),
          ),*/
        ],
      ),
    );
  }
}
