import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax/iconsax.dart';
import 'package:my_trainer/core/router/routes.dart';
import 'package:my_trainer/share/widgets/align/custom_align_text.dart';
import 'package:my_trainer/share/widgets/button/custom_button.dart';
import 'package:my_trainer/utils/app_strings/app_strings.dart';
import 'package:my_trainer/utils/color/app_colors.dart';
import 'package:my_trainer/utils/extension/base_extension.dart';

class PackageAndPriceScreen extends StatefulWidget {
  const PackageAndPriceScreen({super.key});

  @override
  State<PackageAndPriceScreen> createState() => _PackageAndPriceScreenState();
}

class _PackageAndPriceScreenState extends State<PackageAndPriceScreen> {
  final ValueNotifier<bool> isConnect = ValueNotifier(true);
  final ValueNotifier<int> _selectedRadio = ValueNotifier<int>(0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: AppBar(
        scrolledUnderElevation: 0,
        backgroundColor: Colors.transparent,
        title: Text(AppStrings.packageAndPrice.tr),
        centerTitle: true,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(vertical: 20, horizontal: 16),
          child: Column(
            children: [
              Container(
                width: context.screenWidth,
                padding: EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: AppColors.backgroundsLinesColor, width: 1),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Column(
                  spacing: 12,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Free Trial".tr, style: context.bodyLarge),
                        ValueListenableBuilder<bool>(
                          valueListenable: isConnect,
                          builder: (context, value, child) {
                            return Transform.scale(
                              scale: 0.6,
                              child: Switch(
                                value: isConnect.value,
                                onChanged: (value) {
                                  isConnect.value = value;
                                },
                                activeColor: Colors.white,
                                activeTrackColor: AppColors.orangeSecondaryAccentColor,
                                inactiveThumbColor: Colors.white,
                                inactiveTrackColor: const Color(0xFFE5E7EB),
                                materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                    Text("one per client".tr, style: context.labelSmall),
                  ],
                ),
              ),
              Gap(12),
              Container(
                padding: EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: AppColors.backgroundsLinesColor, width: 1),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(AppStrings.cancelAndReschedulePolice.tr, style: context.bodyLarge),
                    Row(
                      spacing: 12,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        ValueListenableBuilder<int>(
                          valueListenable: _selectedRadio,
                          builder: (context, value, child) {
                            return Radio<int>(

                              activeColor: AppColors.primaryColor,
                              value: 0, // Option 1
                              groupValue: _selectedRadio.value,
                              onChanged: (int? newValue) {
                                if (newValue != null) {
                                  _selectedRadio.value = newValue;
                                }
                              },
                            );
                          },
                        ),
                        Text(AppStrings.alwaysFree.tr, style: context.bodyMedium),
                      ],
                    ),
                    Row(
                      spacing: 12,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        ValueListenableBuilder<int>(
                          valueListenable: _selectedRadio,
                          builder: (context, value, child) {
                            return Radio<int>(
                              activeColor: AppColors.primaryColor,
                              value: 1, // Option 2
                              groupValue: _selectedRadio.value,
                              onChanged: (int? newValue) {
                                if (newValue != null) {
                                  _selectedRadio.value = newValue;
                                }
                              },
                            );
                          },
                        ),
                        Text('up to 12h'.tr, style: context.bodyMedium),
                      ],
                    ),
                    Row(
                      spacing: 12,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        ValueListenableBuilder<int>(
                          valueListenable: _selectedRadio,
                          builder: (context, value, child) {
                            return Radio<int>(
                              activeColor: AppColors.primaryColor,
                              value: 2, // Option 3
                              groupValue: _selectedRadio.value,
                              onChanged: (int? newValue) {
                                if (newValue != null) {
                                  _selectedRadio.value = newValue;
                                }
                              },
                            );
                          },
                        ),
                        Text('up to 24 hours'.tr, style: context.bodyMedium),
                      ],
                    ),
                  ],
                ),
              ),
              Gap(24),
              CustomAlignText(text: "Session packages".tr, style: context.bodyMedium,),
              Gap(8),
              ...List.generate(3, (index){
                return Container(
                  margin: EdgeInsets.only(bottom: 8),
                  padding: EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    color: Colors.white,
                  ),
                  child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          padding:EdgeInsets.all(14) ,
                          decoration: BoxDecoration(
                            color: AppColors.backgroundsLinesColor,
                            borderRadius: BorderRadius.circular(16),
                          ),
                          child: Icon(Iconsax.ticket,color: AppColors.black,),
                        ),
                        Gap(16),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("1 session".tr,style: GoogleFonts.montserrat(
                                fontSize: 14.sp,
                                fontWeight: FontWeight.w800,
                                color: AppColors.blackMainTextColor
                            ),),
                            Text("€30",
                              style: context.labelSmall,),
                            Text("edit",style: context.titleSmall,)
                          ],
                        ),
                        Spacer(),
                        ValueListenableBuilder<bool>(
                          valueListenable: isConnect,
                          builder: (context, value, child) {
                            return Transform.scale(
                              scale: 0.6,
                              child: Switch(
                                value: isConnect.value,
                                onChanged: (value) {
                                  isConnect.value = value;
                                },
                                activeColor: Colors.white,
                                activeTrackColor: AppColors.orangeSecondaryAccentColor,
                                inactiveThumbColor: Colors.white,
                                inactiveTrackColor: const Color(0xFFE5E7EB),
                                materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                              ),
                            );
                          },
                        ),
                      ]
                  ),
                );
              }),
              Gap(44),
              CustomButton(text: "save".tr,onTap: ()=>AppRouter.route.pop(),)
            ],
          ),
        ),
      ),
    );
  }
}
