import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:my_trainer/features/trainers/trainer_information/controller/trainer_information_controller.dart';
import 'package:my_trainer/utils/color/app_colors.dart';

class TrainerImagePicker extends StatelessWidget {
  final TrainerInformationController controller;
  final BuildContext context;
  TrainerImagePicker({required this.controller, required this.context});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        // Camera Icon to pick images
        GestureDetector(
          onTap: ()=>controller.pickImagesFromGallery(context),
          child: Container(
            width: 80.r,
            height: 80.r,
            decoration: BoxDecoration(
              color: AppColors.primaryColor,
              borderRadius: BorderRadius.circular(20.r),
            ),
            child: Center(
              child: Icon(
                Iconsax.camera,
                size: 32.r,
                color: Colors.white,
              ),
            ),
          ),
        ),
        Gap(16.h),
        // Display selected images horizontally
        Obx(() {
          return controller.selectedImages.isEmpty
              ? Container() // No images selected
              : Row(
            children: controller.selectedImages.map((image) {
              return Stack(
                children: [
                  Container(
                    width: 80.r,
                    height: 80.r,
                    margin: EdgeInsets.only(right: 8.w),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16.r),
                      image: DecorationImage(
                        image: FileImage(image),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Positioned(
                    top: 0,
                    right: 0,
                    child: GestureDetector(
                      onTap: () => controller.removeImage(image),
                      child: Container(
                        padding: EdgeInsets.all(4),
                        decoration: BoxDecoration(
                          color: Colors.black.withOpacity(0.6),
                          shape: BoxShape.circle,
                        ),
                        child: Icon(
                          Icons.close,
                          size: 16,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              );
            }).toList(),
          );
        }),
      ],
    );
  }
}