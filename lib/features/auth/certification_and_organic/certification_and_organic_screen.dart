import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax/iconsax.dart';
import 'package:my_trainer/core/router/route_path.dart';
import 'package:my_trainer/core/router/routes.dart';
import 'package:my_trainer/features/auth/widgets/up_progress_bar.dart';
import 'package:my_trainer/helper/validator/text_field_validator.dart';
import 'package:my_trainer/share/widgets/align/custom_align_text.dart';

// --- Assuming these reusable components exist ---
import 'package:my_trainer/share/widgets/button/custom_button.dart';
import 'package:my_trainer/share/widgets/text_field/custom_text_field.dart';
import 'package:my_trainer/utils/app_strings/app_strings.dart';
import 'package:my_trainer/utils/color/app_colors.dart';
import 'package:my_trainer/utils/extension/base_extension.dart';
// -----------------------------------------------

class CertificationAndOrganicScreen extends StatefulWidget {
  const CertificationAndOrganicScreen({super.key});

  @override
  State<CertificationAndOrganicScreen> createState() => _CertificationAndOrganicScreenState();
}

class _CertificationAndOrganicScreenState extends State<CertificationAndOrganicScreen> {
  bool _isOrganicCertified = false;
  final _certificationNameController = TextEditingController();

  @override
  void dispose() {
    _certificationNameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final primaryTextColor = const Color(0xFF1F2937);
    final secondaryTextColor = const Color(0xFF6B7280);

    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    final containerColor = isDarkMode ? AppColors.black : Colors.white;
    final borderColor = isDarkMode ? Colors.grey.shade700 : Colors.grey.shade300;
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
        centerTitle: true,

      ),

      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 16.w,vertical: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

             UpProgressBar(currentStep: 4),
              Gap(24.h),

              Text(
                'Certification & Organic'.tr,
                style: GoogleFonts.montserrat(
                  fontWeight: FontWeight.w800,
                  fontSize: 20.sp,
                  color: primaryTextColor,
                ),
              ),
              Gap(8.h),
              Text(
                'Upload your certificates and organic certification'.tr,
                style: GoogleFonts.montserrat(
                  fontWeight: FontWeight.w500,
                  fontSize: 14.sp,
                  color: secondaryTextColor,
                ),
              ),
              Gap(16),
              CustomTextField(
                fillColor: AppColors.white,
                title: AppStrings.certificate.tr,
                hintText: AppStrings.egEgPeakFitGym.tr,
                keyboardType: TextInputType.name,
                validator: TextFieldValidator.name(),
              ),
              Gap(16.h),
              CustomAlignText(text: 'Certification'),
              /*_buildSectionTitle('Certification'),*/
              Gap(16.h),

              _buildUploadCertificationContainer(),
              Gap(16.h),
              Container(
                width: MediaQuery.of(context).size.width,
                padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 14.h),
                decoration: BoxDecoration(
                  color: containerColor,
                  borderRadius: BorderRadius.circular(12.r),

                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(spacing: 10,
                      children: [
                        Icon(Iconsax.document_upload),
                        Text(
                          "NASM CPT certificate.pdf",
                          style: context.titleSmall,
                          overflow: TextOverflow.ellipsis,
                        ),

                      ],
                    ),
                    Icon(Icons.delete_outline_rounded),
                  ],
                ),
              ),
              Gap(16),
              CustomTextField(
                fillColor: AppColors.white,
                title: AppStrings.aboutYou.tr,
                hintText: AppStrings.tellClientsAboutYourBackground.tr,
                keyboardType: TextInputType.name,
                validator: TextFieldValidator.description(),
              ),
              Gap(40.h),
              CustomButton(
                text: AppStrings.continueText.tr,
                onTap: ()=>AppRouter.route.pushNamed(RoutePath.verifyIdentityScreen),
              ),
              Gap(32.h),
            ],
          ),
        ),
      ),
    );
  }


  Widget _buildUploadCertificationContainer() {
    final borderColor = AppColors.primaryColor;
    return DottedBorder(
      options: RectDottedBorderOptions(
        dashPattern: [10, 8],
        strokeWidth: 2,
        color: AppColors.primaryColor,
        padding: EdgeInsets.all(16),
      ),
      child:  Center(
        child: Column(
          children: [
            Container(
              width: 50.r,
              height: 50.r,
              decoration: BoxDecoration(
                color: borderColor.withValues(alpha: 0.1),
                borderRadius: BorderRadius.circular(10.r),
              ),
              child: Icon(
                Iconsax.document_upload,
                size: 24.r,
                color: borderColor,
              ),
            ),
            Gap(12.h),
            Text(
              'Upload your certificate here'.tr,
              style: context.titleSmall,
            ),
            Gap(4.h),
            Text(
              'Max. 5MB, accepted formats: JPG, PNG, PDF'.tr,
              style: context.bodySmall,
            ),
          ],
        ),
      ),
    );
  }
}
