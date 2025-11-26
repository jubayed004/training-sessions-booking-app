import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax/iconsax.dart';
import 'package:my_trainer/core/router/routes.dart';
import 'package:my_trainer/helper/validator/text_field_validator.dart';
import 'package:my_trainer/share/widgets/button/custom_back_button.dart';
import 'package:my_trainer/share/widgets/text_field/custom_text_field.dart';
import 'package:my_trainer/utils/app_strings/app_strings.dart';
import 'package:my_trainer/utils/color/app_colors.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "mytrainerr.".tr,
          style: Theme.of(context).textTheme.headlineSmall?.copyWith(color: isDarkMode ? Colors.white : Color(0xFFE94E6C), letterSpacing: -0.5),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
          child: Center(
            child: Column(
              children: [
                Text(
                  textAlign: TextAlign.center,
                  AppStrings.welcomeBack.tr,
                  style: GoogleFonts.montserrat(
                    fontWeight: FontWeight.w800,
                    fontSize: 24.sp,
                    color: isDarkMode ? AppColors.white : AppColors.blackMainTextColor,
                  ),
                ),
                Gap(8),
                Text(
                  AppStrings.letsGetStarted.tr,
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: isDarkMode ? Colors.black : AppColors.grayTextSecondaryColor
                  ),
                ),
                Gap(24),
                CustomTextField(
                  title: AppStrings.email.tr,
                  hintText: AppStrings.enterYourEmailAddress.tr,
                  keyboardType: TextInputType.emailAddress,
                  prefixIcon: Icon(Icons.mail_outline_outlined),
                  validator: TextFieldValidator.email(),

                ),
                Gap(14),
                CustomTextField(
                  title: AppStrings.password.tr,
                  hintText: AppStrings.enterYourPassword.tr,
                  keyboardType: TextInputType.emailAddress,
                  prefixIcon: Icon(Icons.mail_outline_outlined),
                  isPassword: true,
                  validator: TextFieldValidator.email(),

                ),
                Gap(14),

              ],
            ),
          ),
        ),
      ),
    );
  }
}
