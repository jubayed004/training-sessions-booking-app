
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:my_trainer/core/router/route_path.dart';
import 'package:my_trainer/core/router/routes.dart';
import 'package:my_trainer/features/user/profile/widgets/profile_menu_item.dart';
import 'package:my_trainer/features/user/profile/widgets/profile_section_title.dart';
import 'package:my_trainer/features/user/profile/widgets/profile_social_link.dart';
import 'package:my_trainer/share/widgets/button/custom_button.dart';
import 'package:my_trainer/share/widgets/network_image/custom_network_image.dart';
import 'package:my_trainer/utils/app_strings/app_strings.dart';
import 'package:my_trainer/utils/color/app_colors.dart';


class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        scrolledUnderElevation: 0,
        title: Text(
          "mytrainerr.".tr,
          style: Theme.of(context).textTheme.headlineSmall?.copyWith(
            color: AppColors.appbarTextColor,
            letterSpacing: -0.5,
          ),
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
                      width: context.width/2,
                      height: context.height/5,
                        imageUrl: "https://fitnglam.ae/wp-content/uploads/2022/05/unsplash_HHXdPG_eTIQ-1-1.png",
                      fit: BoxFit.cover,
                      borderRadius: BorderRadius.circular(20.r),
                    ),
                    Text(
                      'Alex Doe',
                      style: context.textTheme.headlineSmall,
                    ),
                    Gap(4.h),
                    Text(
                      'alex.doe@email.com',
                      style:context.textTheme.bodySmall,
                    ),
                  ],
                ),
              ),
              Gap(32.h),
              ProfileSectionTitle(title: AppStrings.accountSection.tr),
              Gap(12.h),
              ProfileMenuItem(title: AppStrings.personalInformation.tr, onTap: ()=>AppRouter.route.pushNamed(RoutePath.personalInformationScreen)),
              ProfileMenuItem(title: AppStrings.favoriteTrainer.tr, onTap: () {}),
              ProfileMenuItem(title: "My Trainer".tr, onTap: () {}, isLast: true),
              Gap(24.h),
               ProfileSectionTitle(title: 'SETTINGS SECTION'.tr),
              Gap(12.h),
              ProfileMenuItem(title: AppStrings.pushNotifications.tr, onTap: ()=>AppRouter.route.pushNamed(RoutePath.pushNotificationScreen)),
              ProfileMenuItem(title: AppStrings.passwordAndSecurity.tr, onTap: ()=>AppRouter.route.pushNamed(RoutePath.passwordAndSecurityScreen), isLast: true),
              Gap(24.h),
               ProfileSectionTitle(title: AppStrings.supportAndLegalSection.tr),
              Gap(12.h),
              ProfileMenuItem(title: AppStrings.aboutUs.tr, onTap: () {}),
              ProfileMenuItem(title: AppStrings.contact.tr, onTap: () {}),
              ProfileMenuItem(title: AppStrings.termsOfUse.tr, onTap: () {}),
              ProfileMenuItem(title: AppStrings.privacyPolicy.tr, onTap: () {}),
              ProfileMenuItem(title: AppStrings.imprint.tr, onTap: () {}),
              ProfileMenuItem(title: AppStrings.codeOfConduct.tr, onTap: () {}, isLast: true),
              Gap(24.h),
              CustomButton(text: AppStrings.logOut.tr,),
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
// ... (Other helper widgets like _buildAppBar and _buildProfileHeader remain here)
}