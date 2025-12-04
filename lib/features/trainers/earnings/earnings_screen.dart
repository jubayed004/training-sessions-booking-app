import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax/iconsax.dart';
import 'package:my_trainer/core/custom_assets/assets.gen.dart';
import 'package:my_trainer/share/widgets/align/custom_align_text.dart';
import 'package:my_trainer/utils/app_strings/app_strings.dart';
import 'package:my_trainer/utils/color/app_colors.dart';
import 'package:my_trainer/utils/extension/base_extension.dart';

class EarningsScreen extends StatelessWidget {
  const EarningsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: AppBar(scrolledUnderElevation: 0, backgroundColor: Colors.transparent, title: Text("Earnings".tr), centerTitle: true),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsetsGeometry.symmetric(horizontal: 16, vertical: 20),
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
                    Text(AppStrings.earningsOverview.tr, style: context.labelLarge),
                    Text(
                      "€850.00 this Month".tr,
                      style: GoogleFonts.montserrat(fontWeight: FontWeight.w800, fontSize: 14.sp, color: AppColors.blackMainTextColor),
                    ),
                  ],
                ),
              ),
              Gap(32),
              CustomAlignText(
                text: AppStrings.paymentHistory.tr,
                style: GoogleFonts.montserrat(fontWeight: FontWeight.w800, fontSize: 14.sp, color: AppColors.blackMainTextColor),
              ),
              Gap(16),
              ...List.generate(20, (index){
                return Container(
                  margin: EdgeInsets.only(bottom: 8),
                  padding: EdgeInsets.all(12),
                  decoration:BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(color: AppColors.backgroundsLinesColor,width: 1)
                  ),
                  child: Column(
                    spacing: 12,
                    children: [
                      Row(
                        spacing: 6,
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(20),
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                              ),
                              width: 24.w,
                              height: 24.h,
                              child: Assets.images.upcomeingsessionimage.image(),
                            ),
                          ),

                          Expanded(
                            flex: 4,
                            child: Text("Ann Smith".tr,style: GoogleFonts.montserrat(
                              fontWeight: FontWeight.w800,
                              fontSize: 14.sp,
                              color:  AppColors.blackMainTextColor,
                            ),),
                          ),

                          Expanded(

                            child: Text("€35.00".tr,style: GoogleFonts.montserrat(
                              fontWeight: FontWeight.w800,
                              fontSize: 14.sp,
                              color:  AppColors.primaryColor,
                            ),),
                          ),
                        ],
                      ),
                      Row(
                        spacing: 6,
                        children: [
                          Icon(Iconsax.calendar_2,size: 20,),
                          Text("21-10-2025 7:00 p.m",
                            style: context.labelSmall.copyWith(
                                color: AppColors.blackMainTextColor
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                );
              })
            ],

          ),
        ),
      ),
    );
  }
}
