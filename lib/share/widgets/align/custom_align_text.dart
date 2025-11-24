import 'package:flutter/material.dart';
import 'package:my_trainer/utils/color/app_colors.dart';
import 'package:my_trainer/utils/extension/base_extension.dart';


class CustomAlignText extends StatelessWidget {
  const CustomAlignText({
    super.key,
    this.alignment = Alignment.centerLeft,
    required this.text,
    this.fontSize,
    this.fontWeight,
    this.color,
    this.style,
    this.maxLine,
    this.textAlign
  });

  final Alignment alignment;
  final String text;
  final double? fontSize;
  final FontWeight? fontWeight;
  final Color? color;
  final TextStyle? style;
  final int? maxLine;
  final TextAlign? textAlign;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: alignment,
      child: Text(
          text,
          textAlign: textAlign ?? TextAlign.start,
          maxLines: maxLine,
          style: style ?? context.titleMedium.copyWith(
            fontWeight: fontWeight ?? FontWeight.w500,
            fontSize: fontSize,
            color: AppColors.blackMainTextColor,
          ),
      ),
    );
  }
}
