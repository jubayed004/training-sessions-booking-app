/*
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:my_trainer/utils/color/app_colors.dart';

class ErrorCard extends StatelessWidget {
  const ErrorCard({
    super.key,
    required this.onTap,
    this.title,
    this.message,
    this.buttonText,
    this.icon,
    this.iconColor,
    this.showIcon = true,
    this.showShadow = false,
  });

  final VoidCallback onTap;
  final String? title;
  final String? message;
  final String? buttonText;
  final IconData? icon;
  final Color? iconColor;
  final bool showIcon;
  final bool showShadow;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Center(
      child: Container(
        margin: const EdgeInsets.all(18),
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 28),
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(16),
          boxShadow: showShadow ? [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.05),
              blurRadius: 12,
              offset: const Offset(0, 4),
            ),
          ] : [],
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (showIcon)
              Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: (iconColor ?? AppColors.errorColor).withOpacity(0.15),
                ),
                padding: const EdgeInsets.all(14),
                child: Icon(
                  icon ?? Icons.error_outline,
                  color: iconColor ?? AppColors.errorColor,
                  size: 42,
                ),
              ),
            const Gap(16),
            Text(
              title ?? "Something went wrong",
              textAlign: TextAlign.center,
              style: theme.textTheme.titleLarge?.copyWith(
                fontWeight: FontWeight.w700,
                color: AppColors.black,
              ),
            ),
            const Gap(8),
            Text(
              message ??
                  "The application has encountered an unknown error.\nPlease try again later.",
              textAlign: TextAlign.center,
              style: theme.textTheme.bodyMedium?.copyWith(
                color: AppColors.secondaryText,
                height: 1.4,
              ),
            ),
            const Gap(24),
            ElevatedButton(
              onPressed: onTap,
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.brandHoverColor,
                minimumSize: const Size(140, 44),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              child: Text(
                buttonText ?? "Try Again",
                style: theme.textTheme.labelLarge?.copyWith(
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
*/
