import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_trainer/core/custom_assets/assets.gen.dart';
import 'package:my_trainer/utils/color/app_colors.dart';
import 'package:my_trainer/utils/extension/base_extension.dart';
import 'package:flutter_calenders/flutter_calenders.dart';

class CalenderScreen extends StatefulWidget {
  const CalenderScreen({super.key});

  @override
  State<CalenderScreen> createState() => _CalenderScreenState();
}

class _CalenderScreenState extends State<CalenderScreen> with TickerProviderStateMixin {
  final List<Map<String, dynamic>> timeSlots = [
    {
      "time": "09:00 - 10:00",
      'name': 'Jubayed Islam',
      'status': 'Available',
      'hasMessage': true,
    },
    {
      'time': '10:10 - 11:10',
      'name': 'Jon Dhone',
      'status': 'Available',
      'hasMessage': false,
    },
    {
      'time': '09:00 - 10:00',
      'name': 'Ann Smith',
      'status': 'Available',
      'hasMessage': true,
    },
    {
      'time': '10:10 - 11:10',
      'name': 'Jon Dhone',
      'status': 'Available',
      'hasMessage': false,
    },
    {
      'time': '10:10 - 11:10',
      'name': 'Jon Dhone',
      'status': 'Available',
      'hasMessage': false,
    },
    {
      'time': '10:10 - 11:10',
      'name': 'Jon Dhone',
      'status': 'Available',
      'hasMessage': false,
    },
    {
      'time': '10:10 - 11:10',
      'name': 'Jon Dhone',
      'status': 'Available',
      'hasMessage': false,
    },
    {
      'time': '10:10 - 11:10',
      'name': 'Jon Dhone',
      'status': 'Available',
      'hasMessage': false,
    },
    {
      'time': '10:10 - 11:10',
      'name': 'Jon Dhone',
      'status': 'Available',
      'hasMessage': false,
    },

  ];

