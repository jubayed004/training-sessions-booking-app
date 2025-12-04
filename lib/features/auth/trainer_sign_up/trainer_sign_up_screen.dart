import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax/iconsax.dart';
import 'package:my_trainer/core/router/route_path.dart';
import 'package:my_trainer/core/router/routes.dart';
import 'package:my_trainer/features/auth/widgets/up_progress_bar.dart';
import 'package:my_trainer/helper/validator/text_field_validator.dart';

// --- Assuming these reusable components exist ---
import 'package:my_trainer/share/widgets/button/custom_button.dart';
import 'package:my_trainer/share/widgets/text_field/custom_text_field.dart';
import 'package:my_trainer/utils/app_strings/app_strings.dart';
import 'package:my_trainer/utils/color/app_colors.dart';
import 'package:my_trainer/utils/extension/base_extension.dart';
// -----------------------------------------------

class TrainerSignUpScreen extends StatefulWidget {
  const TrainerSignUpScreen({super.key});

  @override
  State<TrainerSignUpScreen> createState() => _TrainerSignUpScreenState();
}

class _TrainerSignUpScreenState extends State<TrainerSignUpScreen> {
  final _formKey = GlobalKey<FormState>();

  bool _isChecked = false;

  @override
  Widget build(BuildContext context) {

    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        scrolledUnderElevation: 0,
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(
          "mytrainerr.",
          style: context.headlineSmall.copyWith(color: isDarkMode ? Colors.white : AppColors.appbarTextColor, letterSpacing: -0.5),
        ),
        centerTitle: true,

      ),

      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 16.w,vertical: 16),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                UpProgressBar(currentStep: 1),
                Gap(24.h),
                /// ---------- MAIN TITLE ----------
                Text(
                  AppStrings.personalInformation.tr,
                  textAlign: TextAlign.center,
                  style: GoogleFonts.montserrat(
                    fontWeight: FontWeight.w800,
                    fontSize: 22.sp,
                    color: isDarkMode ? AppColors.white : AppColors.blackMainTextColor,
                  ),
                ),
                Gap(6),
                /// ---------- SUBTITLE ----------
                Text(
                  AppStrings.enterYourPersonalInformation.tr,
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: AppColors.grayTextSecondaryColor,
                  ),
                ),
                Gap(32.h),

                _buildUploadPhotoSection(),
                Gap(32.h),

                Align(
                  alignment: Alignment.centerLeft,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [

                      /// ---------- First name ----------
                      CustomTextField(
                        title: AppStrings.name.tr,
                        hintText: "e.g. B. Johnson",
                        keyboardType: TextInputType.name,
                        validator: TextFieldValidator.name(),
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
                      Gap(14),

                      CustomTextField(
                        title: AppStrings.telephoneNumber.tr,
                        hintText: AppStrings.yourPhoneNumber.tr,
                        keyboardType: TextInputType.phone,
                        prefixIcon: const Icon(Icons.mail_outline),
                        validator: TextFieldValidator.phone(),
                      ),

                    ],
                  ),
                ),

                Gap(24.h),

                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 24.h,
                      width: 24.w,
                      child: Checkbox(
                        value: _isChecked,
                        onChanged: (v) {
                          setState(() {
                            _isChecked = v!;
                          });
                        },
                        activeColor: AppColors.primaryColor,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4.r)),
                        side: BorderSide(color: AppColors.primaryColor, width: 1.5),
                      ),
                    ),
                    Gap(12.w),
                    Expanded(
                      child: RichText(
                        text: TextSpan(
                          text: 'I agree to the ',
                          style: context.labelSmall,
                          children: [
                            TextSpan(
                              text: 'Terms & Conditions,',
                              style: context.bodySmall,
                            ),
                            TextSpan(
                              text: ' Privacy Policy,',
                              style: context.bodySmall,
                            ),
                            TextSpan(
                              text: ' and the Trainer Service Agreement. ',
                              style: context.labelSmall,
                            ),

                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                Gap(32.h),
                CustomButton(
                  text: AppStrings.continueText.tr,
                  onTap: ()=> AppRouter.route.pushNamed(RoutePath.expertiseAndSpecializationScreen),
                ),
                Gap(16.h),
                GestureDetector(
                  onTap: () {

                  },
                  child: RichText(
                    text: TextSpan(
                      text:AppStrings.alreadyHaveAnAccount.tr,
                      style: context.titleSmall,
                      children: [
                        TextSpan(
                          text: AppStrings.logIn.tr,
                          style: TextStyle(
                            color: AppColors.primaryColor, // Teal color
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                Gap(40.h),
              ],
            ),
          ),
        ),
      ),
    );
  }
  Widget _buildUploadPhotoSection() {
    return Column(
      children: [
        Container(
          width: 80.r,
          height: 80.r,
          decoration: BoxDecoration(
            color: AppColors.grayTabBgColor,
            borderRadius: BorderRadius.circular(20.r),
          ),
          child: Center(
            child: Icon(
              Iconsax.camera,
              size: 32.r,
            ),
          ),
        ),
        Gap(12.h),
        Text(
          AppStrings.uploadProfilePhoto.tr,
          style: context.bodySmall,
        ),
      ],
    );
  }

}