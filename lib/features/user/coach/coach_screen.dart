import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:my_trainer/core/custom_assets/assets.gen.dart';
import 'package:my_trainer/features/user/coach/widgets/coach_card.dart';
import 'package:my_trainer/features/user/coach/widgets/filter_buttom_shit.dart';
import 'package:my_trainer/utils/app_strings/app_strings.dart';
import 'package:my_trainer/utils/color/app_colors.dart';

class CoachScreen extends StatefulWidget {
  const CoachScreen({super.key});
  @override
  State<CoachScreen> createState() => _CoachScreenState();
}

class _CoachScreenState extends State<CoachScreen> {
  final _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    final List<Map<String, dynamic>> coaches = [
      {
        'name': 'Ann Smith',
        'age': 22,
        'rating': 4.9,  // Ensure this is a double
        'price': 32.0,  // Ensure this is a double
        'location': 'B. Berlin or Peak Fitness',
        'skills': ['Yoga', 'Stretching','dafhaf','dhfga','jdhfadsf','jshdflj','hvzhvZv'],
        'image': 'https://static8.depositphotos.com/1008929/919/i/450/depositphotos_9193332-stock-photo-sporty-sexy-woman-in-gym.jpg',
      },

    {
        'name': 'John Doe',
        'age': 24,
        'rating': 4.7,
        'price': 28.9,
        'location': 'Los Angeles, USA',
        'skills': ['Crossfit', 'HIIT'],
        'image': 'https://fitnglam.ae/wp-content/uploads/2022/05/unsplash_HHXdPG_eTIQ-1-1.png',
      },
      {
        'name': 'Sarah Lee',
        'age': 20,
        'rating': 4.8,
        'price': 40.0,
        'location': 'New York, USA',
        'skills': ['Pilates', 'Strength Training'],
        'image': 'https://m.media-amazon.com/images/I/51GtD3Ez0HL._AC_UF1000,1000_QL80_.jpg',
      },
    ];
    return Scaffold(
      appBar: AppBar(
        scrolledUnderElevation: 0
        ,
        title: Text(
          "mytrainerr.".tr,
          style: Theme.of(context).textTheme.headlineSmall?.copyWith(
            color: isDarkMode ? Colors.white : Color(0xFFE94E6C),
            letterSpacing: -0.5,
          ),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 20),
          child: CustomScrollView(
            slivers: [
              SliverToBoxAdapter(
                child: Column(
                  children: [
                    // Search Bar
                    Row(
                      children: [
                        Expanded(
                          child: SizedBox(
                            height: 50,
                            child: CupertinoSearchTextField(
                              controller: _searchController,
                              onSubmitted: (value) {
                                // Handle search logic
                              },
                              prefixIcon: Padding(
                                padding: EdgeInsets.only(left: 8.0),
                                child: Icon(Iconsax.search_favorite, color: AppColors.grayTextSecondaryColor),
                              ),
                              placeholderStyle: context.textTheme.bodyMedium?.copyWith(color: AppColors.grayTertiaryTextColor),
                              placeholder: AppStrings.lookingForATrainer.tr,
                              decoration: BoxDecoration(
                                border: Border.all(color: AppColors.backgroundsLinesColor, width: 2),
                                color: AppColors.backgroundColor,
                                borderRadius: BorderRadius.circular(20),
                              ),
                            ),
                          ),
                        ),
                        const Gap(16),
                        GestureDetector(
                          behavior: HitTestBehavior.opaque,
                          onTap: () {
                            showFilterModal(context);
                          },
                          child: Assets.icons.filter.svg(height: 24),
                        ),
                      ],
                    ),
                    const Gap(16),
                    // Tabs
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GestureDetector(
                           behavior: HitTestBehavior.opaque,
                          onTap: (){},
                            child: Text("All coaches",style: context.textTheme.bodyLarge,)),
                        InkWell(
                          onTap: (){},
                            child: Text("Most popular",style: context.textTheme.bodyLarge,)),
                        InkWell(
                          onTap: (){},
                            child: Text("Best rated",style: context.textTheme.bodyLarge,)),
                      ],
                    ),
                    const Gap(16),
                  ],
                ),
              ),
              SliverList(
                delegate: SliverChildBuilderDelegate(
                      (context, index) {
                    final coach = coaches[index];
                    return CoachCard(
                      name: coach['name'],
                      age : coach['age'],
                      rating: coach['rating'],
                      price: coach['price'],
                      location: coach['location'],
                      skills: coach['skills'],
                      image: coach['image'],
                      onProfilePressed: () {  },
                    );
                  },
                  childCount: coaches.length, // number of static coaches
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
