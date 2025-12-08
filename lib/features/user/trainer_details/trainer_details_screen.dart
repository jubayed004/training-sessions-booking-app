import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax/iconsax.dart';
import 'package:my_trainer/core/custom_assets/assets.gen.dart';
import 'package:my_trainer/core/router/route_path.dart';
import 'package:my_trainer/share/widgets/button/custom_button.dart';
import 'package:my_trainer/share/widgets/certificate_dialog/certificate_dialog.dart';
import 'package:my_trainer/utils/color/app_colors.dart';

class TrainerDetailsScreen extends StatefulWidget {
  const TrainerDetailsScreen({super.key});

  @override
  State<TrainerDetailsScreen> createState() => _TrainerDetailsScreenState();
}

class _TrainerDetailsScreenState extends State<TrainerDetailsScreen> {
  final PageController _pageController = PageController();
  int selectedDateIndex = 1;
  String selectedTime = '11:00';
  int _currentImageIndex = 0;

  final List<String> _images = [
    'https://images.unsplash.com/photo-1571019614242-c5c5dee9f50b?w=800',
    'https://images.unsplash.com/photo-1517836357463-d25dfeac3438?w=800',
    'https://images.unsplash.com/photo-1518611012118-696072aa579a?w=800',
  ];

  final List<Map<String, dynamic>> dates = [
    {'day': '18', 'weekday': 'M'},
    {'day': '19', 'weekday': 'D'},
    {'day': '20', 'weekday': 'M'},
    {'day': '21', 'weekday': 'D'},
    {'day': '22', 'weekday': 'F'},
    {'day': '23', 'weekday': 'S'},
    {'day': '24', 'weekday': 'S'},
  ];

