import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_trainer/utils/color/app_colors.dart';
import 'package:pinput/pinput.dart';

class OtpTextField extends StatelessWidget {
  const OtpTextField({super.key, required this.controller});

  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    final basePinTheme = PinTheme(
      height: 50,
      width: 50,
      textStyle: theme.textTheme.titleMedium?.copyWith(
        fontWeight: FontWeight.w800,
        color: isDark ? AppColors.white : AppColors.black,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: AppColors.linesDarkColor),
      ),
    );

    return FormField<String>(
      validator: (value) {
        if (controller.text.isEmpty) {
          return 'OTP_is_required'.tr;
        }
        if (controller.text.length != 6) {
          return 'OTP_must_be_6_digits'.tr;
        }
        return null;
      },
      builder: (FormFieldState<String> field) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Pinput(
              length: 4,
              controller: controller,
              autofocus: true,
              defaultPinTheme: basePinTheme,
              focusedPinTheme: basePinTheme.copyWith(
                decoration: basePinTheme.decoration?.copyWith(
                  border: Border.all(color: AppColors.greenTextColor),
                ),
              ),
              submittedPinTheme: basePinTheme,
              errorPinTheme: basePinTheme.copyWith(
                decoration: basePinTheme.decoration?.copyWith(
                  color: AppColors.primaryColor.withOpacity(0.8),
                ),
              ),
              onChanged: (value) {
                field.didChange(value);
              },
            ),
            if (field.hasError)
              Padding(
                padding: const EdgeInsets.only(top: 8),
                child: Text(
                  field.errorText ?? '',
                  style: theme.textTheme.headlineSmall,
                ),
              ),
          ],
        );
      },
    );
  }
}
