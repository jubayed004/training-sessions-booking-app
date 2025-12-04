import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:my_trainer/core/router/route_path.dart';
import 'package:my_trainer/core/router/routes.dart';
import 'package:my_trainer/features/user/profile/widgets/data_display_item.dart';
import 'package:my_trainer/share/widgets/button/custom_button.dart';
import 'package:my_trainer/share/widgets/network_image/custom_network_image.dart';
import 'package:my_trainer/utils/app_strings/app_strings.dart';
class PersonalInformationScreen extends StatelessWidget {
  const PersonalInformationScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: AppBar(
        scrolledUnderElevation: 0,
        backgroundColor: Colors.transparent,
        title: Text(
          AppStrings.personalInformation.tr,
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 20.h),
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    CustomNetworkImage(
                      width: context.width/3,
                      height: context.height/7,
                      imageUrl: "https://fitnglam.ae/wp-content/uploads/2022/05/unsplash_HHXdPG_eTIQ-1-1.png",
                      fit: BoxFit.cover,
                      borderRadius: BorderRadius.circular(20.r),
                    ),
                    Gap(24.h),

                    DataDisplayItem(
                      label: AppStrings.name.tr,
                      value: 'Alex Doe',
                    ),
                    Gap(16.h),

                    DataDisplayItem(
                      label: 'Gender'.tr,
                      value: 'Male',
                    ),
                    Gap(16.h),

                    DataDisplayItem(
                      label: 'Date of Birth'.tr,
                      value: '25-06-1998',
                    ),
                    Gap(12.h),
                    DataDisplayItem(
                      label: AppStrings.address.tr,
                      value: 'Street, house number',
                    ),
                    Gap(16.h),
                    DataDisplayItem(
                      label: AppStrings.city.tr,
                      value: 'Berlin',
                    ),
                    Gap(16.h),
                    DataDisplayItem(
                      label: AutofillHints.postalCode.tr,
                      value: '12207',
                    ),
                    Gap(16.h),
                    DataDisplayItem(
                      label: AppStrings.country.tr,
                      value: 'Germany',
                    ),

                    Gap(12.h),

                    DataDisplayItem(
                      label: AppStrings.emailAddress.tr,
                      value: 'ann.smith@gmail.com',

                    ),
                    Gap(16.h),

                    // Phone Number
                    DataDisplayItem(
                      label: AppStrings.yourPhoneNumber.tr,
                      value: '+49 69 1234 5678',

                    ),

                    Gap(40.h),
                  ],
                ),
              ),
            ),

            CustomButton(
              text: AppStrings.edit.tr,
              onTap: ()=>AppRouter.route.pushNamed(RoutePath.personalInformationEditScreen),
            ),
          ],
        ),
      ),
    );
  }
}