  final List<String> times = [
    '11:00',
    '12:00',
    '1:00 p.m',
    '2:00 p.m',
    '3:00 p.m',
    '4:00 p.m',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SingleChildScrollView(
            padding: EdgeInsets.only(bottom: 100.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Header Image Carousel
                Stack(
                  children: [
                    SizedBox(
                      height: 300.h,
                      child: PageView.builder(
                        controller: _pageController,
                        onPageChanged: (index) {
                          setState(() {
                            _currentImageIndex = index;
                          });
                        },
                        itemCount: _images.length,
                        itemBuilder: (context, index) {
                          return Image.network(
                            _images[index],
                            fit: BoxFit.cover,
                          );
                        },
                      ),
                    ),
                    Positioned(
                      top: 40.h,
                      left: 16.w,
                      child: CircleAvatar(
                        backgroundColor: Colors.white,
                        child: IconButton(
                          icon: const Icon(
                            Icons.arrow_back,
                            color: Colors.black,
                          ),
                          onPressed: () => context.pop(),
                        ),
                      ),
                    ),
                    Positioned(
                      top: 40.h,
                      right: 16.w,
                      child: Row(
                        children: [
                          CircleAvatar(
                            backgroundColor: Colors.white,
                            child: IconButton(
                              icon: const Icon(
                                Iconsax.share,
                                color: Colors.black,
                              ),
                              onPressed: () {},
                            ),
                          ),
                          Gap(8.w),
                          CircleAvatar(
                            backgroundColor: Colors.white,
                            child: IconButton(
                              icon: const Icon(
                                Iconsax.heart,
                                color: Colors.black,
                              ),
                              onPressed: () {},
                            ),
                          ),
                        ],
                      ),
                    ),
                    Positioned(
                      bottom: 16.h,
                      left: 0,
                      right: 0,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: List.generate(_images.length, (index) {
                          return AnimatedContainer(
                            duration: const Duration(milliseconds: 300),
                            margin: EdgeInsets.symmetric(horizontal: 4.w),
                            height: 8.h,
                            width: _currentImageIndex == index ? 24.w : 8.w,
                            decoration: BoxDecoration(
                              color: _currentImageIndex == index
                                  ? Colors.white
                                  : Colors.white.withValues(alpha: 0.5),
                              borderRadius: BorderRadius.circular(4.r),
                            ),
                          );
                        }),
                      ),
                    ),
                  ],
                ),

                // Content
                Padding(
                  padding: EdgeInsets.all(16.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Trainer Name & Rating
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Text(
                                'Ann Smith, 26',
                                style: GoogleFonts.montserrat(
                                  fontSize: 20.sp,
                                  fontWeight: FontWeight.w800,
                                  color: AppColors.blackMainTextColor,
                                ),
                              ),
                              Gap(8.w),
                              Assets.icons.verifyed.svg(
                                width: 20.w,
                                height: 20.w,
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Text(
                                '4.9',
                                style: GoogleFonts.montserrat(
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.w700,
                                  color: AppColors.blackMainTextColor,
                                ),
                              ),
                              Gap(4.w),
                              Icon(Icons.star, color: Colors.amber, size: 20.r),
                            ],
                          ),
                        ],
                      ),
                      Gap(4.h),
                      // Tags
                      Row(
                        children: [
                          _buildTag('Yoga'),
                          Gap(8.w),
                          _buildTag('Stretching'),
                          Gap(8.w),
                          _buildTag('Pilates'),
                        ],
                      ),
                      Gap(20.h),

                      // Fast Facts
                      Text(
                        'Fast facts',
                        style: GoogleFonts.montserrat(
                          fontSize: 16
                              .sp, // Match design, usually ~16-18 for section headers
                          fontWeight: FontWeight
                              .w700, // Or w800/w600 depending on exact Font
                          color: AppColors.blackMainTextColor,
                          fontStyle: FontStyle.italic,
                        ),
                      ),
                      Gap(12.h),
                      _buildFastFactItem(
                        icon: Iconsax.location,
                        title: 'LOCATION',
                        subtitle: 'Los Angeles, CA – Griffith Park Fields',
                        trailingIcon: Iconsax.copy,
                      ),
                      Gap(12.h),
                      _buildFastFactItem(
                        icon: Iconsax.briefcase,
                        title: 'EXPERIENCE',
                        subtitle: '5 years',
                      ),
                      Gap(12.h),
                      _buildFastFactItem(
                        icon: Iconsax.award,
                        title: 'CERTIFICATE',
                        subtitle: '3',
                        trailingIcon: Iconsax.eye,
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
                      ),
                      Gap(20.h),

                      // About Me
                      Text(
                        'About me',
                        style: GoogleFonts.montserrat(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w800,
                          color: AppColors.blackMainTextColor,
                          fontStyle: FontStyle.italic,
                        ),
                      ),

                      Gap(8.h),
                      Text(
                        'I help my clients improve strength, mobility and balance. My focus is on holistic training and sustainable results...See More',
                        style: GoogleFonts.montserrat(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w500,
                          color: AppColors.grayTextSecondaryColor,
                          height: 1.5,
                        ),
                      ),
                      Gap(20.h),

                      // Availability Preview
                      Text(
                        'Availability preview',
                        style: GoogleFonts.montserrat(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w800,
                          color: AppColors.blackMainTextColor,
                          fontStyle: FontStyle.italic,
                        ),
                      ),
                      Gap(12.h),
                      // Dates
                      SizedBox(
                        height: 60.h,
                        child: ListView.separated(
                          scrollDirection: Axis.horizontal,
                          itemCount: dates.length,
                          separatorBuilder: (context, index) => Gap(8.w),
                          itemBuilder: (context, index) {
                            final isSelected = selectedDateIndex == index;
                            return GestureDetector(
                              onTap: () =>
                                  setState(() => selectedDateIndex = index),
                              child: Container(
                                width: 50.w,
                                decoration: BoxDecoration(
                                  color: isSelected
                                      ? AppColors.primaryColor
                                      : AppColors.bgSecondaryButtonColor,
                                  borderRadius: BorderRadius.circular(12.r),
                                  border: isSelected
                                      ? Border.all(
                                          color: AppColors.primaryColor,
                                          width: 2,
                                        )
                                      : null,
                                ),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      dates[index]['weekday'],
                                      style: GoogleFonts.montserrat(
                                        fontSize: 12.sp,
                                        fontWeight: FontWeight.w600,
                                        color: isSelected
                                            ? Colors.white
                                            : AppColors.blackMainTextColor,
                                      ),
                                    ),
                                    Text(
                                      dates[index]['day'],
                                      style: GoogleFonts.montserrat(
                                        fontSize: 14.sp,
                                        fontWeight: FontWeight.w700,
                                        color: isSelected
                                            ? Colors.white
                                            : AppColors.blackMainTextColor,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                      Gap(12.h),
                      // Times
                      Wrap(
                        spacing: 8.w,
                        runSpacing: 8.h,
                        children: times.map((time) {
                          final isSelected = selectedTime == time;
                          final isDisabled =
                              time == '1:00 p.m' ||
                              time == '3:00 p.m'; // Example logic
                          return GestureDetector(
                            onTap: isDisabled
                                ? null
                                : () => setState(() => selectedTime = time),
                            child: Container(
                              padding: EdgeInsets.symmetric(
                                horizontal: 16.w,
                                vertical: 10.h,
                              ),
                              decoration: BoxDecoration(
                                color: isSelected
                                    ? Colors.white
                                    : (isDisabled
                                          ? AppColors.bgSecondaryButtonColor
                                                .withOpacity(0.5)
                                          : AppColors.bgSecondaryButtonColor),
                                borderRadius: BorderRadius.circular(12.r),
                                border: isSelected
                                    ? Border.all(
                                        color: AppColors.blackMainTextColor,
                                        width: 1.5,
                                      )
                                    : null,
                              ),
                              child: Text(
                                time,
                                style: GoogleFonts.montserrat(
                                  fontSize: 13.sp,
                                  fontWeight: FontWeight.w600,
                                  color: isDisabled
                                      ? AppColors.grayTextSecondaryColor
                                      : (isSelected
                                            ? AppColors.blackMainTextColor
                                            : AppColors.blackMainTextColor),
                                ),
                              ),
                            ),
                          );
                        }).toList(),
                      ),
                      Gap(20.h),

                      // Cancellation Policy
                      Container(
                        padding: EdgeInsets.all(12.w),
                        decoration: BoxDecoration(
                          color: AppColors.bgSecondaryButtonColor,
                          borderRadius: BorderRadius.circular(12.r),
                        ),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Icon(
                              Iconsax.info_circle,
                              size: 20.r,
                              color: AppColors.grayTextSecondaryColor,
                            ),
                            Gap(12.w),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Cancellations Policy',
                                    style: GoogleFonts.montserrat(
                                      fontSize: 14.sp,
                                      fontWeight: FontWeight.w600,
                                      color: AppColors.blackMainTextColor,
                                    ),
                                  ),
                                  Gap(4.h),
                                  Text(
                                    'Cancellations Less Than 12 Hours Before The Session Will Be Charged.',
                                    style: GoogleFonts.montserrat(
                                      fontSize: 12.sp,
                                      fontWeight: FontWeight.w500,
                                      color: AppColors.grayTextSecondaryColor,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      Gap(20.h),

                      // Pricing Options
                      Text(
                        'Pricing options:',
                        style: GoogleFonts.montserrat(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w800,
                          color: AppColors.blackMainTextColor,
                          fontStyle: FontStyle.italic,
                        ),
                      ),
                      Gap(12.h),
                      _buildPricingCard(
                        'Trial lesson',
                        '1 TIME PER CUSTOMER',
                        '€0.00',
                        true,
                      ),
                      _buildPricingCard(
                        '1x session',
                        '1 TIME PER CUSTOMER',
                        '€30.00',
                        false,
                      ),
                      _buildPricingCard(
                        '5x session',
                        '1 TIME PER CUSTOMER',
                        '€100.00',
                        false,
                      ),
                      _buildPricingCard(
                        '10x session',
                        '1 TIME PER CUSTOMER',
                        '€180.00',
                        false,
                      ),

                      Gap(20.h),

                      // Book Now Button
                      CustomButton(
                        text: 'Book now',
                        onTap: () =>
                            context.pushNamed(RoutePath.bookingNowScreen),
                      ),
                      Gap(20.h),

                      // Reviews Header
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Reviews (23)',
                            style: GoogleFonts.montserrat(
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w800,
                              color: AppColors.blackMainTextColor,
                              fontStyle: FontStyle.italic,
                            ),
                          ),
                        ],
                      ),
                      Gap(12.h),
                      _buildReviewCard(),
                      Gap(12.h),
                      Center(
                        child: TextButton(
                          onPressed: () =>
                              context.pushNamed(RoutePath.reviewScreen),
                          child: Text("View all reviews"),
                        ),
                      ),
                      Gap(20.h),
                      // Footer Actions
                      _buildFooterAction(Iconsax.instagram, 'Instagram'),
                      Gap(12.h),
                      _buildFooterAction(Iconsax.global, 'Portfolio'),
                      Gap(12.h),
                      _buildFooterAction(
                        Iconsax.message,
                        'Chat Now',
                        isPrimary: true,
                        onTap: () => context.pushNamed(RoutePath.chatScreen),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTag(String text) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 6.h),
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.linesDarkColor),
        borderRadius: BorderRadius.circular(20.r),
      ),
      child: Text(
        text,
        style: GoogleFonts.montserrat(
          fontSize: 12.sp,
          fontWeight: FontWeight.w500,
          color: AppColors.grayTextSecondaryColor,
        ),
      ),
    );
  }

  Widget _buildFastFactItem({
    required IconData icon,
    required String title,
    required String subtitle,
    IconData? trailingIcon,
    VoidCallback? onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(12.w),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16.r),
          border: Border.all(
            color: AppColors.bgSecondaryButtonColor,
          ), // Very light border
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.02),
              blurRadius: 10,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Row(
          children: [
            Icon(icon, size: 24.r, color: AppColors.grayTextSecondaryColor),
            Gap(12.w),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title, // e.g. LOCATION - small caps
                    style: GoogleFonts.montserrat(
                      fontSize: 10.sp,
                      fontWeight: FontWeight.w600,
                      color: AppColors.grayTertiaryTextColor,
                      letterSpacing: 0.5,
                    ),
                  ),
                  Gap(2.h),
                  Text(
                    subtitle,
                    style: GoogleFonts.montserrat(
                      fontSize: 13.sp,
                      fontWeight: FontWeight.w600,
                      color: AppColors.blackMainTextColor,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
            if (trailingIcon != null)
              Icon(
                trailingIcon,
                size: 20.r,
                color: AppColors.grayTextSecondaryColor,
              ),
          ],
        ),
      ),
    );
  }

