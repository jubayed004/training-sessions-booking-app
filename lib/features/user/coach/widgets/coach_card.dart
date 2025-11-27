import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax/iconsax.dart';
import 'package:my_trainer/core/custom_assets/assets.gen.dart'; // For verifyed.svg
import 'package:my_trainer/share/widgets/button/custom_button.dart';
import 'package:my_trainer/share/widgets/network_image/custom_network_image.dart'; // Assumed component
import 'package:my_trainer/utils/app_strings/app_strings.dart';
import 'package:my_trainer/utils/color/app_colors.dart'; // Assumed component
import 'package:my_trainer/utils/extension/base_extension.dart'; // Assumed component

class CoachCard extends StatelessWidget {
  final String name;
  final dynamic age;
  final dynamic rating;
  final dynamic price;
  final String location;
  final List<String> skills;
  final String image;
  final VoidCallback onProfilePressed;

  const CoachCard({
    Key? key,
    required this.name,
    required this.rating,
    required this.price,
    required this.location,
    required this.skills,
    required this.image,
    required this.age,
    required this.onProfilePressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    final primaryTextColor = isDarkMode ? AppColors.white : AppColors.blackMainTextColor;
    final cardBackgroundColor = isDarkMode ? AppColors.blackMainTextColor : Colors.white;

    final mainActivity = skills.isNotEmpty ? skills[0] : '';
    final secondaryActivity = skills.length > 1 ? skills[1] : '';
    final moreActivitiesCount = skills.length > 2 ? skills.length - 2 : 0;

    final priceText = '\$${price.toStringAsFixed(2)} /hr';

    final infoTextColor = isDarkMode ? AppColors.white : AppColors.grayTextSecondaryColor;
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    double cardHeight = screenHeight * 0.2;
    return Container(
      width: screenWidth,
      height: cardHeight,
      padding: EdgeInsets.only(right: 10,),
      margin: EdgeInsets.only(bottom: 16.h),
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
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // CustomNetworkImage adjusted to be smaller
          CustomNetworkImage(
            height: cardHeight, // Reduced size
            width:screenWidth/3,// Reduced size
            imageUrl: image,
            borderRadius: BorderRadius.circular(12.r),
            fit: BoxFit.cover,
          ),
          Gap(12.w),

          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Gap(6),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [

                        Text(
                          name,
                          style: GoogleFonts.montserrat(
                            fontWeight: FontWeight.w800,
                            fontSize: 14.sp,
                            color: primaryTextColor,
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                        Gap(4.w),
                        Assets.icons.verifyed.svg(width: 16.w, height: 16.w),
                      ],
                    ),
                    // Rating Chip (Star and number)
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          rating.toStringAsFixed(1),
                          style: context.titleLarge,
                        ),
                        Gap(4.w),
                        Icon(Icons.star, color: AppColors.orangeSecondaryAccentColor, size: 16.r),
                      ],
                    ),
                  ],
                ),
                Gap(8.h),

                // Activity Chips Row (INLINE LOGIC)
                Wrap(
                  spacing: 6.w,
                  runSpacing: 4.h,
                  children: [
                    // --- Main Activity Chip ---
                    if (mainActivity.isNotEmpty)
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
                        decoration: BoxDecoration(
                          color: Theme.of(context).primaryColor.withValues(alpha: 0.1),
                          borderRadius: BorderRadius.circular(8.r),
                        ),
                        child: Text(
                          mainActivity,
                          style: GoogleFonts.montserrat(
                            fontWeight: FontWeight.w500,
                            fontSize: 12.sp,
                            color: Theme.of(context).primaryColor,
                          ),
                        ),
                      ),

                    // --- Secondary Activity Chip ---
                    if (secondaryActivity.isNotEmpty)
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
                        decoration: BoxDecoration(
                          color: AppColors.grayTextSecondaryColor.withValues(alpha: 0.1),
                          borderRadius: BorderRadius.circular(8.r),
                        ),
                        child: Text(
                          secondaryActivity,
                          style: GoogleFonts.montserrat(
                            fontWeight: FontWeight.w500,
                            fontSize: 12.sp,
                            color: infoTextColor,
                          ),
                        ),
                      ),

                    // --- +N More Chip ---
                    if (moreActivitiesCount > 0)
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
                        decoration: BoxDecoration(
                          color: AppColors.grayTextSecondaryColor.withValues(alpha: 0.1),
                          borderRadius: BorderRadius.circular(8.r),
                        ),
                        child: Text(
                          '+$moreActivitiesCount more',
                          style: context.titleSmall,
                        ),
                      ),
                  ],
                ),
                Gap(8.h),

                // Location Row (INLINE LOGIC)
                Row(
                  children: [
                    Icon(Iconsax.location, size: 18.r, color: infoTextColor),
                    Gap(8.w),
                    Flexible(
                      child: Text(
                        location,
                        style: context.bodyMedium,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
                Gap(4.h),
                Row(
                  children: [
                    Icon(Iconsax.money, size: 18.r,),
                    Gap(8.w),
                    Flexible(
                      child: Text(
                        priceText,
                        style: context.bodyMedium,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
                Gap(8.h),
                CustomButton(
                  text: AppStrings.viewProfile.tr,
                  onTap: onProfilePressed,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
