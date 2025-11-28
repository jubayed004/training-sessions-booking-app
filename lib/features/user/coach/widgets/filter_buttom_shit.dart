import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:my_trainer/core/router/routes.dart';
import 'package:my_trainer/features/user/coach/widgets/tag_item_card.dart';
import 'package:my_trainer/share/widgets/button/custom_button.dart';
import 'package:my_trainer/share/widgets/dropdown/custom_dropdown_field.dart';
import 'package:my_trainer/share/widgets/text_field/custom_text_field.dart';
import 'package:my_trainer/utils/app_strings/app_strings.dart';
import 'package:my_trainer/utils/color/app_colors.dart';

void showFilterModal(BuildContext context) {
  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    //enableDrag: true,
    backgroundColor: Colors.transparent,

    builder: (BuildContext context) {
      return FilterModalContent();
    },
  );
}

class FilterModalContent extends StatefulWidget {
  const FilterModalContent({super.key});
  @override
  _FilterModalContentState createState() => _FilterModalContentState();
}
class _FilterModalContentState extends State<FilterModalContent> {
  final _locationController =TextEditingController();
  final _formKey = GlobalKey<FormState>();
  final List<String> tags = [
    'Weight loss',
    'Strength training',
    'CrossFit',
    'Yoga',
    'HIIT',
    'Pilates',
    'Nutritional advice',
    'Rehabilitation',
    'Prenatal training',
  ];
  Set<String> selectedTags = {};

  @override
  Widget build(BuildContext context) {
    return makeDismissable(
      child: DraggableScrollableSheet(
        initialChildSize: 0.7,
         minChildSize: 0.5,
         maxChildSize: 1,
         builder: (_,controller)=>Container(
           decoration: BoxDecoration(
               color: AppColors.white,
               borderRadius: BorderRadiusGeometry.vertical(
                   top: Radius.circular(20)
               )
           ),
      
           child: SingleChildScrollView(
            controller: controller,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Header with title and close button
                    Row(
                      children: [
                        Text(
                          AppStrings.filter.tr,
                          style: context.textTheme.headlineSmall,
                        ),
                        Spacer(),
                        IconButton(
                          onPressed: () => AppRouter.route.pop(),
                          icon: Icon(Iconsax.close_circle),
                        ),
                      ],
                    ),
                    // Gap
                    Gap(8),
                    Text('Sort by', style: context.textTheme.bodyLarge),
                    Gap(8),
                    CustomDropdownField(
                      value: "Most popular",
                      onChanged: (v) {
                        v = v;
                      },
                      hintText: "........",
                      items: ['Most popular', 'Newest', 'Highest rated'],
                    ),
                    Gap(16),
                    Text(AppStrings.price.tr, style: context.textTheme.bodyLarge),
                    Gap(8),
                    CustomDropdownField(
                      value: "€50-75",
                      onChanged: (v) {
                        v = v;
                      },
                      hintText: "........",
                      items: ['€50-75', '€100-175', '€150-275'],
                    ),
                    Gap(16),
                    Text(AppStrings.experience.tr, style: context.textTheme.bodyLarge),
                    Gap(8),
                    CustomDropdownField(
                      value: "0-6 month",
                      onChanged: (v) {
                        v = v;
                      },
                      hintText: "........",
                      items: ['0-6 month', '1-2 years', '3-6 years'],
                    ),
                    Gap(16),
                    CustomTextField(
                      title: AppStrings.location.tr,
                      controller: _locationController,
                      hintText: AppStrings.enterYourCityAndZipCode.tr,
                      keyboardType: TextInputType.streetAddress,
                    ),
                    Gap(16),
                    Text(AppStrings.specifications.tr, style: context.textTheme.bodyLarge),
                    // Tags wrap
                    Wrap(
                      spacing: 10.0, // Space between tags
                      runSpacing: 10.0, // Space between lines
                      children: tags.map((tag) {
                        return TagItem(
                          tag: tag,
                          isSelected: selectedTags.contains(tag),
                          onTap: () {
                            setState(() {
                              if (selectedTags.contains(tag)) {
                                selectedTags.remove(tag);
                              } else {
                                selectedTags.add(tag);
                              }
                            });
                          },
                        );
                      }).toList(),
                    ),
                    SizedBox(height: 16),
                    CustomButton(text: AppStrings.submit.tr,onTap: ()=>AppRouter.route.pop(),)
                  ],
                ),
              ),
            ),
                 ),
         ),
      ),
    );
  }
}

Widget makeDismissable({required Widget child})=>GestureDetector(
  behavior: HitTestBehavior.opaque,
  onTap: ()=>AppRouter.route.pop(),
  child: GestureDetector(onTap: (){},child: child,),
);