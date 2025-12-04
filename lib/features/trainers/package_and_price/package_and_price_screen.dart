import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_trainer/utils/app_strings/app_strings.dart';
import 'package:my_trainer/utils/color/app_colors.dart';
import 'package:my_trainer/utils/extension/base_extension.dart';

class PackageAndPriceScreen extends StatefulWidget {
   const PackageAndPriceScreen({super.key});

  @override
  State<PackageAndPriceScreen> createState() => _PackageAndPriceScreenState();
}

class _PackageAndPriceScreenState extends State<PackageAndPriceScreen> {
ValueNotifier<bool> isConnect = ValueNotifier(true);

String? _selectedValue;
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: AppBar(scrolledUnderElevation: 0, backgroundColor: Colors.transparent, title: Text(AppStrings.packageAndPrice.tr), centerTitle: true),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(vertical: 20,horizontal: 16),
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
                      mainAxisAlignment: MainAxisAlignment
                      .spaceBetween,
                      children: [
                        Text("Free Trial".tr, style: context.bodyLarge),
                        ValueListenableBuilder<bool>(
                          valueListenable: isConnect,
                          builder: (context, value, chin){
                            return Transform.scale(
                              scale: 0.8,
                              child: Switch(
                                value: isConnect.value,
                                onChanged: (value){
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
                    Text(
                      "one per client".tr,
                      style: context.labelSmall,
                    ),
                  ],
                ),
              ),
              Gap(12),

              Container(
                padding: EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: AppColors.backgroundsLinesColor,width: 1),
                  borderRadius: BorderRadius.circular(16),

                ),
                child: Column(

                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(AppStrings.cancelAndReschedulePolice.tr,style: context.bodyLarge,),
                    Row(
                      spacing: 12,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Radio<String>(
                          value: "Option 1",
                          groupValue: _selectedValue,
                          onChanged: (String? value) {
                            setState(() {
                              _selectedValue = value;
                            });
                          },
                        ),
                        Text(AppStrings.alwaysFree.tr,style: context.bodyMedium,)

                      ],
                    ),
                    Row(
                      spacing: 12,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Radio<String>(
                          value: "Option 1",
                          groupValue: _selectedValue,
                          onChanged: (String? value) {
                            setState(() {
                              _selectedValue = value;
                            });
                          },
                        ),
                        Text(AppStrings.alwaysFree.tr,style: context.bodyMedium,)

                      ],
                    ),
                    Row(
                      spacing: 12,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Radio<String>(
                          value: "Option 1",
                          groupValue: _selectedValue,
                          onChanged: (String? value) {
                            setState(() {
                              _selectedValue = value;
                            });
                          },
                        ),
                        Text(AppStrings.alwaysFree.tr,style: context.bodyMedium,),


                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
