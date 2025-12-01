import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_trainer/utils/color/app_colors.dart';

class ProfileSectionTitle extends StatelessWidget {
  final String title;

  const ProfileSectionTitle({
    super.key,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: GoogleFonts.montserrat(
        fontWeight: FontWeight.w700,
        fontSize: 12.sp,
        color: AppColors.blackMainTextColor,
        letterSpacing: 0.5,
      ),
    );
  }
}