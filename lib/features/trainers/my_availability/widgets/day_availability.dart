import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax/iconsax.dart';
import 'package:my_trainer/features/trainers/my_availability/controller/my_availability_controller.dart';
import 'package:my_trainer/share/widgets/align/custom_align_text.dart';
import 'package:my_trainer/share/widgets/dropdown/custom_dropdown_field.dart';
import 'package:my_trainer/utils/app_strings/app_strings.dart';
import 'package:my_trainer/utils/color/app_colors.dart';
import 'package:my_trainer/utils/extension/base_extension.dart';

class DayAvailability extends StatelessWidget {
  final String dayName;
  final ValueNotifier<bool> isConnect;
  final MyAvailabilityController myAvailabilityController;

  const DayAvailability({
    super.key,
    required this.dayName,
    required this.isConnect,
    required this.myAvailabilityController,
  });

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;

    return ValueListenableBuilder(
      valueListenable: isConnect,
      builder: (context,child, item) {
        return Container(
          padding: EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
          ),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    dayName.tr,
                    style: GoogleFonts.montserrat(
                      fontWeight: FontWeight.w800,
                      fontSize: 14.sp,
                      color: isDarkMode ? AppColors.white : const Color(0xFF1D242D),
                    ),
                  ),
                  Transform.scale(
                    scale: 0.6,
                    child: Switch(
                      value: isConnect.value,
                      onChanged: (newValue) {
                        isConnect.value = newValue;
                      },
                      activeColor: Colors.white,
                      activeTrackColor: AppColors.orangeSecondaryAccentColor,
                      inactiveThumbColor: Colors.white,
                      inactiveTrackColor: const Color(0xFFE5E7EB),
                      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                    ),
                  ),
                ],
              ),
              // Show Column only when Switch is ON
              if (isConnect.value) ...[
                Column(
                  children: [
                    Gap(12),
                    CustomAlignText(text: "From".tr, style: context.bodyLarge),
                    Gap(4),
                    CustomDropdownField(
                      hintText: "12:00 am",
                      items: myAvailabilityController.weekly.map((item) {
                        return item;
                      }).toList(),
                      onChanged: (value) {
                        if (value != null) {
                          myAvailabilityController.selectedWeek.value = value;
                        }
                      },
                    ),
                    Gap(12),
                    CustomAlignText(text: "Until".tr, style: context.bodyLarge),
                    Gap(4),
                    CustomDropdownField(
                      hintText: "12:00 pm",
                      items: myAvailabilityController.weekly.map((item) {
                        return item;
                      }).toList(),
                      onChanged: (value) {
                        if (value != null) {
                          myAvailabilityController.selectedWeek.value = value;
                        }
                      },
                    ),
                    Gap(12),
                    ...List.generate(3, (index) {
                      return Container(
                        margin: EdgeInsets.only(bottom: 6),
                        padding: EdgeInsets.all(12),
                        decoration: BoxDecoration(borderRadius: BorderRadius.circular(16), color: AppColors.backgroundsLinesColor),
                        child: Row(
                          children: [
                            Icon(Iconsax.timer_14, size: 18),
                            Gap(6),
                            Text("09:00 am - 12:00 pm".tr, style: context.bodyMedium.copyWith(
                                color: AppColors.tertiaryTextColor
                            )),
                            Spacer(),
                            Icon(Iconsax.trash),
                          ],
                        ),
                      );
                    }),
                    FilledButton(
                      style: ButtonStyle(
                        backgroundColor: WidgetStateProperty.all(AppColors.backgroundsLinesColor),
                      ),
                      onPressed: () {},
                      child: Row(
                        spacing: 8,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Iconsax.add,size: 18,color: AppColors.tertiaryTextColor,),
                          Text(
                            AppStrings.addTimeSlot.tr,
                            style: context.titleSmall.copyWith(
                                color: AppColors.tertiaryTextColor
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ],
          ),
        );
      },
    );
  }
}
