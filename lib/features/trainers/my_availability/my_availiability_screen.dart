import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax/iconsax.dart';
import 'package:my_trainer/features/trainers/my_availability/controller/my_availability_controller.dart';
import 'package:my_trainer/features/trainers/my_availability/widgets/day_availability.dart';
import 'package:my_trainer/features/trainers/trainer_information/widgets/specialization_chips.dart';
import 'package:my_trainer/share/widgets/align/custom_align_text.dart';
import 'package:my_trainer/share/widgets/button/custom_button.dart';
import 'package:my_trainer/share/widgets/dropdown/custom_dropdown_field.dart';
import 'package:my_trainer/utils/app_strings/app_strings.dart';
import 'package:my_trainer/utils/color/app_colors.dart';
import 'package:my_trainer/utils/extension/base_extension.dart';

class MyAvailiabilityScreen extends StatefulWidget {
  const MyAvailiabilityScreen({super.key});

  @override
  State<MyAvailiabilityScreen> createState() => _MyAvailiabilityScreenState();
}

class _MyAvailiabilityScreenState extends State<MyAvailiabilityScreen> {
  final Set<String> _selectedSpecializations = {'Strength training'};
  final Set<String> _selectedSpecializationsOne = {'Strength training'};
  final ValueNotifier<bool> saturdayConnect = ValueNotifier(false);
  final ValueNotifier<bool> sundayConnect = ValueNotifier(false);
  final ValueNotifier<bool> mondayConnect = ValueNotifier(false);
  final ValueNotifier<bool> tuesdayConnect = ValueNotifier(false);
  final ValueNotifier<bool> wednesdayConnect = ValueNotifier(false);
  final ValueNotifier<bool> thursdayConnect = ValueNotifier(false);
  final ValueNotifier<bool> fridayConnect = ValueNotifier(false);
  final ValueNotifier<bool> isConnect = ValueNotifier(false);
  String? selectedItem;
  final myAvailabilityController = Get.put(MyAvailabilityController(),permanent: false);
  @override
  void initState() {

    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: AppBar(scrolledUnderElevation: 0, backgroundColor: Colors.transparent, title: Text(AppStrings.myAvailability.tr), centerTitle: true),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              /// ---------- MAIN TITLE ----------
              Text(
                AppStrings.yourAvailability.tr,
                textAlign: TextAlign.center,
                style: GoogleFonts.montserrat(
                  fontWeight: FontWeight.w800,
                  fontSize: 24.sp,
                  color: isDarkMode ? AppColors.white : const Color(0xFF1D242D),
                ),
              ),
              Gap(12.h),

              /// ---------- SUBTITLE ----------
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.w),
                child: Text(
                  AppStrings.yourAvailabilityTitle.tr,
                  textAlign: TextAlign.center,
                  style: context.bodyMedium.copyWith(color: AppColors.grayTextSecondaryColor),
                ),
              ),
              Gap(24.h),
              CustomAlignText(text: AppStrings.sessionDuration.tr),
              Gap(8),
              SpecializationChips(
                specializations: ['30 mins', '45 mins', '60 mins', '90 mins'],
                selectedSpecializations: _selectedSpecializationsOne,
                onSelectionChanged: (String specialization) {
                  setState(() {
                    if (_selectedSpecializationsOne.contains(specialization)) {
                      _selectedSpecializationsOne.remove(specialization);
                    } else {
                      _selectedSpecializationsOne.add(specialization);
                    }
                  });
                },
              ),
              CustomAlignText(text: AppStrings.breakBetweenSessions.tr),
              Gap(12),
              SpecializationChips(
                specializations: ['5 mins', '10 mins ', '15 mins', '20 mins ', '25 mins', '30 mins', '35 mins', '45 mins', '60 mins'],
                selectedSpecializations: _selectedSpecializations,
                onSelectionChanged: (String specialization) {
                  setState(() {
                    if (_selectedSpecializations.contains(specialization)) {
                      _selectedSpecializations.remove(specialization);
                    } else {
                      _selectedSpecializations.add(specialization);
                    }
                  });
                },
              ),
              Gap(24),
              CustomAlignText(text: AppStrings.setAvailability.tr),
              Gap(12),
             /* Container(
                padding: EdgeInsets.all(12),
                decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(16)),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Sunday".tr,
                          style: GoogleFonts.montserrat(
                            fontWeight: FontWeight.w800,
                            fontSize: 14.sp,
                            color: isDarkMode ? AppColors.white : const Color(0xFF1D242D),
                          ),
                        ),
                        ValueListenableBuilder<bool>(
                          valueListenable: isConnect,
                          builder: (context, value, chin) {
                            return Transform.scale(
                              scale: 0.6,
                              child: Switch(
                                value: isConnect.value,
                                onChanged: (newValue) {
                                  isConnect.value = newValue;
                                },
                                activeColor: Colors.white,
                                activeTrackColor: AppColors.orangeSecondaryAccentColor,
                                inactiveThumbColor: AppColors.inactiveBackground,
                                inactiveTrackColor: const Color(0xFFE5E7EB),
                                materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                              ),
                            );
                          },
                        ),
                      ],
                    ),
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
              ),*/
              DayAvailability(dayName: "Saturday", isConnect: saturdayConnect, myAvailabilityController: myAvailabilityController),
              DayAvailability(dayName: "Sunday", isConnect: sundayConnect, myAvailabilityController: myAvailabilityController),
              DayAvailability(dayName: "Monday", isConnect: mondayConnect, myAvailabilityController: myAvailabilityController),
              DayAvailability(dayName: "Tuesday", isConnect: tuesdayConnect, myAvailabilityController: myAvailabilityController),
              DayAvailability(dayName: "Wednesday", isConnect: wednesdayConnect, myAvailabilityController: myAvailabilityController),
              DayAvailability(dayName: "Thursday", isConnect: thursdayConnect, myAvailabilityController: myAvailabilityController),
              DayAvailability(dayName: "Friday", isConnect: fridayConnect, myAvailabilityController: myAvailabilityController),
              Gap(24),
              Container(
            margin: EdgeInsets.only(bottom: 6),
            padding: EdgeInsets.all(12),
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(16),
                color: AppColors.white),
            child: Row(
              children: [
                Icon(Iconsax.calendar_2, size: 22,color: Colors.black,),
                Gap(6),
                Text("Set a long Unavaliablity ".tr, style: context.bodyMedium),
                Spacer(),
                Icon(Icons.keyboard_arrow_right_outlined),
              ],
            ),
          ),
              Gap(24),
              CustomButton(text: "Save".tr,onTap: (){},)
            ],
          ),
        ),
      ),
    );
  }
}
