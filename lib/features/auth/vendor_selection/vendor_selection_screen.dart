import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_trainer/core/router/route_path.dart';
import 'package:my_trainer/core/router/routes.dart';
import 'package:my_trainer/share/widgets/button/custom_button.dart';
import 'package:my_trainer/utils/app_strings/app_strings.dart';
import 'package:my_trainer/utils/color/app_colors.dart';

class VendorSelectionScreen extends StatelessWidget {
  const VendorSelectionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/vendorseletionimage.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.only(left: 16.0,right: 16,bottom: 56),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                      onTap: ()=>AppRouter.route.pop(),
                        child: Icon(Icons.arrow_back,color: Theme.of(context).iconTheme.color,)),
                    RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: 'mytrainer.',
                            style: Theme.of(context).textTheme.headlineSmall?.copyWith(color:isDarkMode?Colors.white: Color(0xFFE94E6C),letterSpacing: -0.5),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(),
                  ],
                ),
                const Spacer(),
                Column(
                  children: [
                    Text(
                        AppStrings.chooseYourRole.tr,
                        style: GoogleFonts.montserrat(
                            fontWeight: FontWeight.w800,
                            fontSize: 24.sp,
                            color:isDarkMode ? AppColors.white : AppColors.blackMainTextColor
                        )
                    ),
                    Gap(12),
                    Text(
                      AppStrings.selectHowYouWantToUseMytrainerr.tr,
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        color: isDarkMode ? Colors.white : AppColors.grayTextSecondaryColor
                      ),
                    ),
                    Gap(32),
                    CustomButton(
                        onTap: ()=>AppRouter.route.pushNamed(RoutePath.vendorSelectionScreen),
                        text: AppStrings.continueAsClient.tr
                    ),
                    Gap(16),
                    CustomButton(
                        onTap: ()=>AppRouter.route.pushNamed(RoutePath.vendorSelectionScreen),
                        text: AppStrings.continueAsTrainer.tr
                    ),

                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
