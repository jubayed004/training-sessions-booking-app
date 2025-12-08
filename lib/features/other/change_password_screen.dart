import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:my_trainer/core/router/route_path.dart';
import 'package:my_trainer/core/router/routes.dart';
import 'package:my_trainer/features/auth/controller/auth_controller.dart';
import 'package:my_trainer/helper/validator/text_field_validator.dart';
import 'package:my_trainer/share/widgets/button/custom_button.dart';
import 'package:my_trainer/share/widgets/text_field/custom_text_field.dart';
import 'package:my_trainer/utils/app_strings/app_strings.dart';
import 'package:my_trainer/utils/extension/base_extension.dart';

class ChangePasswordScreen extends StatefulWidget {
  const ChangePasswordScreen({super.key});

  @override
  State<ChangePasswordScreen> createState() => _ChangePasswordScreenState();
}

class _ChangePasswordScreenState extends State<ChangePasswordScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _oldPassword = TextEditingController();
  final TextEditingController _resetPassword = TextEditingController();
  final TextEditingController _resetConfirmPassword = TextEditingController();
  final AuthController _auth = Get.find<AuthController>();

  @override
  void dispose() {
    _resetConfirmPassword.dispose();
    _resetPassword.dispose();
    _oldPassword.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Widget buildCheckItem(String text, bool valid) {
      return Row(
        spacing: 8,
        children: [
          Icon(
            Icons.check_circle,
            color: valid ? Colors.teal : Colors.grey,
            size: 20,
          ),
          Text(text, style: context.labelMedium),
        ],
      );
    }

    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: AppBar(
        scrolledUnderElevation: 0,
        backgroundColor: Colors.transparent,
        title: Text('Change Password'.tr),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
          child: Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  child: Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        /// ---------- Old Password Input ----------
                        CustomTextField(
                          title: "Old Password".tr,
                          hintText: AppStrings.enterYourPassword.tr,
                          keyboardType: TextInputType.text,
                          prefixIcon: Icon(Iconsax.lock_1),
                          isPassword: true,
                          controller: _oldPassword,
                          validator: TextFieldValidator.password(),
                          onChanged: (value) {
                            _auth.password.value = value;
                          },
                        ),
                        Gap(16.h),

                        /// ---------- New Password Input ----------
                        CustomTextField(
                          title: AppStrings.newPassword.tr,
                          hintText: AppStrings.enterYourNewPassword.tr,
                          keyboardType: TextInputType.text,
                          prefixIcon: Icon(Iconsax.lock_1),
                          isPassword: true,
                          controller: _resetPassword,
                          validator: TextFieldValidator.password(),
                          onChanged: (value) {
                            _auth.password.value = value;
                          },
                        ),
                        Gap(16.h),

                        /// ---------- Password Rule Checklist ----------
                        Obx(
                          () => buildCheckItem(
                            AppStrings.minimum8Characters.tr,
                            _auth.hasMinLength,
                          ),
                        ),
                        Obx(
                          () => buildCheckItem(
                            AppStrings.oneNumber.tr,
                            _auth.hasNumber,
                          ),
                        ),
                        Obx(
                          () => buildCheckItem(
                            AppStrings.oneUppercaseLetter.tr,
                            _auth.hasUppercase,
                          ),
                        ),
                        Gap(24.h),

                        /// ---------- Confirm Password ----------
                        CustomTextField(
                          title: AppStrings.confirmPassword.tr,
                          hintText: AppStrings.confirmYourNewPassword.tr,
                          keyboardType: TextInputType.text,
                          prefixIcon: Icon(Iconsax.lock_1),
                          isPassword: true,
                          controller: _resetConfirmPassword,
                          validator: TextFieldValidator.confirmPassword(
                            _resetPassword,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              CustomButton(
                text: AppStrings.updatePassword.tr,
                onTap: () => AppRouter.route.goNamed(RoutePath.navigationPage),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
