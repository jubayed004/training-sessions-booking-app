import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_utils/get_utils.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_trainer/core/custom_assets/assets.gen.dart';
import 'package:my_trainer/core/router/route_path.dart';
import 'package:my_trainer/core/router/routes.dart';
import 'package:my_trainer/helper/validator/text_field_validator.dart';
import 'package:my_trainer/share/widgets/button/custom_button.dart';
import 'package:my_trainer/share/widgets/text_field/custom_text_field.dart';
import 'package:my_trainer/utils/app_strings/app_strings.dart';
import 'package:my_trainer/utils/color/app_colors.dart';
import 'package:my_trainer/utils/extension/base_extension.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    return Scaffold(
      appBar: AppBar(
        scrolledUnderElevation: 0,
        centerTitle: true,
        title: Text(
          "mytrainerr.",
          style: context.headlineSmall.copyWith(color: isDarkMode ? Colors.white : AppColors.appbarTextColor, letterSpacing: -0.5),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(vertical: 20,horizontal: 16),
            child:
            Column(
                children: [
                  /// ---------- MAIN TITLE ----------
                  Text(
                    AppStrings.createYourAccount.tr,
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
                    AppStrings.startYourJourney.tr,
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: AppColors.grayTextSecondaryColor,
                    ),
                  ),
                  Gap(26),
                  /// ---------- Name ----------
                  CustomTextField(
                    title: AppStrings.name.tr,
                    hintText: "e.g. B.Alex",
                    keyboardType: TextInputType.name,
                    validator: TextFieldValidator.name(),
                  ),
                  Gap(14),
                  /// ---------- First name ----------
                  CustomTextField(
                    title: AppStrings.firstName.tr,
                    hintText: "e.g. B. Johnson",
                    keyboardType: TextInputType.name,
                    validator: TextFieldValidator.name(),
                  ),
                  Gap(14),
                  /// ---------- Email ----------
                  CustomTextField(
                    title: AppStrings.emailAddress.tr,
                    hintText: AppStrings.enterYourEmailAddress.tr,
                    keyboardType: TextInputType.emailAddress,
                    prefixIcon: const Icon(Icons.mail_outline),
                    validator: TextFieldValidator.email(),
                  ),
                  Gap(14),
                  /// ---------- Password ----------
                  CustomTextField(
                    title: AppStrings.password.tr,
                    hintText: AppStrings.enterYourPassword.tr,
                    prefixIcon: const Icon(Icons.lock_outline),
                    isPassword: true,
                    validator: TextFieldValidator.password(),
                  ),
                  Gap(14),
                  /// ---------- Confirm Password ----------
                  CustomTextField(
                    title: AppStrings.confirmPassword.tr,
                    hintText: AppStrings.confirmYourPassword.tr,
                    prefixIcon: const Icon(Icons.lock_outline),
                    isPassword: true,
                    validator: TextFieldValidator.password(),
                  ),
                  Gap(24),
                  /// ---------- Register Button ----------
                  CustomButton(
                    text: AppStrings.register.tr,
                    onTap: ()=>AppRouter.route.pushNamed(RoutePath.activeOtpScreen),
                  ),
                  Gap(12),
                  /// ---------- Terms ----------
                  Text(
                    AppStrings.byRegisteringYouAgree.tr,
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      color: AppColors.grayTextSecondaryColor,
                      fontSize: 12.sp,
                    ),
                  ),
                  Gap(26),
                  /// ---------- Divider + Text ----------
                  Row(
                    children: [
                      Expanded(
                        child: Divider(
                          thickness: 1,
                          color: AppColors.grayTextSecondaryColor,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 12),
                        child: Text(
                          AppStrings.orContinueWith.tr,
                          style: GoogleFonts.montserrat(
                            fontWeight: FontWeight.w700,
                            fontSize: 14.sp,
                            color: AppColors.blackMainTextColor,
                          ),
                        ),
                      ),
                      Expanded(
                        child: Divider(
                          thickness: 1,
                          color: AppColors.grayTextSecondaryColor,
                        ),
                      ),
                    ],
                  ),
                  Gap(26),
                  /// ---------- Social Icons ----------
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Assets.icons.google.svg(),
                      Gap(28),
                      Assets.icons.apple.svg(),
                    ],
                  ),
                  Gap(34),
                  /// ---------- Already Have Account ----------
                  Text(
                    AppStrings.alreadyHaveAnAccount.tr,
                    style: Theme.of(context).textTheme.titleSmall,
                  ),
                  Gap(4),
                  GestureDetector(
                    onTap: () => AppRouter.route.pushNamed(RoutePath.loginScreen),
                    child: Text(
                      AppStrings.logIn.tr,
                      style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        color: AppColors.greenTextColor,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  Gap(10),
            ]
            )
        ),
      ),
    );
  }
}
