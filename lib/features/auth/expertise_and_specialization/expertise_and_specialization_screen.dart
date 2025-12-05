import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax/iconsax.dart';
import 'package:my_trainer/core/router/route_path.dart';
import 'package:my_trainer/core/router/routes.dart';
import 'package:my_trainer/features/auth/widgets/up_progress_bar.dart';
import 'package:my_trainer/share/widgets/align/custom_align_text.dart';
import 'package:my_trainer/share/widgets/button/custom_button.dart';
import 'package:my_trainer/share/widgets/text_field/custom_text_field.dart';
import 'package:my_trainer/utils/app_strings/app_strings.dart';
import 'package:my_trainer/utils/color/app_colors.dart';
import 'package:my_trainer/utils/extension/base_extension.dart';

class ExpertiseAndSpecializationScreen extends StatefulWidget {
  const ExpertiseAndSpecializationScreen({super.key});

  @override
  State<ExpertiseAndSpecializationScreen> createState() => _ExpertiseAndSpecializationScreenState();
}

class _ExpertiseAndSpecializationScreenState extends State<ExpertiseAndSpecializationScreen> {
  final Set<String> _selectedSpecializations = {'Strength training'};
final _fromKey = GlobalKey<FormState>();
  final _experienceController = TextEditingController();
  final _instagramController = TextEditingController();
  final _websiteController = TextEditingController();

  @override
  void dispose() {
    _experienceController.dispose();
    _instagramController.dispose();
    _websiteController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final primaryTextColor = const Color(0xFF1F2937);
    final secondaryTextColor = const Color(0xFF6B7280);

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        scrolledUnderElevation: 0,
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(
          "mytrainerr.",
          style: context.headlineSmall.copyWith(color:  AppColors.appbarTextColor, letterSpacing: -0.5),
        ),
        centerTitle: true,

      ),

      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 16.w,vertical: 16),
          child: Form(
            key: _fromKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                UpProgressBar(currentStep: 2),
                Gap(24.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Text(
                        'Expertise & Specialization'.tr,
                        style: GoogleFonts.montserrat(
                          fontWeight: FontWeight.w800,
                          fontSize: 20.sp,
                          color: primaryTextColor,
                        ),
                      ),
                    ),
                    Icon(
                        Iconsax.info_circle,
                        size: 20.r,
                        color: secondaryTextColor
                    ),
                  ],
                ),
                Gap(8.h),
                Text(
                  'Choose your focus areas. You can select more than one.'.tr,
                  style: GoogleFonts.montserrat(
                    fontWeight: FontWeight.w500,
                    fontSize: 14.sp,
                    color: secondaryTextColor,
                  ),
                ),
                Gap(32.h),
               CustomAlignText(
                 text: 'Specializations:',
               ),
                Gap(12.h),
                _buildSpecializationChips(),
                Gap(24.h),

                CustomTextField(
                  title: 'Year of Experience'.tr,
                  hintText: 'e.g. 8.5'.tr,
                  keyboardType: const TextInputType.numberWithOptions(decimal: true),
                  controller: _experienceController,
                ),
                Gap(16.h),
                CustomTextField(
                  title: 'Instagram URL (optional)'.tr,
                  hintText: 'Enter your Instagram URL'.tr,
                  controller: _instagramController,
                ),
                Gap(16.h),
                CustomTextField(
                  title: 'Personal website URL (optional)'.tr,
                  hintText: 'Enter your Personal Website URL'.tr,
                  controller: _websiteController,
                ),

                Gap(40.h),
                CustomButton(
                  text: AppStrings.continueText.tr,
                  onTap: ()=> AppRouter.route.pushNamed(RoutePath.trainingLocationScreen),
                ),

                Gap(32.h),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildSpecializationChips() {
    final specializations = [
      'Weight loss', 'Strength training', 'CrossFit', 'Yoga',
      'HIIT', 'Pilates', 'Nutritional advice', 'Rehabilitation',
      'Prenatal training'
    ];

    return Wrap(
      spacing: 8.w,
      runSpacing: 12.h,
      children: specializations.map((spec) {
        final isSelected = _selectedSpecializations.contains(spec);
        return FilterChip(

          label: Text(spec),
          labelStyle: GoogleFonts.montserrat(
            fontWeight: FontWeight.w600,
            fontSize: 12.sp,
            color: isSelected ? AppColors.primaryColor : const Color(0xFF4B5563),
          ),

          backgroundColor: isSelected ? AppColors.primaryColor.withValues(alpha: 0.1) : Colors.white,
          selectedColor: AppColors.primaryColor.withValues(alpha: 0.1),
          selected: isSelected,
          onSelected: (bool selected) {
            setState(() {
              if (selected) {
                _selectedSpecializations.add(spec);
              } else {
                _selectedSpecializations.remove(spec);
              }
            });
          },

          side: BorderSide(
            color: isSelected ? AppColors.primaryColor : const Color(0xFFE5E7EB),
            width: 1.w,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.r),
          ),
          showCheckmark: false,

        );
      }).toList(),
    );
  }
}