import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_trainer/utils/enum/app_enum.dart';

class AppToast {
  static void _show({
    String? message,
    AppToastType type = AppToastType.info,
    Color? textColor,
    Color? backgroundColor,
    SnackPosition position = SnackPosition.BOTTOM,
    Duration duration = const Duration(seconds: 2),
  }) {
    final displayMessage = (message?.trim().isEmpty ?? true)
        ? "Something went wrong"
        : message!;

    final Color defaultBgColor = backgroundColor ??
        switch (type) {
          AppToastType.success => Colors.green.shade600,
          AppToastType.error => Colors.red.shade600,
          AppToastType.warning => Colors.orange.shade700,
          AppToastType.info => Colors.blue.shade600,
        };

    final Color effectiveTextColor = textColor ?? Colors.white;

    if (Get.isSnackbarOpen) Get.closeAllSnackbars();

    Get.snackbar(
      '',
      displayMessage,
      backgroundColor: defaultBgColor,
      colorText: effectiveTextColor,
      snackPosition: position,
      borderRadius: 10,
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      duration: duration,
      icon: switch (type) {
        AppToastType.success =>
        const Icon(Icons.check_circle, color: Colors.white),
        AppToastType.error =>
        const Icon(Icons.error, color: Colors.white),
        AppToastType.warning =>
        const Icon(Icons.warning, color: Colors.white),
        AppToastType.info =>
        const Icon(Icons.info, color: Colors.white),
      },
      shouldIconPulse: false,
      animationDuration: const Duration(milliseconds: 250),
    );
  }

  static void success({String? message}) => _show(message: message, type: AppToastType.success);

  static void error({required String message}) => _show(message: message, type: AppToastType.error);

  static void warning({required String message}) => _show(message: message, type: AppToastType.warning);

  static void info({required String message}) => _show(message: message, type: AppToastType.info);
}
