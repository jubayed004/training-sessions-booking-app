import 'package:flutter/material.dart';
import 'package:get/get_utils/src/extensions/export.dart';
import 'package:my_trainer/features/user/coach/widgets/coach_card.dart';
import 'package:my_trainer/utils/app_strings/app_strings.dart';
import 'package:my_trainer/utils/color/app_colors.dart';

class FavoriteTrainerScreen extends StatelessWidget {
  const FavoriteTrainerScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
        'rating': 3.8,
        'price': 40.0,
        'location': 'New York, USA',
        'skills': ['Pilates', 'Strength Training'],
        'image': 'https://m.media-amazon.com/images/I/51GtD3Ez0HL._AC_UF1000,1000_QL80_.jpg',
      },
      {
        'name': 'Sara demon',
        'age': 20,
        'rating': 4.5,
        'price': 40.0,
        'location': 'New York, USA',
        'skills': ['Pilates', 'Strength Training'],
        'image': 'https://png.pngtree.com/png-clipart/20240928/original/pngtree-fitness-journey-tips-for-gym-girls-to-stay-motivated-png-image_16112264.png',
      },
      {
        'name': 'grray kho',
        'age': 20,
        'rating': 4.9,
        'price': 40.0,
        'location': 'New York, USA',
        'skills': ['Pilates', 'Strength Training'],
        'image': 'https://imgcdn.stablediffusionweb.com/2024/11/4/61652f3f-b0ec-4c62-998f-f72dac59f09d.jpg',
      },
    ];
    return Scaffold(
        appBar: AppBar(
          scrolledUnderElevation: 0,
          backgroundColor: Colors.transparent,
          title: Text(
            AppStrings.favoriteTrainer.tr,
          ),
          centerTitle: true,
        ),
      body: SafeArea(
        child: CustomScrollView(

          slivers: [
            SliverPadding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0,vertical: 16),
              sliver: SliverList(
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
                  childCount: coaches.length,
                ),
              ),
            ),
          ],
        ),
      )
    );
  }
}
