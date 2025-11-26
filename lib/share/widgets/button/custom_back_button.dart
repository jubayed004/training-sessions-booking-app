
import 'package:flutter/material.dart';
import 'package:my_trainer/utils/color/app_colors.dart';

class CustomBackButton extends StatelessWidget {
  final VoidCallback onTap;
  final Color backgroundColor;
  final Color borderColor;
  final double borderRadius;

  final Icon icon;

  const CustomBackButton({
    super.key,
    required this.onTap,
    this.backgroundColor = AppColors.backgroundColor,
    this.borderColor = AppColors.backgroundsLinesColor,
    this.borderRadius = 23,
// Default height
    this.icon = const Icon(Icons.arrow_back,size: 24,),
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.all(3),
        child: Container(

            padding: EdgeInsets.zero,
            margin: EdgeInsets.zero,
            decoration: BoxDecoration(
              color: backgroundColor.withValues(alpha: 0.1),
              border: Border.all(
                color: borderColor,
                width: 1,
              ),
              borderRadius: BorderRadius.circular(borderRadius),
            ),
            child: icon
        ),
      ),
    );
  }
}
