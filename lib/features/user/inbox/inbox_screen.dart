import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax/iconsax.dart';
import 'package:my_trainer/core/router/route_path.dart';
import 'package:go_router/go_router.dart';
import 'package:my_trainer/utils/app_strings/app_strings.dart';
import 'package:my_trainer/utils/color/app_colors.dart';

class ChatListScreen extends StatefulWidget {
  const ChatListScreen({super.key});

  @override
  State<ChatListScreen> createState() => _ChatListScreenState();
}

class _ChatListScreenState extends State<ChatListScreen> {
  final _searchController = TextEditingController();
  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final mockChats = [
      {
        'name': 'Ann Smith',
        'message':
            'Lorem ipsum dolor sit amet consectetur. Id in diam morbi odio adipiscing egestas.',
        'time': '2:34 p.m',
        'isUnread': true,
        'imageUrl':
            'https://imgcdn.stablediffusionweb.com/2024/11/4/61652f3f-b0ec-4c62-998f-f72dac59f09d.jpg',
      },
      {
        'name': 'Ann Smith',
        'message':
            'Lorem ipsum dolor sit amet consectetur. Id in diam morbi odio adipiscing egestas.',
        'time': '2:34 p.m',
        'isUnread': true,
        'imageUrl':
            'https://imgcdn.stablediffusionweb.com/2024/11/4/61652f3f-b0ec-4c62-998f-f72dac59f09d.jpg',
      },
      {
        'name': 'Ann Smith',
        'message':
            'Lorem ipsum dolor sit amet consectetur. Id in diam morbi odio adipiscing egestas.',
        'time': '2:34 p.m',
        'isUnread': false,
        'imageUrl':
            'https://imgcdn.stablediffusionweb.com/2024/11/4/61652f3f-b0ec-4c62-998f-f72dac59f09d.jpg',
      },
      {
        'name': 'Ann Smith',
        'message':
            'Lorem ipsum dolor sit amet consectetur. Id in diam morbi odio adipiscing egestas.',
        'time': '2:34 p.m',
        'isUnread': false,
        'imageUrl':
            'https://imgcdn.stablediffusionweb.com/2024/11/4/61652f3f-b0ec-4c62-998f-f72dac59f09d.jpg',
      },
    ];
    return Scaffold(
      appBar: AppBar(
        scrolledUnderElevation: 0,
        title: Text(
          "mytrainerr.".tr,
          style: Theme.of(context).textTheme.headlineSmall?.copyWith(
            color: AppColors.appbarTextColor,
            letterSpacing: -0.5,
          ),
        ),
      ),
      // ----------------------------------------------------
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 0.h),
        child: Column(
          children: [
            Gap(8.h),
            SizedBox(
              height: 50,
              child: CupertinoSearchTextField(
                controller: _searchController,
                onSubmitted: (value) {
                  // Handle search logic
                },
                prefixIcon: Padding(
                  padding: EdgeInsets.only(left: 8.0),
                  child: Icon(
                    Iconsax.search_favorite,
                    color: AppColors.grayTextSecondaryColor,
                  ),
                ),
                placeholderStyle: context.textTheme.bodyMedium?.copyWith(
                  color: AppColors.grayTertiaryTextColor,
                ),
                placeholder: AppStrings.lookingForATrainer.tr,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: AppColors.backgroundsLinesColor,
                    width: 2,
                  ),
                  color: AppColors.backgroundColor,
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
            ),

            // ----------------------------------------------------
            Gap(16.h),

            ...mockChats.map((chat) {
              final isUnread = chat['isUnread'] as bool;
              final nameStyle = GoogleFonts.montserrat(
                fontWeight: FontWeight.w700,
                fontSize: 15.sp,
                color: AppColors.blackMainTextColor,
              );

              final messageStyle = GoogleFonts.montserrat(
                fontWeight: isUnread ? FontWeight.w600 : FontWeight.w500,
                fontSize: 13.sp,
                color: isUnread
                    ? AppColors.blackMainTextColor
                    : AppColors.grayTextSecondaryColor,
                height: 1.2,
              );

              final timeStyle = GoogleFonts.montserrat(
                fontWeight: FontWeight.w500,
                fontSize: 12.sp,
                color: AppColors.grayTextSecondaryColor,
              );

              final unreadDot = Container(
                width: 8.r,
                height: 8.r,
                margin: EdgeInsets.only(top: 4.h),
                decoration: BoxDecoration(
                  color: AppColors.tertiaryTextColor,
                  shape: BoxShape.circle,
                ),
              );

              return InkWell(
                onTap: () {
                  context.pushNamed(RoutePath.chatScreen);
                },
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: 12.h),
                  decoration: BoxDecoration(
                    border: Border(
                      bottom: BorderSide(
                        color: Colors.grey.shade200,
                        width: 1.w,
                      ),
                    ),
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      // Profile Picture
                      ClipRRect(
                        borderRadius: BorderRadius.circular(8.r),
                        child: Image.network(
                          chat['imageUrl'] as String,
                          width: 50.r,
                          height: 50.r,
                          fit: BoxFit.cover,
                        ),
                      ),
                      Gap(12.w),

                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              chat['name'] as String,
                              style: nameStyle,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                            Gap(4.h),
                            Text(
                              (chat['message'] as String).tr,
                              style: messageStyle,
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ],
                        ),
                      ),
                      Gap(10.w),

                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(chat['time'] as String, style: timeStyle),
                              Gap(8.w),
                              Icon(
                                Icons.arrow_forward_ios_rounded,
                                size: 14.r,
                                color: AppColors.grayTextSecondaryColor
                                    .withValues(alpha: 0.6),
                              ),
                            ],
                          ),
                          if (isUnread) unreadDot,
                        ],
                      ),
                    ],
                  ),
                ),
              );
            }),
            // ----------------------------------------------------
          ],
        ),
      ),
    );
  }
}
