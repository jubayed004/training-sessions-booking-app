import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_trainer/core/router/route_path.dart';
import 'package:my_trainer/core/router/routes.dart';
import 'package:my_trainer/features/auth/controller/auth_controller.dart';
import 'package:my_trainer/share/widgets/button/custom_button.dart';
import 'package:my_trainer/share/widgets/text_field/otp_text_field.dart';
import 'package:my_trainer/utils/app_strings/app_strings.dart';
import 'package:my_trainer/utils/color/app_colors.dart';
import 'package:my_trainer/utils/extension/base_extension.dart';

class ActiveOtpScreen extends StatefulWidget {
  const ActiveOtpScreen({super.key});

  @override
  State<ActiveOtpScreen> createState() => _ActiveOtpScreenState();
}

class _ActiveOtpScreenState extends State<ActiveOtpScreen> {

  final _formKey = GlobalKey<FormState>();
  final TextEditingController verifyOtp = TextEditingController();
  final AuthController _auth = Get.find<AuthController>();

  @override
  void dispose() {
    verifyOtp.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    return Scaffold(
      appBar: AppBar(
        scrolledUnderElevation: 0,
        centerTitle: true,
        title: Text(
          "mytrainerr.".tr,
          style: context.headlineSmall.copyWith(
            color: AppColors.appbarTextColor,
            letterSpacing: -0.5,
          ),
        ),
      ),
      body: SafeArea(
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                Gap(20.h),
                /// ---------- MAIN TITLE ----------
                Text(
                  AppStrings.verificationCode.tr,
                  textAlign: TextAlign.center,
                  style: GoogleFonts.montserrat(
                    fontWeight: FontWeight.w800,
                    fontSize: 20.sp,
                    color: isDarkMode ? AppColors.white : AppColors.blackMainTextColor,
                  ),
                ),
                Gap(12.h),

                /// ---------- SUBTITLE ----------
                Text(
                  AppStrings.verificationCodeTitle.tr,
                  textAlign: TextAlign.center,
                  style: context.bodyMedium.copyWith(
                    color: isDarkMode ? Colors.white : AppColors.grayTextSecondaryColor,
                    fontSize: 14.sp,
                  ),
                ),
                Gap(32.h),
                /// ---------- OTP INPUT ----------
                Align(
                  alignment: Alignment.center,
                  child: OtpTextField(controller: verifyOtp),
                ),
                Gap(28.h),
                /// ---------- CONFIRM BUTTON ----------
                CustomButton(
                  text: AppStrings.confirm.tr,
                  onTap: (){
                    AppRouter.route.pushNamed(RoutePath.resetPasswordScreen);
                  }
                ),
                Gap(28.h),
                /// ---------- DON'T GET CODE TEXT ----------
                Text(
                  AppStrings.youDontGetTheCode.tr,
                  style: context.titleMedium,
                ),
                Gap(8.h),
                ///  ---------- RESEND WITH TIMER UI ----------
                Obx(
                      () => _auth.isResendEnabled.value
                      ? TextButton(
                    onPressed: () {
                      _auth.resendCode();
                    },
                    child: Text(
                        AppStrings.resend.tr,
                        style: context.titleSmall.copyWith(
                            color: AppColors.greenTextColor
                        )
                    ),
                  )
                      : Text(
                    "Resend code in 00:${_auth.start.value.toString().padLeft(2, '0')}s",
                    style: context.titleSmall,
                  ),
                ),
              ],
            ),
          ),
      ),
    );
  }
}
