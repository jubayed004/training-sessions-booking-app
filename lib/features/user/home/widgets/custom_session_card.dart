import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_trainer/utils/color/app_colors.dart';
import 'package:my_trainer/utils/extension/base_extension.dart';

class CustomSessionCard extends StatelessWidget {
  final String title;
  final String description;
  final String buttonText;
  final String imagePath;
  final VoidCallback onButtonPressed;

  const CustomSessionCard({
    super.key,
    required this.title,
    required this.description,
    required this.buttonText,
    required this.imagePath,
    required this.onButtonPressed,
  });

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    double cardWidth = screenWidth * 0.9;
    double cardHeight = screenHeight * 0.2+15;
    return Container(
      width: screenWidth,
      height: cardHeight,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.1),
            blurRadius: 10,
            offset: Offset(0, 5),
          ),
        ],
      ),
      child: Row(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    title,
                    style: GoogleFonts.montserrat(
                        fontWeight: FontWeight.w800,
                        fontSize: 24.sp,
                        color:isDarkMode ? AppColors.white : AppColors.blackMainTextColor
                    ),
                  ),
                   Gap(8),
                  Text(
                    description,
                    style: context.titleSmall
                  ),
                     Gap(8.h),
                  // Button
                  ElevatedButton(
                    onPressed: onButtonPressed,
                    style:Theme.of(context).elevatedButtonTheme.style,
                    child: Text(buttonText,),

                  ),
                ],
              ),
            ),
          ),
          Container(
            width: screenWidth/2.8,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              image: DecorationImage(
                image: AssetImage(imagePath), // The image path
                fit: BoxFit.cover,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
