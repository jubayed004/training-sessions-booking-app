import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_trainer/core/router/route_path.dart';
import 'package:my_trainer/core/router/routes.dart';
import 'package:my_trainer/helper/validator/text_field_validator.dart';
import 'package:my_trainer/share/widgets/button/custom_button.dart';
import 'package:my_trainer/share/widgets/text_field/custom_text_field.dart';
import 'package:my_trainer/utils/app_strings/app_strings.dart';
import 'package:my_trainer/utils/color/app_colors.dart';
import 'package:my_trainer/utils/extension/base_extension.dart';

class ForgetPasswordScreen extends StatefulWidget {
  const ForgetPasswordScreen({super.key});

  @override
  State<ForgetPasswordScreen> createState() => _ForgetPasswordScreenState();
}

class _ForgetPasswordScreenState extends State<ForgetPasswordScreen> {
  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    return Scaffold(
      appBar: AppBar(
        scrolledUnderElevation: 0,
        centerTitle: true,
        title: Text(
          "mytrainerr.".tr,
          style: Theme.of(context).textTheme.headlineSmall?.copyWith(color: isDarkMode ? Colors.white : Color(0xFFE94E6C), letterSpacing: -0.5),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(vertical: 20.h, horizontal: 16.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Gap(20.h),
              /// ---------- MAIN TITLE ----------
              Text(
                AppStrings.resetPassword.tr,
                textAlign: TextAlign.center,
                style: GoogleFonts.montserrat(
                  fontWeight: FontWeight.w800,
                  fontSize: 24.sp,
                  color: isDarkMode ? AppColors.white : const Color(0xFF1D242D), // Dark Navy color from image
                ),
              ),
              Gap(12.h),
              /// ---------- SUBTITLE ----------
              Text(
                AppStrings.resetPasswordTitle.tr,
                textAlign: TextAlign.center,
                style: context.bodyMedium.copyWith(color: isDarkMode ? Colors.white : AppColors.grayTextSecondaryColor, fontSize: 14.sp),
              ),
              Gap(32.h),
              /// ---------- Email Input ----------
              CustomTextField(
                title: AppStrings.emailAddress.tr,
                hintText: "you@example.com",
                keyboardType: TextInputType.emailAddress,
                prefixIcon: const Icon(Icons.mail_outline_rounded, size: 20),
                validator: TextFieldValidator.email(),
              ),
              Gap(32.h),
              /// ---------- Send Reset Link Button ----------
              CustomButton(text: AppStrings.sendResetLink.tr, onTap: ()=>AppRouter.route.pushNamed(RoutePath.otpScreen)),
              Gap(20.h),
            ],
          ),
        ),
      ),
    );
  }
}
