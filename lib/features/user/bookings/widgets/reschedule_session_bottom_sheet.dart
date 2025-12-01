import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax/iconsax.dart';
import 'package:my_trainer/core/router/route_path.dart';
import 'package:my_trainer/core/router/routes.dart';
import 'package:my_trainer/share/widgets/button/custom_button.dart';
import 'package:my_trainer/utils/app_strings/app_strings.dart';
import 'package:my_trainer/utils/color/app_colors.dart';
// Note: You need a utility function/extension for context.bodyMedium if you want to use it
// import 'package:my_trainer/utils/extension/base_extension.dart';


Widget makeDismissable({required Widget child}) => GestureDetector(
  behavior: HitTestBehavior.opaque,
  onTap: () => Get.back(),
  child: GestureDetector(onTap: () {}, child: child),
);

void showRescheduleDateModal(
    BuildContext context, {
      required int sessionId,
      required String currentTrainerName,
    }) {
  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    backgroundColor: Colors.transparent,
    builder: (BuildContext context) {
      return RescheduleSessionBottomSheet(
        sessionId: sessionId,
        currentTrainerName: currentTrainerName,
      );
    },
  );
}
// ---------------------------------------------


class RescheduleSessionBottomSheet extends StatefulWidget {
  final int sessionId;
  final String currentTrainerName;

  const RescheduleSessionBottomSheet({
    super.key,
    required this.sessionId,
    required this.currentTrainerName,
  });

  @override
  State<RescheduleSessionBottomSheet> createState() => _RescheduleSessionBottomSheetState();
}

class _RescheduleSessionBottomSheetState extends State<RescheduleSessionBottomSheet> {

  // Default to today, or if you prefer a future date, ensure consistency
  DateTime _selectedDate = DateTime.now().add(const Duration(days: 1));
  String? _selectedTimeSlot = '12:00 - 13:00';

  final List<String> _timeSlots = const [
    '11:00 - 12:00',
    '12:00 - 13:00',
    '2:00 p.m. - 3:00 p.m',
    '4:00 p.m. - 5:00 p.m',
    '5:00 p.m. - 6:00 p.m',
    '6:30 p.m. - 7:30 p.m',
  ];

  // Removed _displayMonth and calendar logic

  @override
  void initState() {
    super.initState();
    // Initialize display date if needed
    // _updateDisplayMonth();
  }

