import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:my_trainer/features/trainers/calender/widgets/calendar_tab_view.dart';
import 'package:my_trainer/utils/color/app_colors.dart';
import 'package:my_trainer/utils/extension/base_extension.dart';
import 'widgets/cancel_bottom_sheet.dart';
import 'widgets/list_sub_tab.dart';
import 'controller/calender_controller.dart';

class CalenderScreen extends GetView<CalenderController> {
  const CalenderScreen({super.key});

  Widget buildListTab(BuildContext context, bool isDarkMode) {
    return Column(
      children: [
        Row(
          children: [
            ListSubTab(
              label: "upcoming",
              index: 0,
              selectedIndex: controller.selectedListTab.value,
              isDarkMode: isDarkMode,
              onTap: controller.changeListTab,
            ),
            ListSubTab(
              label: "past",
              index: 1,
              selectedIndex: controller.selectedListTab.value,
              isDarkMode: isDarkMode,
              onTap: controller.changeListTab,
            ),
            ListSubTab(
              label: "cancelled",
              index: 2,
              selectedIndex: controller.selectedListTab.value,
              isDarkMode: isDarkMode,
              onTap: controller.changeListTab,
            ),
          ],
        ),
        Gap(16),
        Expanded(
          child: Obx(() {
            List<Map<String, dynamic>> appointments;
            if (controller.selectedListTab.value == 1) {
              appointments = controller.pastAppointments;
            } else if (controller.selectedListTab.value == 2) {
              appointments = controller.cancelledAppointments;
            } else {
              appointments = controller.upcomingAppointments;
            }

            return ListView.builder(
              itemCount: appointments.length,
              itemBuilder: (context, index) {
                return _buildAppointmentCard(
                  context,
                  appointments[index],
                  isDarkMode,
                );
              },
            );
          }),
        ),
      ],
    );
  }

  Widget _buildAppointmentCard(
    BuildContext context,
    Map<String, dynamic> appointment,
    bool isDarkMode,
  ) {
    bool isPast = controller.selectedListTab.value == 1;
    bool isCancelled = controller.selectedListTab.value == 2;

    return Container(
      margin: EdgeInsets.only(bottom: 10),
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: isDarkMode
            ? AppColors.blackMainTextColor.withOpacity(0.1)
            : Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 4,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CircleAvatar(
            radius: 28,
            backgroundImage: NetworkImage(appointment['image']),
          ),
          Gap(12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "${appointment['name']}, ${appointment['age']}",
                      style: GoogleFonts.montserrat(
                        fontWeight: FontWeight.w800,
                        fontSize: 15.sp,
                        color: isDarkMode
                            ? AppColors.white
                            : AppColors.blackMainTextColor,
                      ),
                    ),
                    if (isPast)
                      Text(
                        "Complete",
                        style: GoogleFonts.montserrat(
                          fontSize: 13.sp,
                          color: AppColors.primaryColor,
                          fontWeight: FontWeight.w600,
                        ),
                      )
                    else if (!isCancelled)
                      Text(
                        "Confirm",
                        style: GoogleFonts.montserrat(
                          fontSize: 13.sp,
                          color: AppColors.primaryColor,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                  ],
                ),
                Gap(4),
                Row(
                  children: [
                    Icon(
                      Icons.calendar_today,
                      size: 14,
                      color: AppColors.grayTertiaryTextColor,
                    ),
                    Gap(6),
                    Text(
                      appointment['date'],
                      style: GoogleFonts.montserrat(
                        fontSize: 13.sp,
                        color: AppColors.grayTertiaryTextColor,
                      ),
                    ),
                  ],
                ),
                Gap(4),
                Row(
                  children: [
                    Icon(
                      Icons.location_on,
                      size: 14,
                      color: AppColors.grayTertiaryTextColor,
                    ),
                    Gap(6),
                    Expanded(
                      child: Text(
                        appointment['location'],
                        style: GoogleFonts.montserrat(
                          fontSize: 13.sp,
                          color: AppColors.grayTertiaryTextColor,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
                Gap(12),
                if (isPast)
                  OutlinedButton(
                    onPressed: () {},
                    child: Text(
                      "See Review",
                      style: GoogleFonts.montserrat(
                        fontSize: 14.sp,
                        color: isDarkMode
                            ? AppColors.white
                            : AppColors.blackMainTextColor,
                      ),
                    ),
                  )
                else if (!isCancelled)
                  Row(
                    children: [
                      Expanded(
                        child: OutlinedButton(
                          onPressed: () {
                            showModalBottomSheet(
                              context: context,
                              isScrollControlled: true,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.vertical(
                                  top: Radius.circular(20),
                                ),
                              ),
                              builder: (context) => CancelBottomSheet(
                                appointment: appointment,
                                isDarkMode: isDarkMode,
                              ),
                            );
                          },

                          child: Text(
                            "Cancel",
                            style: GoogleFonts.montserrat(
                              fontSize: 14.sp,
                              color: isDarkMode
                                  ? AppColors.white
                                  : AppColors.blackMainTextColor,
                            ),
                          ),
                        ),
                      ),
                      Gap(10),
                      Expanded(
                        child: ElevatedButton(
                          onPressed: () {},
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.message,
                                size: 16,
                                color: Colors.white,
                              ),
                              Gap(6),
                              Text(
                                "message",
                                style: GoogleFonts.montserrat(
                                  fontSize: 14.sp,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
              ],
            ),
          ),
        ],
      ),
    );
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
          style: context.headlineSmall.copyWith(
            color: AppColors.appbarTextColor,
            letterSpacing: -0.5,
          ),
        ),
      ),
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16.0,
                  vertical: 16,
                ),
                child: Column(
                  children: [
                    Align(
                      alignment: Alignment.centerLeft,
                      child: TabBar(
                        controller: controller.tabController,
                        labelColor: AppColors.primaryColor,
                        labelStyle: context.titleLarge,
                        unselectedLabelColor: AppColors.grayTertiaryTextColor,
                        indicatorColor: AppColors.blackMainTextColor,
                        dividerHeight: 1,
                        unselectedLabelStyle: context.titleLarge,
                        dividerColor: Colors.transparent,
                        tabs: [Text("Calendar"), Text("List")],
                      ),
                    ),
                    Gap(16),
                    SizedBox(
                      height: context.screenHeight * 0.75,
                      child: TabBarView(
                        controller: controller.tabController,
                        children: [
                          // Calendar tab
                          CalendarTabView(),
                          // List view tab
                          buildListTab(context, isDarkMode),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
