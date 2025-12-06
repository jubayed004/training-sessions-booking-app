import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_trainer/utils/color/app_colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SpecializationChips extends StatelessWidget {
  final List<String> specializations;
  final Set<String> selectedSpecializations;
  final Function(String) onSelectionChanged;

  const SpecializationChips({
    Key? key,
    required this.specializations,
    required this.selectedSpecializations,
    required this.onSelectionChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 10.w,
      //runSpacing: 12.h,
      children: specializations.map((spec) {
        final isSelected = selectedSpecializations.contains(spec);
        return FilterChip(
          label: Text(
            spec,
            style: GoogleFonts.montserrat(
              fontWeight: FontWeight.w600,
              fontSize: 12.sp,
              color: isSelected ? AppColors.primaryColor : const Color(0xFF4B5563),
            ),
          ),
          backgroundColor: isSelected
              ? AppColors.primaryColor.withAlpha(25)
              : Colors.white,
          selectedColor: AppColors.primaryColor.withAlpha(25),
          selected: isSelected,
          onSelected: (bool selected) {
            onSelectionChanged(spec);
          },
          side: BorderSide(
            color: isSelected ? AppColors.primaryColor : const Color(0xFFE5E7EB),
            width: 1.w,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.r),
          ),
          showCheckmark: false,
        );
      }).toList(),
    );
  }
}
