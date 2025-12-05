import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:my_trainer/utils/color/app_colors.dart';

class UpProgressBar extends StatelessWidget {
  final int currentStep;
  final int totalSteps;

  const UpProgressBar({
    super.key,
    required this.currentStep,
    this.totalSteps = 5,
  });

  @override
  Widget build(BuildContext context) {

    const completedColor = AppColors.primaryColor;
    const pendingColor = Color(0xFFE5E7EB);
    List<Widget> segments = [];
    for (int i = 1; i <= totalSteps; i++) {
      final color = (currentStep >= i) ? completedColor : pendingColor;
      segments.add(
        Expanded(
          child: Container(
            height: 4.h,
            decoration: BoxDecoration(
              color: color,
              borderRadius: BorderRadius.circular(2.r),
            ),
          ),
        ),
      );

      if (i < totalSteps) {
        segments.add(Gap(8.w));
      }
    }
    return Row(
      children: segments,
    );
  }
}