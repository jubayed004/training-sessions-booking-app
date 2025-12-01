import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:my_trainer/utils/color/app_colors.dart';

class DataDisplayItem extends StatelessWidget {
  final String label;
  final String value;


  const DataDisplayItem({
    super.key,
    required this.label,
    required this.value,

  });

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    final containerColor = isDarkMode ? AppColors.black : Colors.white;
    final borderColor = isDarkMode ? Colors.grey.shade700 : Colors.grey.shade300;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label.tr,
          style: context.textTheme.titleMedium,
        ),
        Gap(8.h),
        Container(
          width: context.width,
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 14.h),
          decoration: BoxDecoration(
            color: containerColor,
            borderRadius: BorderRadius.circular(12.r),
            border: Border.all(
              color: borderColor,
              width: 1.w,
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Text(
                  value,
                  style: context.textTheme
                  .titleSmall,
                  overflow: TextOverflow.ellipsis,
                ),
              ),

            ],
          ),
        ),
      ],
    );
  }
}