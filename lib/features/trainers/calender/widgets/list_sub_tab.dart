import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_trainer/utils/color/app_colors.dart';

class ListSubTab extends StatelessWidget {
  final String label;
  final int index;
  final int selectedIndex;
  final bool isDarkMode;
  final ValueChanged<int> onTap;

  const ListSubTab({
    super.key,
    required this.label,
    required this.index,
    required this.selectedIndex,
    required this.isDarkMode,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    bool isSelected = selectedIndex == index;

    return GestureDetector(
      onTap: () => onTap(index),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        margin: EdgeInsets.only(right: 8),
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(
              color: isSelected ? AppColors.primaryColor : Colors.transparent,
              width: 2,
            ),
          ),
        ),
        child: Text(
          label,
          style: GoogleFonts.montserrat(
            fontSize: 14.sp,
            fontWeight: isSelected ? FontWeight.w700 : FontWeight.w500,
            color: isSelected
                ? (isDarkMode ? AppColors.white : AppColors.blackMainTextColor)
                : AppColors.grayTertiaryTextColor,
          ),
        ),
      ),
    );
  }
}
