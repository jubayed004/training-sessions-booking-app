import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_trainer/core/router/routes.dart';
import 'package:my_trainer/share/widgets/button/custom_button.dart';
import 'package:my_trainer/share/widgets/network_image/custom_network_image.dart'; // Assumed component
import 'package:my_trainer/utils/app_strings/app_strings.dart';
import 'package:my_trainer/utils/color/app_colors.dart';
import 'package:my_trainer/utils/extension/base_extension.dart';

Widget makeDismissable({required Widget child}) => GestureDetector(
  behavior: HitTestBehavior.opaque,
  onTap: () => AppRouter.route.pop(),
  child: GestureDetector(onTap: () {}, child: child),
);

void showReviewModal(BuildContext context, {
  required String trainerName,
  required int trainerAge,
  required double trainerRating,
  required String trainerImageUrl,
  required List<String> activities,
  required VoidCallback onSubmitReview
}) {
  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    backgroundColor: Colors.transparent,
    builder: (BuildContext context) {
      return ReviewBottomSheet(
        trainerName: trainerName,
        trainerAge: trainerAge,
        trainerRating: trainerRating,
        trainerImageUrl: trainerImageUrl,
        activities: activities,
        onSubmitReview: onSubmitReview,
      );
    },
  );
}
// ---------------------------------------------
class ReviewBottomSheet extends StatefulWidget {
  final String trainerName;
  final int trainerAge;
  final double trainerRating;
  final String trainerImageUrl;
  final List<String> activities;
  final VoidCallback onSubmitReview;

  const ReviewBottomSheet({
    super.key,
    required this.trainerName,
    required this.trainerAge,
    required this.trainerRating,
    required this.trainerImageUrl,
    required this.activities,
    required this.onSubmitReview,
  });

  @override
  State<ReviewBottomSheet> createState() => _ReviewBottomSheetState();
}

class _ReviewBottomSheetState extends State<ReviewBottomSheet> {
  double _currentRating = 4.0;
  final int _maxReviewLength = 500;
  final TextEditingController _reviewController = TextEditingController();

  @override
  void dispose() {
    _reviewController.dispose();
    super.dispose();
  }

