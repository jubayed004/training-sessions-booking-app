import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax/iconsax.dart';
import 'package:my_trainer/core/custom_assets/assets.gen.dart';
import 'package:my_trainer/core/router/route_path.dart';
import 'package:my_trainer/core/router/routes.dart';
import 'package:my_trainer/features/user/profile/widgets/profile_social_link.dart';
import 'package:my_trainer/share/widgets/align/custom_align_text.dart';
import 'package:my_trainer/share/widgets/button/custom_button.dart';
import 'package:my_trainer/share/widgets/certificate_dialog/certificate_dialog.dart';
import 'package:my_trainer/share/widgets/network_image/custom_network_image.dart';
import 'package:my_trainer/share/widgets/see_more_text/see_more_text.dart';
import 'package:my_trainer/utils/app_strings/app_strings.dart';
import 'package:my_trainer/utils/color/app_colors.dart';
import 'package:my_trainer/utils/config/app_config.dart';
import 'package:my_trainer/utils/extension/base_extension.dart';

class TrainerInformationScreen extends StatelessWidget {
  const TrainerInformationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<String> images = [
      "https://ironbullstrength.com/cdn/shop/articles/Best_Workout_Plan_for_Gaining_Muscle.webp?v=1704212230",
      "https://img.freepik.com/free-photo/woman-with-visible-abs-doing-fitness_23-2150228920.jpg?semt=ais_hybrid&w=740&q=80",
      "https://img.freepik.com/premium-photo/intensive-workout-with-kettlebell_926199-1991283.jpg",
    ];

    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: AppBar(scrolledUnderElevation: 0, backgroundColor: Colors.transparent, title: Text("Trainer Information".tr), centerTitle: true),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 20),
          child: Column(
            children: [
              CarouselSlider(
                options: CarouselOptions(height: 200, viewportFraction: 1, autoPlay: true),
                items: images.map((img) {
                  return Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: Image.network(img, fit: BoxFit.cover, width: double.infinity),
                    ),
                  );
                }).toList(),
              ),
              Gap(16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Text(
                        "Ann Smith, 26",
                        style: GoogleFonts.montserrat(fontWeight: FontWeight.w800, fontSize: 18.sp, color: AppColors.blackMainTextColor),
                        overflow: TextOverflow.ellipsis,
                      ),
                      Gap(6.w),
                      Assets.icons.verifyed.svg(width: 16.w, height: 16.w),
                    ],
                  ),
                  Row(
                    children: [
                      Text('4.9', style: context.titleMedium),
                      Gap(4.w),
                      Icon(Icons.star, color: AppColors.orangeSecondaryAccentColor, size: 22.r),
                    ],
                  ),
                ],
              ),
              Gap(12),
              Wrap(
                crossAxisAlignment: WrapCrossAlignment.start,
                children: List.generate(5, (index) {
                  return Container(
                    margin: EdgeInsets.only(right: 6),
                    padding: EdgeInsets.all(4),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(color: AppColors.tertiaryTextColor, width: 1),
                    ),
                    child: Text("Stretching", style: context.labelSmall),
                  );
                }),
              ),
              Gap(24),
              CustomAlignText(
                text: AppStrings.fastFacts.tr,
                style: GoogleFonts.montserrat(fontWeight: FontWeight.w800, fontSize: 18.sp, color: AppColors.blackMainTextColor),
              ),
              Gap(8),
              ...List.generate(AppConfig.factFastList.length, (index) {
                final fact = AppConfig.factFastList[index];
                return Container(
                  margin: EdgeInsets.only(bottom: 8),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(16),
                   /* boxShadow: [BoxShadow(color: Colors.black.withValues(alpha: 0.1), spreadRadius: 1, blurRadius: 8, offset: Offset(0, 3))],*/
                  ),
                  child: ListTile(
                    leading: fact['icon'],
                    title: Text(fact['title'], style: TextStyle(fontWeight: FontWeight.bold)),
                    subtitle: Text(fact['subTitle']),
                    trailing: fact['eye'] != null
                        ? GestureDetector(
                            behavior: HitTestBehavior.opaque,
                            onTap: () {
                              showDialog(
                                context: context,
                                builder: (_) => CertificateDialog(
                                  title: "Certificate",
                                  items: [
                                    "Fitness B License",
                                    "Nutrition Coach",
                                    "Fitness B License",
                                  ],
                                ),
                              );

                            },
                            child: fact['eye'],
                          )
                        : null,
                  ),
                );
              }),
              Gap(24),
              CustomAlignText(
                text: "About me",
                style: GoogleFonts.montserrat(fontWeight: FontWeight.w800, fontSize: 18.sp, color: AppColors.blackMainTextColor),
              ),
              Gap(8),
              Container(
                padding: EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(color: AppColors.backgroundsLinesColor, width: 1),
                ),
                child: ExpandableText(
                  text:
                      'This is a very long text that will overflow and be truncated if it exceeds the maximum allowed lines. '
                      'When the user clicks on, the text will expand to show the full content. '
                      'This allows you to provide a better user experience by only showing relevant content initially.',
                  textStyle: context.bodyMedium,
                  buttonStyle: context.titleMedium.copyWith(color: AppColors.orangeSecondaryAccentColor),
                  maxLines: 3, // You can adjust the maxLines as needed
                ),
              ),
              Gap(24),
              CustomAlignText(
                text: "Reviews (23)",
                style: GoogleFonts.montserrat(
                  fontWeight: FontWeight.w800,
                  fontSize: 18.sp,
                  color: AppColors.blackMainTextColor,
                ),
              ),
              Gap(12),

              SizedBox(
                height: 160.h, // fixed height for horizontal list
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: 10,
                  padding: EdgeInsets.only(right: 12),
                  itemBuilder: (context, index) {
                    return Container(
                      width: 280.w, // NECESSARY for horizontal list
                      margin: EdgeInsets.only(right: 12),
                      padding: EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: AppColors.backgroundsLinesColor,
                          width: 1,
                        ),
                        borderRadius: BorderRadius.circular(16),
                        color: Colors.white,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [

                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [

                              Row(
                                spacing: 12,
                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(10),
                                    child: CustomNetworkImage(
                                      width: 45.w,
                                      height: 45.h,
                                      imageUrl:
                                      "https://ironbullstrength.com/cdn/shop/articles/Best_Workout_Plan_for_Gaining_Muscle.webp?v=1704212230",
                                    ),
                                  ),
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Ann Smith",
                                        style: GoogleFonts.montserrat(
                                          fontWeight: FontWeight.w800,
                                          fontSize: 16.sp,
                                          color: AppColors.blackMainTextColor,
                                        ),
                                      ),
                                      Text(
                                        "24-10-2025",
                                        style: context.labelSmall,
                                      ),
                                    ],
                                  ),
                                ],
                              ),

                              Row(
                                children: [
                                  Text('4.9', style: context.titleMedium),
                                  Gap(4.w),
                                  Icon(
                                    Icons.star,
                                    color: AppColors.orangeSecondaryAccentColor,
                                    size: 20.r,
                                  ),
                                ],
                              ),
                            ],
                          ),

                          Gap(10),

                          Expanded(
                            child: Text(
                              "Lorem ipsum dolor sit amet consectetur. Felis et lacus ut egestas urna aliquam scelerisque pretium mauris.",
                              maxLines: 3,
                              overflow: TextOverflow.ellipsis,
                              style: context.bodyMedium,
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
              Gap(12),
              TextButton(onPressed: (){}, child: Text("View all reviews",)),
              Gap(12),
              ProfileSocialLink(title: 'Instagram', icon: Iconsax.instagram),
              ProfileSocialLink(title: 'Protfolio', icon: Iconsax.global),
              ProfileSocialLink(title: 'LinkedIn', icon: Iconsax.link, isLast: false),
              Gap(12),
              CustomButton(text: AppStrings.edit.tr,onTap: ()=>AppRouter.route.pushNamed(RoutePath.editTrainerInformationScreen),)

            ],
          ),
        ),
      ),
    );
  }

}