  late TabController tabController;

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

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
          style: context.headlineSmall.copyWith(color: AppColors.appbarTextColor, letterSpacing: -0.5),
        ),
      ),
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16),
                child: Column(
                  children: [
                    Align(
                      alignment: Alignment.centerLeft,
                      child: TabBar(
                        controller: tabController,
                        labelColor: AppColors.primaryColor,
                        labelStyle: context.titleLarge,
                        unselectedLabelColor: AppColors.grayTertiaryTextColor,
                        indicatorColor: AppColors.blackMainTextColor,
                        dividerHeight: 1,
                        unselectedLabelStyle: context.titleLarge,
                        dividerColor: Colors.transparent,
                        tabs: [
                          Text("Calendar"),
                          Text("List"),
                        ],
                      ),
                    ),
                    Gap(16),

                    SizedBox(
                      height: context.screenHeight/2-92,
                      child: TabBarView(
                        controller: tabController,
                        children: [
                          Column(
                            children: [
                              EventBasedCalender(
                                padding: EdgeInsets.all(10),
                                primaryColor: AppColors.tertiaryTextColor,
                                backgroundColor: Colors.white,
                                chooserColor: AppColors.blackMainTextColor,
                                endYear: 3000,
                                startYear: 1990,
                                currentMonthDateColor: Colors.black,
                                pastFutureMonthDateColor: Colors.grey,
                                isSelectedColor: AppColors.primaryColor,
                                onDateTap: (date) {
                                  print(date);
                                },
                                events: [],
                              ),
                              Gap(16),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Tuesday, December 26th",
                                    style: GoogleFonts.montserrat(
                                      fontWeight: FontWeight.w800,
                                      fontSize: 14.sp,
                                      color: isDarkMode ? AppColors.white : AppColors.blackMainTextColor,
                                    ),
                                  ),
                                  Text(
                                    "Edit",
                                    style: context.titleSmall,
                                  ),
                                ],
                              ),
                              Gap(16),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SliverList(
              delegate: SliverChildBuilderDelegate(
                    (context, index) {
                  var slot = timeSlots[index];
                  return Container(
                    padding: EdgeInsets.only(right: 6,left: 12,top: 6,bottom: 6),
                    margin: EdgeInsets.only(bottom: 8,left: 16,right: 16),
                    decoration: BoxDecoration(
                      color: /*index % 2 == 0 ? Color(0xFFE6F8FF) :*/ Colors.white,
                      borderRadius: BorderRadius.circular(16),

                    ),
                    child: Row(
                      spacing: 10,
                      children: [
                        slot['hasMessage'] ?  Text(slot['time'],
                        style: GoogleFonts.montserrat(
                          fontWeight: FontWeight.w800,
                          fontSize: 14.sp,
                          color: isDarkMode ? AppColors.white : AppColors.blackMainTextColor,
                        ),
                        ):Text(slot['time'],
                          style: GoogleFonts.montserrat(
                            fontWeight: FontWeight.w800,
                            fontSize: 14.sp,
                            color: isDarkMode ? AppColors.white : AppColors.primaryColor,
                          ),
                        ),
                        slot['hasMessage'] ?Container(
                          padding: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            color: Color(0xFFE2F8F8),
                            borderRadius: BorderRadius.circular(20),

                          ),
                          child: Row(
                             spacing: 36.w,
                            children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(20),
                                  child: Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                    width: 30.w,
                                    height: 30.h,
                                    child: Assets.images.upcomeingsessionimage.image(),
                                  ),
                                ),

                            Text("Ann Smith",style: GoogleFonts.montserrat(
                                  fontWeight: FontWeight.w800,
                                  fontSize: 14.sp,
                                  color: isDarkMode ? AppColors.white : AppColors.blackMainTextColor,
                                ),),

                              GestureDetector(
                                onTap: (){},
                                child: CircleAvatar(
                                  radius: 20,
                                  backgroundColor: AppColors.primaryColor,
                                  child: Center(
                                    child:   Assets.icons.messages.svg(colorFilter: ColorFilter.mode(AppColors.white,BlendMode.srcIn )),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ): SizedBox(
                          width: context.screenWidth * 0.6+20,
                          child: Container(
                            padding: EdgeInsets.all(8),
                            decoration: BoxDecoration(
                              color: Color(0xFFE2F8F8),
                              borderRadius: BorderRadius.circular(20),

                            ),
                            child: Text("Available",style: GoogleFonts.montserrat(
                              fontWeight: FontWeight.w800,
                              fontSize: 14.sp,
                              color: isDarkMode ? AppColors.white : AppColors.primaryColor,
                            ),),
                          ),
                        )
                      ],
                    )

                    /*ListTile(
                      contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                      leading: CircleAvatar(
                        radius: 20,
                        backgroundImage: slot['name'] == 'Ann Smith'
                            ? AssetImage('assets/ann_smith.jpg') as ImageProvider // Ensure this asset exists in your assets directory
                            : null, // No image for "Available"
                        backgroundColor: Colors.grey,
                      ),
                      title: Row(
                        children: [
                          Text(
                            slot['time'],
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(width: 8),
                          if (slot['name'] != 'Available')
                            Text(
                              slot['name'],
                              style: TextStyle(fontSize: 14, color: Colors.black.withValues(alpha: 0.6)),
                            ),
                        ],
                      ),
                      subtitle: Row(
                        children: [
                          Text(
                            slot['status'],
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.green,
                            ),
                          ),
                          Spacer(),
                          slot['hasMessage'] ?IconButton(
                            icon: Icon(
                              Icons.message,
                              color: slot['hasMessage'] ? Colors.blue : Colors.grey,
                            ),
                            onPressed: () {
                              print("Message icon tapped for slot $index");
                            },
                          ): SizedBox(),
                        ],
                      ),
                    ),*/
                  );
                },
                childCount: timeSlots.length,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
