import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import 'package:iconsax/iconsax.dart';
import 'package:my_trainer/core/router/route_path.dart';
import 'package:my_trainer/features/trainers/client/widgets/list_item_card.dart' hide AppColors;
import 'package:my_trainer/utils/app_strings/app_strings.dart';
import 'package:my_trainer/utils/color/app_colors.dart';
import 'package:my_trainer/utils/extension/base_extension.dart';

class BusinessClientScreen extends StatefulWidget {
  const BusinessClientScreen({super.key});

  @override
  State<BusinessClientScreen> createState() => _BusinessClientScreenState();
}

class _BusinessClientScreenState extends State<BusinessClientScreen> {
  final _searchController = TextEditingController();
  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
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
          child:CustomScrollView(
            slivers: [
              SliverToBoxAdapter(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16,vertical: 16),
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
                                placeholderStyle: context.bodyMedium.copyWith(color: AppColors.grayTertiaryTextColor),
                                placeholder: AppStrings.lookingForATrainer.tr,
                                decoration: BoxDecoration(
                                  border: Border.all(color: AppColors.backgroundsLinesColor, width: 2),
                                  color: AppColors.backgroundColor,
                                  borderRadius: BorderRadius.circular(20),
                                ),
                              ),
                            ),
                          ),

                        ],
                      ),

                    ],
                  ),
                ),
              ),
              SliverList(
                delegate: SliverChildBuilderDelegate(
                      (context, index) {
                    return  Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16),
                      child: ClientCardWidget(
                        name: 'Ann Smith',
                        nextMeeting: 'Next meeting: Tomorrow',
                        remainingSessions: 8,
                        totalSessions: 10,
                        onMessagePressed: () {
                         context.pushNamed(RoutePath.chatScreen);
                        },
                      ),
                    );
                  },
                  childCount: 10,
                ),
              ),

            ],
          )
      ),

    );
  }
}
