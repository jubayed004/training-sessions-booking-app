import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class NoInternetCard extends StatelessWidget {
  const NoInternetCard({
    super.key,
    required this.onTap,
    this.title,
    this.subtitle,
    this.icon,
    this.buttonText,
    this.isList = false,
    this.iconSize = 64,
    this.buttonColor,
    this.textColor,
    this.padding,
  });

  final VoidCallback onTap;
  final String? title;
  final String? subtitle;
  final Widget? icon;
  final String? buttonText;
  final bool isList;
  final double iconSize;
  final Color? buttonColor;
  final Color? textColor;
  final EdgeInsetsGeometry? padding;

  @override
  Widget build(BuildContext context) {
    final effectiveTitle = title ?? "Oops,You re offline check your connection and give it another shot";
    final effectiveSubtitle = subtitle ?? '';
    final effectiveButtonText = buttonText ?? "Try Again";

    return Padding(
      padding: padding ?? EdgeInsets.symmetric(horizontal: 16, vertical: isList ? 8 : 32),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (!isList) const Gap(20),
            icon ??
                Icon(
                  Icons.wifi_off,
                  size: iconSize,
                  color: Colors.grey.shade600,
                ),
            const Gap(16),
            Text(
              effectiveTitle,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 14,
                color: textColor ?? Colors.black,
              ),
            ),
            if (effectiveSubtitle.isNotEmpty) ...[
              const Gap(8),
              Text(
                effectiveSubtitle,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 12,
                  color: Colors.grey.shade700,
                ),
              ),
            ],
            const Gap(20),
            ElevatedButton(
              onPressed: onTap,
              style: ElevatedButton.styleFrom(
                backgroundColor: buttonColor ?? Theme.of(context).primaryColor,
                minimumSize: Size(MediaQuery.of(context).size.width / 1.6, 44),
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(32),
                    bottomLeft: Radius.circular(32),
                  ),
                ),
              ),
              child: Text(
                effectiveButtonText,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