  Widget _buildPricingCard(
    String title,
    String subtitle,
    String price,
    bool isSelected,
  ) {
    return Container(
      margin: EdgeInsets.only(bottom: 12.h),
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16.r),
        border: Border.all(
          color: isSelected
              ? AppColors.primaryColor
              : AppColors.bgSecondaryButtonColor,
          width: isSelected ? 1.5 : 1,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.02),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: GoogleFonts.montserrat(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w800,
                  color: AppColors.blackMainTextColor,
                  fontStyle: FontStyle.italic,
                ),
              ),
              Text(
                subtitle,
                style: GoogleFonts.montserrat(
                  fontSize: 10.sp,
                  fontWeight: FontWeight.w500,
                  color: AppColors.grayTextSecondaryColor,
                ),
              ),
            ],
          ),
          Text(
            price,
            style: GoogleFonts.montserrat(
              fontSize: 16.sp,
              fontWeight: FontWeight.w700,
              color: AppColors.primaryColor,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildReviewCard() {
    return Container(
      padding: EdgeInsets.all(16.w),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16.r),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.02),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              CircleAvatar(
                radius: 20.r,
                backgroundImage: NetworkImage(
                  'https://images.unsplash.com/photo-1494790108377-be9c29b29330?w=200',
                ),
              ),
              Gap(12.w),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Ann Smith',
                    style: GoogleFonts.montserrat(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w800,
                      color: AppColors.blackMainTextColor,
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                  Text(
                    '24-10-2025',
                    style: GoogleFonts.montserrat(
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w500,
                      color: AppColors.grayTextSecondaryColor,
                    ),
                  ),
                ],
              ),
              Spacer(),
              Row(
                children: [
                  Text(
                    '5.0',
                    style: GoogleFonts.montserrat(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w700,
                      color: AppColors.blackMainTextColor,
                    ),
                  ),
                  Gap(4.w),
                  Icon(Icons.star, color: Colors.amber, size: 20.r),
                ],
              ),
            ],
          ),
          Gap(12.h),
          Text(
            'Lorem ipsum dolor sit amet consectetur. Felis et lacus ut egestas urna aliquam scelerisque pretium mauris. Risus aliquam varius ut a. In est viverra dui.',
            style: GoogleFonts.montserrat(
              fontSize: 13.sp,
              fontWeight: FontWeight.w500,
              color: AppColors.blackMainTextColor,
              height: 1.4,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFooterAction(
    IconData icon,
    String label, {
    bool isPrimary = false,
    VoidCallback? onTap,
  }) {
    if (isPrimary) {
      return GestureDetector(
        onTap: onTap,
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
          decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.circular(16.r),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.05),
                blurRadius: 10,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: Row(
            children: [
              Icon(icon, color: AppColors.blackMainTextColor),
              Gap(12.w),
              Text(
                label,
                style: GoogleFonts.montserrat(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w600,
                  color: AppColors.blackMainTextColor,
                ),
              ),
              Spacer(),
              Container(
                width: 32.w,
                height: 32.w,
                decoration: BoxDecoration(
                  color: AppColors.primaryColor,
                  shape: BoxShape.circle,
                ),
                child: Icon(Iconsax.message, color: AppColors.white, size: 18),
              ),
            ],
          ),
        ),
      );
    }
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 16.h),
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(16.r),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 10,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Row(
          children: [
            Icon(icon, color: AppColors.grayTertiaryTextColor),
            Gap(12.w),
            Text(
              label,
              style: GoogleFonts.montserrat(
                fontSize: 14.sp,
                fontWeight: FontWeight.w600,
                color: AppColors.blackMainTextColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
