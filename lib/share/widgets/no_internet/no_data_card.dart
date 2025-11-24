import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class NoDataCard extends StatelessWidget {
  const NoDataCard({
    super.key,
    required this.onTap,
    this.title,
    this.subtitle,
    this.icon,
    this.image,
    this.isList = false,
    this.buttonText,
    this.iconColor,
    this.textColor,
    this.padding,
    this.iconSize = 64,
  });

  final VoidCallback onTap;
  final String? title;
  final String? subtitle;
  final IconData? icon;
  final Widget? image;
  final bool isList;
  final String? buttonText;
  final Color? iconColor;
  final Color? textColor;
  final EdgeInsetsGeometry? padding;
  final double iconSize;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    final effectiveTitle = title ?? "No items found";
    final effectiveSubtitle = subtitle ?? "The list is currently empty";

    return Padding(
      padding: padding ??
          EdgeInsets.symmetric(
            horizontal: 16,
            vertical: isList ? 12 : 48,
          ),
      child: Center(
        child: Column(
          mainAxisAlignment:
          isList ? MainAxisAlignment.center : MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            if (!isList) const Gap(12),

            if (image != null)
              SizedBox(
                height: iconSize * 1.8,
                width: iconSize * 1.8,
                child: image,
              )
            else
              Icon(
                icon ?? Icons.inbox_outlined,
                size: iconSize,
                color: iconColor ?? theme.colorScheme.primary.withValues(alpha: 0.7),
              ),

            const Gap(16),

            Text(
              effectiveTitle,
              textAlign: TextAlign.center,
              style: theme.textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.w600,
                fontSize: isList ? 16 : 20,
                color: textColor ?? theme.colorScheme.onSurface,
              ),
            ),

            const Gap(8),

            Text(
              effectiveSubtitle,
              textAlign: TextAlign.center,
              style: theme.textTheme.bodyMedium?.copyWith(
                color: theme.colorScheme.onSurface.withValues(alpha: 0.7),
              ),
            ),

            const Gap(20),
            if (buttonText != null)
              ElevatedButton.icon(
                onPressed: onTap,
                icon: const Icon(Icons.refresh_rounded, size: 18),
                label: Text(buttonText!),
                style: ElevatedButton.styleFrom(
                  backgroundColor: theme.colorScheme.primary,
                  foregroundColor: theme.colorScheme.onPrimary,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                  padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 10),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
