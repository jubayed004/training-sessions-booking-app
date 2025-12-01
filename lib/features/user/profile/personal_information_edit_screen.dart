import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:get/get_utils/src/extensions/context_extensions.dart';
import 'package:my_trainer/core/router/route_path.dart';
import 'package:my_trainer/core/router/routes.dart';
import 'package:my_trainer/helper/validator/text_field_validator.dart';
import 'package:my_trainer/share/widgets/button/custom_button.dart';
import 'package:my_trainer/share/widgets/text_field/custom_text_field.dart';
import 'package:my_trainer/utils/app_strings/app_strings.dart';

class PersonalInformationEditScreen extends StatefulWidget {
  const PersonalInformationEditScreen({super.key});

  @override
  State<PersonalInformationEditScreen> createState() => _PersonalInformationEditScreenState();
}

class _PersonalInformationEditScreenState extends State<PersonalInformationEditScreen> {
  TextEditingController firstNameController = TextEditingController();
  TextEditingController genderController = TextEditingController();
  TextEditingController dobController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController cityController = TextEditingController();
  TextEditingController postalCodeController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  @override
  void dispose() {
    firstNameController.dispose();
    genderController.dispose();
    dobController.dispose();
    addressController.dispose();
    cityController.dispose();
    postalCodeController.dispose();
    phoneNumberController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: AppBar(
        scrolledUnderElevation: 0,
        backgroundColor: Colors.transparent,
        title: Text(
          'Personal Information Edit'.tr,
        ),
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
                          CustomTextField(
                            controller: firstNameController,
                            title: AppStrings.firstName.tr,
                            hintText: AppStrings.egBJohnson.tr,
                            keyboardType: TextInputType.name,
                            validator: TextFieldValidator.name(),
                          ),
                          Gap(14),

                          CustomTextField(
                            controller: genderController,
                            title: "Gender".tr,
                            hintText: "gender",
                            keyboardType: TextInputType.text,
                            validator: TextFieldValidator.gender(),
                          ),
                          Gap(14),

                          CustomTextField(
                            controller: dobController,
                            title: "Date of Birth".tr,
                            hintText: "date of birth",
                            keyboardType: TextInputType.visiblePassword,
                            validator: TextFieldValidator.dateOfBirth(),
                          ),
                          Gap(14),

                          CustomTextField(
                            controller: addressController,
                            title: AppStrings.address.tr,
                            hintText: "Enter your address",
                            keyboardType: TextInputType.streetAddress,
                            validator: TextFieldValidator.address(),
                          ),
                          Gap(14),

                          CustomTextField(
                            controller: cityController,
                            title: AppStrings.city.tr,
                            hintText: "Enter your city".tr,
                            keyboardType: TextInputType.text,
                            validator: TextFieldValidator.address(),
                          ),
                          Gap(14),

                          CustomTextField(
                            controller: postalCodeController,
                            title: "Postal Code".tr,
                            hintText: "Enter your postal code".tr,
                            keyboardType: TextInputType.visiblePassword,
                            validator: TextFieldValidator.postalCode(),
                          ),
                          Gap(14),

                          CustomTextField(
                            controller: phoneNumberController,
                            title: AppStrings.yourPhoneNumber.tr,
                            hintText: AppStrings.yourPhoneNumber.tr,
                            keyboardType: TextInputType.phone,
                            validator: TextFieldValidator.phone(),
                          ),
                          Gap(14),
                        ],
                      ),
                    ),
                  ),
                ),
                CustomButton(
                    onTap: () {
                      AppRouter.route.goNamed(RoutePath.navigationPage);
                    },
                    text: "Save the Changes"
                )
              ],
            ),
          )
      ),
    );
  }
}

