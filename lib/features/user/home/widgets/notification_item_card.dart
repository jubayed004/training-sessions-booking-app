import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:my_trainer/utils/color/app_colors.dart';
class NotificationItem extends StatelessWidget {
  final String status;
  final String title;
  final String subtitle;
  final VoidCallback onTap;
  final bool isNew;
  const NotificationItem({
    super.key,
    required this.status,
    required this.title,
    required this.subtitle,
    required this.onTap,
    this.isNew = false,
  });

  Map<String, dynamic> _getStyleByStatus(BuildContext context, String status) {
    final statusLower = status.toLowerCase();
    if (statusLower.contains('completed')) {
      return {
        'icon': Icons.check,
        'iconBackgroundColor':  const Color(0xFFE8F5E9),
        'iconColor': const Color(0xFF43A047),
      };
    } else if (statusLower.contains('message') || statusLower.contains('new')) {
      return {
        'icon': Icons.chat_bubble_outline_rounded,
        'iconBackgroundColor':  const Color(0xFFF0F4FF),
        'iconColor': Theme.of(context).primaryColor,
      };
    } else {
      return {
        'icon': Icons.info_outline_rounded,
        'iconBackgroundColor':  Colors.grey.shade200,
        'iconColor': AppColors.grayTextSecondaryColor,
      };
    }
  }

  @override
  Widget build(BuildContext context) {
    final style = _getStyleByStatus(context, status);
    final icon = style['icon'] as IconData;
    final iconBackgroundColor = style['iconBackgroundColor'] as Color;
    final iconColor = style['iconColor'] as Color;
    return InkWell(
      onTap: onTap,
      child: Container(
        width: context.width,
        padding: EdgeInsets.symmetric(vertical: 12.h, horizontal: 16.w),
        margin: EdgeInsets.symmetric(vertical: 4.h),
        decoration: BoxDecoration(
          color: Colors.white,
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: 48.r,
              height: 48.r,
              decoration: BoxDecoration(
                color: iconBackgroundColor,
                borderRadius: BorderRadius.circular(12.r),
              ),
              child: Center(
                child: Icon(
                  icon,
                  size: 24.r,
                  color: iconColor,
                ),
              ),
            ),
            Gap(16.w),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title.tr,
                    style: context.textTheme.bodyMedium,
                    overflow: TextOverflow.ellipsis,
                  ),
                  Gap(4.h),
                  Text(
                    subtitle.tr,
                    style: context.textTheme.labelSmall
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}