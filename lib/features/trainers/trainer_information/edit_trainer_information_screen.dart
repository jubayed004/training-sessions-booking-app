import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax/iconsax.dart';
import 'package:my_trainer/core/router/route_path.dart';
import 'package:my_trainer/core/router/routes.dart';
import 'package:my_trainer/features/trainers/trainer_information/controller/trainer_information_controller.dart';
import 'package:my_trainer/features/trainers/trainer_information/widgets/specialization_chips.dart';
import 'package:my_trainer/features/trainers/trainer_information/widgets/trainer_image_picker.dart';
import 'package:my_trainer/helper/validator/text_field_validator.dart';
import 'package:my_trainer/share/widgets/align/custom_align_text.dart';
import 'package:my_trainer/share/widgets/button/custom_button.dart';
import 'package:my_trainer/share/widgets/specialization/specialization.dart';
import 'package:my_trainer/share/widgets/text_field/custom_text_field.dart';
import 'package:my_trainer/share/widgets/text_field/description_text_field.dart';
import 'package:my_trainer/utils/app_strings/app_strings.dart';
import 'package:my_trainer/utils/color/app_colors.dart';
import 'package:my_trainer/utils/extension/base_extension.dart';

class EditTrainerInformationScreen extends StatefulWidget {
  const EditTrainerInformationScreen({super.key});

  @override
  State<EditTrainerInformationScreen> createState() => _EditTrainerInformationScreenState();
}

class _EditTrainerInformationScreenState extends State<EditTrainerInformationScreen> {
  final descriptionController = TextEditingController();
  final Set<String> _selectedSpecializations = {'Strength training'};
  @override
  Widget build(BuildContext context) {

    final TrainerInformationController controller = Get.put(TrainerInformationController());

    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: AppBar(
        scrolledUnderElevation: 0,
        backgroundColor: Colors.transparent,
        title: Text("Edit Trainer Information".tr),
        centerTitle: true,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 20),
          child: Column(
            children: [
              CustomAlignText(text: AppStrings.uploadMorePhotosMaxThree.tr),
              Gap(12),
              TrainerImagePicker(controller: controller,context: context,),
              Gap(12),
              CustomAlignText(
                text: 'Specializations:',
              ),
              Gap(12.h),
              SpecializationChips(
                specializations: [
                  'Weight loss', 'Strength training', 'CrossFit', 'Yoga',
                  'HIIT', 'Pilates', 'Nutritional advice', 'Rehabilitation',
                  'Prenatal training'
                ],
                selectedSpecializations: _selectedSpecializations,
                onSelectionChanged: (String specialization) {
                  setState(() {
                    if (_selectedSpecializations.contains(specialization)) {
                      _selectedSpecializations.remove(specialization);
                    } else {
                      _selectedSpecializations.add(specialization);
                    }
                  });
                },
              ),
              Gap(24),
              CustomAlignText(text: AppStrings.aboutYou.tr,),
             Gap(12),
              DescriptionTextField(
                hintText: "Share details of your own experience at this place",
                hintStyle: TextStyle(color: Colors.grey.withAlpha(958),overflow: TextOverflow.visible ,),
                backgroundColor: Colors.white,
               // radius: 10,
                contentPadding: EdgeInsets.all(14),
                controller: descriptionController,
                maxLines: 10,
              ),
              Gap(4),
              CustomAlignText(text: "498/500".tr,alignment: Alignment.centerRight,),
              Gap(24),
              CustomTextField(
                title: AppStrings.studioName.tr,
                hintText: "e.g. B. Johnson",
                keyboardType: TextInputType.name,
                validator: TextFieldValidator.name(),
              ),
              Gap(14),
              CustomTextField(
                title: AppStrings.address.tr,
                hintText: AppStrings.yourStreetAndHouseNumber.tr,
                keyboardType: TextInputType.name,
                validator: TextFieldValidator.address(),
              ),
              Gap(14),
              CustomTextField(
                title: AppStrings.city.tr,
                hintText: AppStrings.egBBerlin.tr,
                keyboardType: TextInputType.streetAddress,
                validator: TextFieldValidator.city(),
              ),
              Gap(14),
              CustomTextField(
                title: AppStrings.zipCode.tr,
                hintText: AppStrings.egEg12207.tr,
                keyboardType: TextInputType.streetAddress,
                validator: TextFieldValidator.zipcode(),
              ),
              Gap(14),
              CustomTextField(
                title: AppStrings.country.tr,
                hintText: AppStrings.egEgGermany.tr,
                keyboardType: TextInputType.streetAddress,
                validator: TextFieldValidator.country(),
              ),
              Gap(14),
              CustomTextField(
                title: AppStrings.instagramUrl.tr,
                hintText: AppStrings.enterYourInstagramUrl.tr,
                keyboardType: TextInputType.streetAddress,
                validator: TextFieldValidator.country(),
              ),
              Gap(14),
              CustomTextField(
                title: AppStrings.personalWebsiteUrl.tr,
                hintText: AppStrings.enterYourPersonalWebsiteUrl.tr,
                keyboardType: TextInputType.streetAddress,
                validator: TextFieldValidator.country(),
              ),
              Gap(14),
              CustomTextField(
                title: AppStrings.yearOfExperience.tr,
                hintText: "Enter years of experience".tr,
                keyboardType: TextInputType.streetAddress,
                validator: TextFieldValidator.country(),
              ),
              Gap(16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Certification name".tr,style: context.bodyLarge,),
                  TextButton(onPressed: (){}, child:Text("Add more".tr,style: context.labelSmall.copyWith(
                      color: AppColors.primaryColor
                  ),)),

                ],
              ),
              ...List.generate(3, (index){
                return Container(
                  margin: EdgeInsets.only(bottom: 6),
                  padding: EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    color: Colors.white
                  ),
                  child: Row(
                    children: [
                      Icon(Iconsax.verify,size: 18,),
                      Gap(6),
                      Text("Fitness B License".tr,style: context.bodyMedium,),
                      Spacer(),
                      Icon(Iconsax.trash)
                    ],
                  ),
                );
              }),
              Gap(16),
              CustomButton(text: AppStrings.update.tr,onTap: ()=>AppRouter.route.pop(),)

            ],
          ),
        ),
      ),
    );
  }
}


