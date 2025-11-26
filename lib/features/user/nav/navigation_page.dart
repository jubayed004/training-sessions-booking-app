import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:my_trainer/features/user/nav/controller/navigation_controller.dart';
import 'package:my_trainer/utils/color/app_colors.dart';
import 'package:my_trainer/utils/extension/base_extension.dart';

class NavigationPage extends StatefulWidget {
  const NavigationPage({super.key, this.index = 0});

  final int index;

  @override
  State<NavigationPage> createState() => _NavigationPageState();
}

class _NavigationPageState extends State<NavigationPage> {

  final _controller = Get.find<NavigationController>();
  @override
  void initState() {
    super.initState();
    _controller.selectedNavIndex.value = widget.index;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: Obx(() {
              return _controller.getPages()[_controller.selectedNavIndex.value];
            }),
          ),
        ],
      ),
      bottomNavigationBar: Container(
        padding: EdgeInsets.only(bottom: 6, top: 6),
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.vertical(top: Radius.circular(5)),

        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: List.generate(
            _controller.icons.length,
                (index) => Expanded(
              child: GestureDetector(
                onTap: () {

                  _controller.selectedNavIndex.value = index;
                },
                child: Obx(() {
                  bool isSelected = _controller.selectedNavIndex.value == index;
                  return Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      if (isSelected)
                        Column(

                          children: [
                            AnimatedContainer(
                              duration: const Duration(milliseconds: 300),
                              curve: Curves.easeInOut,
                              transform: Matrix4.translationValues(0, -20, 0), // Move up when selected
                              decoration: BoxDecoration(
                                color: AppColors.primaryColor,
                                shape: BoxShape.circle,
                                boxShadow: [
                                  BoxShadow(
                                    color: AppColors.primaryColor.withValues(alpha: 0.2),
                                    blurRadius: 4.r,
                                    offset: Offset(0, 4),
                                  ),
                                ],
                              ),
                              padding: EdgeInsets.all(16),
                              child: SvgPicture.asset(

                                _controller.icons[index].path,
                                colorFilter: ColorFilter.mode(
                                  isSelected ? AppColors.white : AppColors.white,
                                  BlendMode.srcIn,

                                ),
                              ),
                            ),
                      /*      Padding(
                              padding: const EdgeInsets.only(bottom: 18.0),
                              child: Text(
                                _controller.labels[index],
                                style: context.labelSmall.copyWith(fontWeight: FontWeight.w800,fontSize: 11,color: AppColors.primaryColor),
                              ),
                            ),*/
                          ],
                        )
                      else
                        SvgPicture.asset(
                          height: 24,
                          _controller.icons[index].path,
                          colorFilter: ColorFilter.mode(AppColors.grayTertiaryTextColor, BlendMode.srcIn),
                        ),

                      if (!isSelected)
                        Padding(
                          padding: EdgeInsets.only(top: 4.w), // Default space for unselected text
                          child: Text(
                            _controller.labels[index],
                            style: context.labelSmall,
                          ),
                        ),


                    ],
                  );
                }),
              ),
            ),
          ).toList(),
        ),
      ),
    );
  }
}
