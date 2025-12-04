import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:my_trainer/core/router/route_path.dart';
import 'package:my_trainer/core/router/routes.dart';
import 'package:my_trainer/features/user/bookings/widgets/reschedule_modal_bottom_sheet.dart';
import 'package:my_trainer/features/user/profile/widgets/profile_menu_item.dart';
import 'package:my_trainer/features/user/profile/widgets/profile_section_title.dart';
import 'package:my_trainer/features/user/profile/widgets/profile_social_link.dart';
import 'package:my_trainer/share/widgets/button/custom_button.dart';
import 'package:my_trainer/share/widgets/network_image/custom_network_image.dart';
import 'package:my_trainer/utils/app_strings/app_strings.dart';
import 'package:my_trainer/utils/color/app_colors.dart';
import 'package:my_trainer/utils/extension/base_extension.dart';

class AccountScreen extends StatelessWidget {
  const AccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: AppBar(
        scrolledUnderElevation: 0,
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(
          "mytrainerr.",
          style: context.headlineSmall.copyWith(color:  AppColors.appbarTextColor, letterSpacing: -0.5),
        ),


      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 16.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Column(
                  children: [
                    Gap(12.h),
                    CustomNetworkImage(
                      width: context.width/3,
                      height: context.height/7,
                      imageUrl: "https://fitnglam.ae/wp-content/uploads/2022/05/unsplash_HHXdPG_eTIQ-1-1.png",
                      fit: BoxFit.cover,
                      borderRadius: BorderRadius.circular(20.r),
                    ),
                    Text(
                      'Alex Doe',
                      style: context.headlineSmall,
                    ),
                    Gap(4.h),
                    Text(
                      'alex.doe@email.com',
                      style:context.bodySmall,
                    ),
                  ],
                ),
              ),
              Gap(32.h),
              ProfileSectionTitle(title: AppStrings.accountSection.tr),
              Gap(12.h),
              ProfileMenuItem(title: AppStrings.personalInformation.tr, onTap: ()=>AppRouter.route.pushNamed(RoutePath.personalInformationScreen)),
              ProfileMenuItem(title: "Trainer Information", onTap: ()=>AppRouter.route.pushNamed(RoutePath.trainerInformationScreen)),
              ProfileMenuItem(title: "Package and Price", onTap: ()=>AppRouter.route.pushNamed(RoutePath.packageAndPriceScreen)),
              ProfileMenuItem(title: "My Availability", onTap: ()=>AppRouter.route.pushNamed(RoutePath.myAvailiabilityScreen)),
              ProfileMenuItem(title: "Connected Account", onTap: ()=>AppRouter.route.pushNamed(RoutePath.connectedAccountScreen)),
              ProfileMenuItem(title: "Earnings".tr, onTap: ()=>AppRouter.route.pushNamed(RoutePath.earningsScreen), isLast: true),
              Gap(24.h),
              ProfileSectionTitle(title: 'SETTINGS SECTION'.tr),
              Gap(12.h),
              ProfileMenuItem(title: AppStrings.pushNotifications.tr, onTap: ()=>AppRouter.route.pushNamed(RoutePath.pushNotificationScreen)),
              ProfileMenuItem(title: AppStrings.passwordAndSecurity.tr, onTap: ()=>AppRouter.route.pushNamed(RoutePath.passwordAndSecurityScreen), isLast: true),
              Gap(24.h),
              ProfileSectionTitle(title: AppStrings.supportAndLegalSection.tr),
              Gap(12.h),
              ProfileMenuItem(title: AppStrings.aboutUs.tr, onTap: ()=>AppRouter.route.pushNamed(RoutePath.aboutUsScreen)),
              ProfileMenuItem(title: AppStrings.contact.tr, onTap: ()=>AppRouter.route.pushNamed(RoutePath.contactScreen)),
              ProfileMenuItem(title: AppStrings.termsOfUse.tr, onTap: ()=>AppRouter.route.pushNamed(RoutePath.termsAndConditionsScreen)),
              ProfileMenuItem(title: AppStrings.privacyPolicy.tr, onTap: ()=>AppRouter.route.pushNamed(RoutePath.privacyPolicyScreen)),
              ProfileMenuItem(title: AppStrings.imprint.tr, onTap: ()=>AppRouter.route.pushNamed(RoutePath.imprintScreen)),
              ProfileMenuItem(title: AppStrings.codeOfConduct.tr, onTap: ()=>AppRouter.route.pushNamed(RoutePath.codeOfConductScreen), isLast: true),
              Gap(24.h),
              CustomButton(text: AppStrings.logOut.tr,onTap: (){
                showRescheduleModal(
                  context,
                  title: 'Hey!'.tr,
                  message: 'Are you sure you want to Logout your account?'.tr,
                  confirmButtonText: AppStrings.logOut.tr,
                  onConfirm: ()=>AppRouter.route.goNamed(RoutePath.loginScreen),
                );
              },),
              Gap(24.h),
              ProfileSectionTitle(title: 'SOCIAL LINK'.tr),
              Gap(12.h),
              ProfileSocialLink(title: 'Instagram', icon: Iconsax.instagram),
              ProfileSocialLink(title: 'TikTok', icon: Iconsax.music),
              ProfileSocialLink(title: 'LinkedIn', icon: Iconsax.link, isLast: true),

              Gap(30.h),
            ],
          ),
        ),
      ),
    );
  }
}
