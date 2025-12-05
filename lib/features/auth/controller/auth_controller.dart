import 'dart:async';

import 'package:get/get.dart';

class AuthController extends GetxController {
  RxInt start = 30.obs;
  RxBool isResendEnabled = false.obs;
  RxBool isUser = true.obs;
  Timer? _timer;
  @override
  void onInit() {
    super.onInit();
    startTimer();
  }
  @override
  void onClose() {
    _timer?.cancel();
    super.onClose();
  }
  void startTimer() {
    const oneSec = Duration(seconds: 1);
    _timer = Timer.periodic(
      oneSec,
          (Timer timer) {
        if (start.value == 0) {
          timer.cancel();
          isResendEnabled.value = true;
        } else {
          start.value--;
        }
      },
    );
  }
  void resendCode() {
    start.value = 30;
    isResendEnabled.value = false;
    startTimer();

  }

  var obscureText = true.obs;
  var password = "".obs;
  bool get hasMinLength => password.value.length >= 8;
  bool get hasNumber => RegExp(r'[0-9]').hasMatch(password.value);
  bool get hasUppercase => RegExp(r'[A-Z]').hasMatch(password.value);
  void toggleVisibility() {
    obscureText.value = !obscureText.value;
  }







}