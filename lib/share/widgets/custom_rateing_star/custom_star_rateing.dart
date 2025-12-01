import 'package:flutter/material.dart';
import 'package:my_trainer/utils/color/app_colors.dart';

class StarRating extends StatelessWidget {
  final int rating;
  final int maxRating;
  final double size;
  final Color filledColor;
  final Color borderColor;

  const StarRating({
    super.key,
    required this.rating,
    this.maxRating = 5,
    this.size = 32,
    this.filledColor = AppColors.orangeSecondaryAccentColor,
    this.borderColor = Colors.grey,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: List.generate(maxRating, (index) {
        return Icon(
          index < rating ?Icons.star_rounded: Icons.star_outline_rounded,
          color: index < rating ? filledColor : borderColor,
          size: size,
        );
      }),
    );
  }
}
