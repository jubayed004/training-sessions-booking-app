import 'package:flutter/material.dart';
import 'package:my_trainer/utils/color/app_colors.dart';
import 'spin_kit_circle.dart';

class LoadingWidget extends StatelessWidget {
  const LoadingWidget({super.key, this.color});
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SpinKitCircle(
        color: color?? AppColors.black,
        size: 40.0,
      ),
    );
  }
}
