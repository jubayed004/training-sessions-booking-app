import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:my_trainer/features/user/bookings/widgets/remaining_sessions_card.dart';
import 'package:my_trainer/features/user/bookings/widgets/reschedule_modal_bottom_sheet.dart';
import 'package:my_trainer/features/user/bookings/widgets/reschedule_session_bottom_sheet.dart';
import 'package:my_trainer/features/user/bookings/widgets/review_bottom_sheet.dart';
import 'package:my_trainer/features/user/bookings/widgets/session_card.dart';
import 'package:my_trainer/share/widgets/button/custom_button.dart';
import 'package:my_trainer/utils/app_strings/app_strings.dart';
import 'package:my_trainer/utils/color/app_colors.dart';

class BookingsScreen extends StatefulWidget {
  const BookingsScreen({super.key});

  @override
  State<BookingsScreen> createState() => _BookingsScreenState();
}

class _BookingsScreenState extends State<BookingsScreen>
    with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    final tabController = TabController(length: 3, vsync: this);
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "mytrainerr.".tr,
          style: Theme.of(context).textTheme.headlineSmall?.copyWith(
            color: isDarkMode ? Colors.white : Color(0xFFE94E6C),
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
                  vertical: 8.0,
                  horizontal: 16,
                ),
                child: Column(
                  children: [
                    RemainingSessionsCard(
                      trainerName: 'Ann Smith',
                      trainerImageUrl:
                          'https://cdn.shopify.com/s/files/1/0098/8822/files/images-SoftSculptSportsBraNEWGSRichMaroonB5B9N_NBZQ_1880_V2_3840x.jpg?v=1760626378',
                      sessionsRemaining: 8,
                      totalSessions: 10,
                      onChatPressed: () {},
                      isVerified: true,
                    ),
                    Gap(12),
                    CustomButton(onTap: () {}, text: "Book Your Next Session"),
                    Gap(24),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: TabBar(
                        controller: tabController,
                        labelColor: AppColors.primaryColor,
                        labelStyle: context.textTheme.titleMedium,
                        //labelPadding: EdgeInsets.only(left: 0,right: 20),
                        //isScrollable: true,
                        //automaticIndicatorColorAdjustment: false,
                        unselectedLabelColor: AppColors.grayTertiaryTextColor,
                        indicatorColor: Colors.transparent,
                        unselectedLabelStyle: context.textTheme.bodyLarge,
                        dividerColor: Colors.transparent,
                        tabs: [
                          Text("upcoming"),
                          Text("past"),
                          Text("canceled"),
                        ],
                      ),
                    ),
                    Gap(24),
                    SizedBox(
                      width: double.maxFinite,
                      height: context.height,
                      child: TabBarView(
                        controller: tabController,
                        children: [
                          ListView.builder(
                            itemCount: 10,
                            itemBuilder: (_, index) {
                              return SessionCardWidgets(
                                name: 'Ann Smith',
                                age: 26,
                                rating: 4.9,
                                trainerImageUrl:
                                    'https://rare-gallery.com/thumbs/887958-Fitness-Gym-Workout-Legs.jpg',
                                mainActivity: 'Yoga',
                                moreActivitiesCount: 1,
                                dateTime: '21-10-2025 7:00 p.m',
                                location: 'e.g. B. Berlin or “Peak Fit...”',
                                statusText: 'Confirmed',
                                onReschedulePressed: () =>
                                    showRescheduleDateModal(
                                      context,
                                      sessionId:
                                          8, // Pass the actual session ID
                                      currentTrainerName: "Jubayed Islam",
                                    ),
                                onCancelPressed: () {
                                  showRescheduleModal(
                                    context,
                                    title: 'Hey!'.tr,
                                    message:
                                        'Are you sure you want to cancel? This action cannot be undone.'
                                            .tr,
                                    confirmButtonText: 'Proceed anyway'.tr,
                                    onConfirm: () {},
                                  );
                                },
                              );
                            },
                          ),
                          ListView.builder(
                            itemCount: 10,
                            itemBuilder: (_, index) {
                              return SessionCardWidgets(
                                name: 'Ann Smith',
                                age: 26,
                                rating: 4.9,
                                trainerImageUrl:
                                    'https://imgcdn.stablediffusionweb.com/2024/10/26/65f0f0ab-bf9f-4514-82a0-e8ef8558d88e.jpg',
                                mainActivity: 'Yoga',
                                moreActivitiesCount: 1,
                                dateTime: '20-10-2025 6:00 p.m',
                                location: 'e.g. B. Berlin or “Peak Fit...”',
                                statusText: 'Completed',
                                onReschedulePressed: () => print(
                                  'Completed Reschedule (as alternative)',
                                ),
                                onReviewPressed: () => showReviewModal(
                                  context,
                                  trainerName: 'Ann Smith',
                                  trainerAge: 26,
                                  trainerRating: 4.9,
                                  trainerImageUrl:
                                      'https://cdn.shopify.com/s/files/1/0723/5334/9921/files/Woman_performing_crunches_beginners_gym_workout_female_weight_loss_1024x1024.webp?v=1699803979',
                                  activities: const [
                                    'Yoga',
                                    'Stretching',
                                    'Pilates',
                                  ],
                                  onSubmitReview: () {
                                    print('Review Submitted!');
                                  },
                                ),
                                onCancelPressed: null,
                              );
                            },
                          ),
                          /*ListView.builder(
                                     itemCount: 10,
                                     itemBuilder: (_,index){
                                       return SessionCardWidgets(
                                         name: 'Ann Smith',
                                         age: 26,
                                         rating: 4.9,
                                         trainerImageUrl: 'https://cdn.shopify.com/s/files/1/0723/5334/9921/files/Woman_performing_crunches_beginners_gym_workout_female_weight_loss_1024x1024.webp?v=1699803979', // Replace with actual URL/path
                                         mainActivity: 'Yoga',
                                         moreActivitiesCount: 1,
                                         dateTime: '21-10-2025 7:00 p.m',
                                         location: 'e.g. B. Berlin or “Peak Fit...”',
                                         statusText: 'Completed',
                                         // Example usage in MyBookingsScreen:

                                         onReschedulePressed: () {

                                           showRescheduleDateModal(
                                               context,
                                               sessionId: 8, // Pass the actual session ID
                                               currentTrainerName: "Jubayed Islam",
                                             );

                                         },

                                         onCancelPressed: null,
                                       );
                                     }
                                 ),*/
                          ListView.builder(
                            itemCount: 10,
                            itemBuilder: (_, index) {
                              return SessionCardWidgets(
                                name: 'Ann Smith',
                                age: 26,
                                rating: 4.9,
                                trainerImageUrl:
                                    'https://rare-gallery.com/thumbs/887958-Fitness-Gym-Workout-Legs.jpg',
                                mainActivity: 'Yoga',
                                moreActivitiesCount: 1,
                                dateTime: '21-10-2025 7:00 p.m',
                                location: 'e.g. B. Berlin or “Peak Fit...”',
                                statusText: 'Confirmed',
                                outlinedButtonText: "Canceled  by trainer",
                                onReschedulePressed: () =>
                                    showRescheduleDateModal(
                                      context,
                                      sessionId:
                                          8, // Pass the actual session ID
                                      currentTrainerName: "Jubayed Islam",
                                    ),

                                /*showRescheduleModal(
                                        */
                                /*  context,
                                          title: AppStrings.hey.tr,
                                          message: AppStrings.cancellationsLessThan12Hours.tr,
                                          confirmButtonText: 'Cancel & Reschedule'.tr,
                                          onConfirm: () {

                                          },*/
                                /*

                                        ),*/
                                onCancelPressed: () {
                                  /*     showRescheduleModal(
                                            context,
                                            title: 'Hey!'.tr,
                                            message: 'Are you sure you want to cancel? This action cannot be undone.'.tr,
                                            confirmButtonText: 'Proceed anyway'.tr,
                                            onConfirm: () {
                                              // Call your controller method here after user confirms
                                              // controller.cancelSession(sessionId);
                                              Get.snackbar('Action', 'Cancellation confirmed and processing.');
                                            },
                                          );*/
                                },
                              );
                            },
                          ),
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
