import 'package:easy_date_timeline/easy_date_timeline.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax/iconsax.dart';
import 'package:my_trainer/core/custom_assets/assets.gen.dart';
import 'package:my_trainer/share/widgets/align/custom_align_text.dart';
import 'package:my_trainer/utils/app_strings/app_strings.dart';
import 'package:my_trainer/utils/color/app_colors.dart';
import 'package:my_trainer/utils/extension/base_extension.dart';

class TrainerHomeScreen extends StatefulWidget {
  const TrainerHomeScreen({super.key});

  @override
  State<TrainerHomeScreen> createState() => _TrainerHomeScreenState();
}


class _TrainerHomeScreenState extends State<TrainerHomeScreen> {
  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: AppBar(
        scrolledUnderElevation: 0,
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(
          "mytrainerr.",
          style: context.headlineSmall.copyWith(color:  AppColors.appbarTextColor, letterSpacing: -0.5),
        ),

        actions: [
          Container(
            margin: EdgeInsets.only(right: 16),
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(30),
                border: Border.all(color: AppColors.linesDarkColor,width: 1)
            ),
            child: Icon(Iconsax.notification_bing),
          ),
        ]

      ),
      body:SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16),
                child: Column(
                  children: [
                    CustomAlignText(
                      text: "Hello, Alex!",
                      style: GoogleFonts.montserrat(
                        fontWeight: FontWeight.w800,
                        fontSize: 24.sp,
                        color: isDarkMode ? AppColors.white : AppColors.blackMainTextColor,
                      ),
                    ),
                    Gap(12),
                    EasyDateTimeLine(
                      initialDate: DateTime.now(),
                      onDateChange: (selectedDate) {
                        // `selectedDate` the new date selected.
                      },
                      dayProps: const EasyDayProps(
                        borderColor: AppColors.redColor,
                        inactiveDayStyle: DayStyle(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.all(Radius.circular(40)),
                          ),
                        ),
                        activeDayStyle: DayStyle(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(40)),
                            color: AppColors.primaryColor,
                          ),
                        ),
                      ),
                    ),
                    Gap(12),
                    Column(
                      children: List.generate(2, (_) {
                        return Card(
                          color: Colors.white,
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Row(
                              spacing: 16,
                              children: [
                                Text(
                                  "10:00",
                                  style: GoogleFonts.montserrat(
                                    fontWeight: FontWeight.w800,
                                    fontSize: 14.sp,
                                    color: isDarkMode ? AppColors.white : AppColors.blackMainTextColor,
                                  ),
                                ),
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(20),
                                  child: SizedBox(
                                    width: 40.w,
                                    height: 40.h,
                                    child: Assets.images.upcomeingsessionimage.image(),
                                  ),
                                ),
                                Text(
                                  "Ann Smith",
                                  style: GoogleFonts.montserrat(
                                    fontWeight: FontWeight.w800,
                                    fontSize: 14.sp,
                                    color: isDarkMode ? AppColors.white : AppColors.blackMainTextColor,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      }),
                    ),
                    Gap(16),
                    Row(
                      spacing: 6,
                      children: [
                        Text(
                          "New activity",
                          style: GoogleFonts.montserrat(
                            fontWeight: FontWeight.w800,
                            fontSize: 14.sp,
                            color: isDarkMode ? AppColors.white : AppColors.blackMainTextColor,
                          ),
                        ),
                        CircleAvatar(
                          backgroundColor: AppColors.primaryColor,
                          radius: 14,
                          child: Text(
                            "2",
                            style: GoogleFonts.montserrat(
                              fontWeight: FontWeight.w800,
                              fontSize: 14.sp,
                              color: AppColors.white,
                            ),
                          ),
                        ),
                      ],
                    ),

                  ],
                ),
              ),
            ),

            SliverList(
              delegate: SliverChildBuilderDelegate(
                    (context, index) {
                  return Container(
                    margin: EdgeInsets.only(left: 16,bottom: 8,right: 16),
                    padding: EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      border: Border.all(color: AppColors.linesDarkColor, width: 1),
                      borderRadius: BorderRadius.circular(20),
                      color: AppColors.white,
                    ),
                    child: Row(
                      spacing: 16,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: SizedBox(
                            width: 56.w,
                            height: 56.h,
                            child: Assets.images.upcomeingsessionimage.image(),
                          ),
                        ),
                        Column(
                          spacing: 10,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Ann Smith",
                              style: GoogleFonts.montserrat(
                                fontWeight: FontWeight.w800,
                                fontSize: 14.sp,
                                color: isDarkMode ? AppColors.white : AppColors.blackMainTextColor,
                              ),
                            ),
                            Text(
                              "Want to book a HIIT session",
                              style: context.labelSmall,
                            ),
                            FilledButton(
                              style: ButtonStyle(
                                backgroundColor: WidgetStateProperty.all(AppColors.primaryColor),
                              ),
                              onPressed: () {},
                              child: Row(
                                children: [
                                  Assets.icons.messages.svg(
                                    colorFilter: ColorFilter.mode(AppColors.white, BlendMode.srcIn),
                                  ),
                                  Text(
                                    AppStrings.message.tr,
                                    style: context.titleSmall.copyWith(color: Colors.white),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  );
                },
                childCount: 10, // 10 items in the list
              ),
            ),
          ],
        ),
      )


    );
  }
}
