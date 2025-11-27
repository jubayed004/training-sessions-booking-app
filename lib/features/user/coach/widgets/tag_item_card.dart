import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_trainer/utils/color/app_colors.dart';

class TagItem extends StatelessWidget {
  final String tag;
  final bool isSelected;
  final VoidCallback onTap;

  const TagItem({super.key, required this.tag, required this.isSelected, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 8),
        decoration: BoxDecoration(
          color: AppColors.white.withValues(alpha: 0.2),
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: isSelected ? AppColors.primaryColor : Colors.transparent,
            width: 2,
          ),
        ),
        child: Text(
          tag,
          style: context.textTheme.bodyLarge?.copyWith(
            color: isSelected ?AppColors.primaryColor : AppColors.blackMainTextColor
          )
        ),
      ),
    );
  }
}