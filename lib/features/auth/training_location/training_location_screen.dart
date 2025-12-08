import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_trainer/core/router/route_path.dart';
import 'package:my_trainer/core/router/routes.dart';
import 'package:my_trainer/features/auth/widgets/up_progress_bar.dart';
import 'package:my_trainer/helper/validator/text_field_validator.dart';
import 'package:my_trainer/share/widgets/button/custom_button.dart';
import 'package:my_trainer/share/widgets/text_field/custom_text_field.dart';
import 'package:my_trainer/utils/app_strings/app_strings.dart';
import 'package:my_trainer/utils/color/app_colors.dart';
import 'package:my_trainer/utils/extension/base_extension.dart';
// -----------------------------------------------

class TrainingLocationScreen extends StatelessWidget {
  const TrainingLocationScreen({super.key});

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
        centerTitle: true,
      ),

      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(vertical: 20, horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              UpProgressBar(currentStep: 3),
              Gap(24.h),

              /// ---------- MAIN TITLE ----------
              Text(
                AppStrings.setUpYourTrainingLocation.tr,
                textAlign: TextAlign.center,
                style: GoogleFonts.montserrat(
                  fontWeight: FontWeight.w800,
                  fontSize: 22.sp,
                  color: isDarkMode
                      ? AppColors.white
                      : AppColors.blackMainTextColor,
                ),
              ),
              Gap(6),

              /// ---------- SUBTITLE ----------
              Text(
                AppStrings.pleaseProvideStudioAddress.tr,
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: AppColors.grayTextSecondaryColor,
                ),
              ),
              Gap(32.h),
              CustomTextField(
                title: AppStrings.studioName.tr,
                hintText: AppStrings.egEgPeakFitGym.tr,
                keyboardType: TextInputType.name,
                validator: TextFieldValidator.address(),
              ),
              Gap(14),
              CustomTextField(
                title: AppStrings.address.tr,
                hintText: AppStrings.yourStreetAndHouseNumber.tr,
                keyboardType: TextInputType.name,
                validator: TextFieldValidator.address(),
              ),
              Gap(14),
              CustomTextField(
                title: AppStrings.city.tr,
                hintText: AppStrings.egBBerlin.tr,
                keyboardType: TextInputType.streetAddress,
                validator: TextFieldValidator.city(),
              ),
              Gap(14),
              CustomTextField(
                title: AppStrings.zipCode.tr,
                hintText: AppStrings.egEg12207.tr,
                keyboardType: TextInputType.streetAddress,
                validator: TextFieldValidator.zipcode(),
              ),
              Gap(14),
              CustomTextField(
                title: AppStrings.country.tr,
                hintText: AppStrings.egEgGermany.tr,
                keyboardType: TextInputType.streetAddress,
                validator: TextFieldValidator.country(),
              ),

              Gap(32.h),
              CustomButton(
                text: AppStrings.continueText.tr,
                onTap: () => AppRouter.route.pushNamed(
                  RoutePath.certificationAndOrganicScreen,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