  Widget _buildActivityChip(BuildContext context, String text) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    final infoTextColor = isDarkMode ? AppColors.white : AppColors.grayTextSecondaryColor;

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
      decoration: BoxDecoration(
        color: AppColors.grayTextSecondaryColor.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(8.r),
      ),
      child: Text(
        text,
        style: GoogleFonts.montserrat(
          fontWeight: FontWeight.w500,
          fontSize: 12.sp,
          color: infoTextColor,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    final primaryTextColor = isDarkMode ? AppColors.white : AppColors.blackMainTextColor;

    final mainActivity = widget.activities.isNotEmpty ? widget.activities[0] : '';
    final secondaryActivity = widget.activities.length > 1 ? widget.activities[1] : '';
    final moreActivitiesCount = widget.activities.length > 2 ? widget.activities.length - 2 : 0;

    return makeDismissable(
      child: DraggableScrollableSheet(
        initialChildSize: 0.75,
        minChildSize: 0.5,
        maxChildSize: 0.95,
        builder: (_, controller) => Container(
          decoration: BoxDecoration(
            color: Theme.of(context).scaffoldBackgroundColor,
            borderRadius: BorderRadius.vertical(
              top: Radius.circular(30.r),
            ),
          ),
          child: Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  controller: controller,
                  padding: EdgeInsets.only(top: 24.h),
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 24.w),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  AppStrings.leaveAReview.tr,
                                  style: GoogleFonts.montserrat(
                                    fontWeight: FontWeight.w800,
                                    fontSize: 20.sp,
                                    color: primaryTextColor,
                                  ),
                                ),
                                Gap(4.h),
                                Text(
                                  '${AppStrings.rateYourSessionWith.tr} ${widget.trainerName}.'.tr,
                                  style: context.bodySmall
                                ),
                              ],
                            ),
                            IconButton(
                              icon: Icon(Icons.close, size: 24.r, color: primaryTextColor),
                              onPressed: () => AppRouter.route.pop(),
                            ),
                          ],
                        ),
                        Gap(24.h),
                        Container(
                          width: 1.sw,
                          padding: EdgeInsets.all(12.w),
                          decoration: BoxDecoration(
                            color: isDarkMode ? AppColors.blackMainTextColor : Colors.white,
                            borderRadius: BorderRadius.circular(16.r),
                            border: Border.all(color: Colors.grey.shade200.withValues(alpha:  isDarkMode ? 0.1 : 1), width: 1),
                          ),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              CustomNetworkImage(
                                height: 60.r,
                                width: 60.r,
                                imageUrl: widget.trainerImageUrl,
                                borderRadius: BorderRadius.circular(12.r),
                                fit: BoxFit.cover,
                              ),
                              Gap(12.w),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      children: [
                                        Text(
                                          '${widget.trainerName}, ${widget.trainerAge}',
                                          style: GoogleFonts.montserrat(
                                            fontWeight: FontWeight.w800,
                                            fontSize: 14.sp,
                                            color: primaryTextColor,
                                          ),
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                        // Rating Star
                                        Row(
                                          children: [
                                            Text(
                                              widget.trainerRating.toStringAsFixed(1),
                                              style: context.titleSmall,
                                            ),
                                            Gap(4.w),
                                            Icon(Icons.star, color: AppColors.orangeSecondaryAccentColor, size: 16.r),
                                          /*  Gap(8.w),
                                            Icon(Iconsax.edit, size: 20.r, color: AppColors.grayTextSecondaryColor),*/
                                          ],
                                        ),
                                      ],
                                    ),
                                    Gap(4.h),
                                    Wrap(
                                      spacing: 6.w,
                                      runSpacing: 4.h,
                                      children: [
                                        if (mainActivity.isNotEmpty) _buildActivityChip(context, mainActivity),
                                        if (secondaryActivity.isNotEmpty) _buildActivityChip(context, secondaryActivity),
                                        if (moreActivitiesCount > 0) _buildActivityChip(context, '+${moreActivitiesCount} more'),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        Gap(32.h),
                        Center(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: List.generate(5, (index) {
                              return GestureDetector(
                                onTap: () {
                                  setState(() {
                                    _currentRating = (index + 1).toDouble();
                                  });
                                },
                                child: Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 4.w),
                                  child: Icon(
                                    index < _currentRating.round() ? Icons.star : Icons.star_border,
                                    size: 48.r,
                                    color: index < _currentRating.round() ? AppColors.orangeSecondaryAccentColor : Colors.grey.shade400,
                                  ),
                                ),
                              );
                            }),
                          ),
                        ),
                        Gap(32.h),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            TextField(
                              controller: _reviewController,
                              maxLines: 5,
                              maxLength: _maxReviewLength,
                              style: context.bodyMedium,
                              decoration: InputDecoration(
                                hintText: 'Your review...'.tr,
                                hintStyle: context.bodyMedium.copyWith(color: AppColors.grayTextSecondaryColor),
                                border: InputBorder.none,
                                contentPadding: EdgeInsets.only(left: 20,top: 20,right: 20,bottom: 20),
                                counterText: '',
                              ),
                              onChanged: (text) => setState(() {}),
                            ),
                            Gap(4.h),
                            // Character Counter
                            Text(
                              '${_reviewController.text.length}/$_maxReviewLength',
                              style:context.bodyMedium,
                            ),
                          ],
                        ),
                        Gap(30.h),
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(24.w, 16.h, 24.w, MediaQuery.of(context).padding.bottom + 16.h),
                child: CustomButton(
                  onTap: ()=>AppRouter.route.pop(),
                  text: AppStrings.rate.tr,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}