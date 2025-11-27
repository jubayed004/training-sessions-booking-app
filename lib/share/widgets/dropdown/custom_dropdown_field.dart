import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:my_trainer/utils/color/app_colors.dart';
import 'package:my_trainer/utils/extension/base_extension.dart';

class CustomDropdownField<T> extends StatelessWidget {
  final String hintText;
  final List<T> items;
  final T? value;
  final String Function(T)? labelBuilder;
  final void Function(T?)? onChanged;
  final String? Function(T?)? validator;
  final bool isRequired;
  final Color? fillColor;
  final String? errorText;
  final bool enabled;

  const CustomDropdownField({
    super.key,
    required this.hintText,
    required this.items,
    this.value,
    this.labelBuilder,
    this.onChanged,
    this.validator,
    this.isRequired = false,
    this.fillColor,
    this.errorText,
    this.enabled = true,
  });

  @override
  Widget build(BuildContext context) {
    final message = "Field Is Required";

    String? Function(T?)? validation =
    (isRequired ? (val) => (val == null) ? message : null : null);
    final validationFunction = validator ?? validation;

    final bool hasError = errorText != null && errorText!.isNotEmpty;

    return DropdownButtonFormField2<T>(
      isExpanded: true,
      value: items.contains(value) ? value : null,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.symmetric(vertical: 16, horizontal: 12),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: BorderSide(
            color: hasError ? AppColors.redColor : AppColors.bgSecondaryButtonColor,
            width: 1.2,
          ),
        ),
        filled: true,
        fillColor: fillColor ?? AppColors.white,
        errorText: errorText,
        errorStyle: const TextStyle(color: AppColors.redColor),
      ),
      hint: Text(
        hintText,
      ),
      items: items.map((item) => DropdownMenuItem<T>(
        value: item,
        child: Text(
          labelBuilder?.call(item) ?? item.toString(),
          style: context.bodyMedium,
        ),
      )).toList(),
      onChanged: enabled ? onChanged : null,
      validator: validationFunction,
      style: context.bodyMedium,
      buttonStyleData: const ButtonStyleData(
        padding: EdgeInsets.only(right: 8),
      ),
      iconStyleData: const IconStyleData(
        icon: Icon(Icons.keyboard_arrow_down, color: AppColors.grayTertiaryTextColor),
        iconSize: 24,
      ),
      dropdownStyleData: DropdownStyleData(
        maxHeight: 300,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: AppColors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.05),
              blurRadius: 8,
              offset: const Offset(0, 4),
            ),
          ],
        ),
      ),
      menuItemStyleData: const MenuItemStyleData(
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      ),
    );
  }
}