  // --- New function to show the default date picker ---
  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _selectedDate,
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(const Duration(days: 365 * 2)), // 2 years from now
      builder: (BuildContext context, Widget? child) {
        // Customizing the theme to match your app colors
        return Theme(
          data: ThemeData.light().copyWith(
            primaryColor: AppColors.primaryColor,
            colorScheme: ColorScheme.light(primary: AppColors.primaryColor),
            buttonTheme: const ButtonThemeData(textTheme: ButtonTextTheme.primary),
          ),
          child: child!,
        );
      },
    );

    if (picked != null && picked != _selectedDate) {
      setState(() {
        _selectedDate = picked;
        // You might want to update the time slots based on the new date here
      });
    }
  }




  String get _displayDateText {
    final day = _selectedDate.day.toString();
    final month = _selectedDate.month.toString().padLeft(2, '0');
    final year = _selectedDate.year.toString();
    return '$day/$month/$year';
  }


  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    final primaryTextColor = isDarkMode ? AppColors.white : AppColors.blackMainTextColor;
    final secondaryTextColor = isDarkMode ? AppColors.white.withOpacity(0.7) : AppColors.grayTextSecondaryColor;

    return makeDismissable(
      child: DraggableScrollableSheet(
        initialChildSize: 0.85,
        minChildSize: 0.7,
        maxChildSize: 0.95,
        builder: (_, sheetController) => Container(
          decoration: BoxDecoration(
            color: Theme.of(context).scaffoldBackgroundColor,
            borderRadius: BorderRadius.vertical(
              top: Radius.circular(30.r),
            ),
          ),
          child: Column(
            children: [
              // --- Header ---
              Padding(
                padding: EdgeInsets.fromLTRB(24.w, 24.h, 16.w, 0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          AppStrings.rescheduleSession.tr,
                          style: GoogleFonts.montserrat(
                            fontWeight: FontWeight.w800,
                            fontSize: 20.sp,
                            color: primaryTextColor,
                          ),
                        ),
                        Gap(4.h),
                        Text(
                          'Choose date and time'.tr,
                          style: GoogleFonts.montserrat(
                            fontWeight: FontWeight.w500,
                            fontSize: 12.sp,
                            color: secondaryTextColor,
                          ),
                        ),
                      ],
                    ),
                    IconButton(
                      icon: Icon(Icons.close, size: 24.r, color: primaryTextColor),
                      onPressed: () => AppRouter.route.pop(),
                    ),
                  ],
                ),
              ),
              Gap(24.h),

              Expanded(
                child: SingleChildScrollView(
                  controller: sheetController,
                  padding: EdgeInsets.symmetric(horizontal: 24.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // --- Date Selection Header ---
                      Text(
                        'SELECTED DATE:',
                        style: GoogleFonts.montserrat(
                          fontWeight: FontWeight.w700,
                          fontSize: 14.sp,
                          color: AppColors.grayTextSecondaryColor,
                          letterSpacing: 0.5,
                        ),
                      ),
                      Gap(8.h),

                      // --- Date Picker Button ---
                      Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: isDarkMode ? AppColors.blackMainTextColor : Colors.grey.shade100,
                          borderRadius: BorderRadius.circular(16.r),
                        ),
                        child: CustomButton(
                          text: 'Change Date (Currently: $_displayDateText)',

                          onTap: () => _selectDate(context), // <--- Calls the native date picker
                        ),
                      ),

                      Gap(32.h),

                      // --- Time Selection Header ---
                      Text(
                        'TIME SELECTION:'.tr,
                        style: GoogleFonts.montserrat(
                          fontWeight: FontWeight.w700,
                          fontSize: 14.sp,
                          color: AppColors.grayTextSecondaryColor,
                          letterSpacing: 0.5,
                        ),
                      ),
                      Gap(16.h),

                      // --- Time Slots Grid ---
                      Wrap(
                        spacing: 12.w,
                        runSpacing: 12.h,
                        children: _timeSlots.map((slot) {
                          final isSelected = _selectedTimeSlot == slot;
                          return GestureDetector(
                            onTap: () {
                              setState(() {
                                _selectedTimeSlot = slot;
                              });
                            },
                            child: Container(
                              padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.h),
                              decoration: BoxDecoration(
                                color: isSelected
                                    ? AppColors.primaryColor
                                    : isDarkMode ? AppColors.blackMainTextColor : AppColors.grayTextSecondaryColor.withOpacity(0.1),
                                borderRadius: BorderRadius.circular(12.r),
                                border: isSelected
                                    ? Border.all(color: AppColors.primaryColor, width: 1.5)
                                    : Border.all(color: Colors.transparent),
                              ),
                              child: Text(
                                slot,
                                style: GoogleFonts.montserrat(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 13.sp,
                                  color: isSelected ? AppColors.white : primaryTextColor,
                                ),
                              ),
                            ),
                          );
                        }).toList(),
                      ),
                      Gap(30.h),
                    ],
                  ),
                ),
              ),

              // --- Confirm & Reschedule Button ---
              Padding(
                padding: EdgeInsets.fromLTRB(24.w, 16.h, 24.w, MediaQuery.of(context).padding.bottom + 16.h),
                child: CustomButton(
                  
                  text: "Confirm & Reschedule ".tr,
                  onTap: ()=>AppRouter.route.pushNamed(RoutePath.bookingConfirmationScreen),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

// --- Removed _buildCalendarGrid function ---
}