import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_trainer/features/other/controller/other_controller.dart';
import 'package:my_trainer/share/widgets/loading/loading_widget.dart';
import 'package:my_trainer/utils/app_strings/app_strings.dart';
import 'package:my_trainer/utils/enum/app_enum.dart';
import 'package:my_trainer/utils/color/app_colors.dart';

class ImprintScreen extends StatefulWidget {
  const ImprintScreen({super.key});

  @override
  State<ImprintScreen> createState() => _ImprintScreenState();
}

class _ImprintScreenState extends State<ImprintScreen> {
  final controller = Get.find<OtherController>();

  @override
  void initState() {
    /*   controller.getPrivacyPolicy();*/
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: AppBar(
        scrolledUnderElevation: 0,
        backgroundColor: Colors.transparent,
        title: Text(AppStrings.imprint.tr),
        centerTitle: true,
      ),
      body: Obx(() {
        switch (controller.privacyLoading.value) {
          case ApiStatus.loading:
            return const LoadingWidget();
          case ApiStatus.internetError:
          /*  return NoInternetCard(onTap: ()=>controller.getPrivacyPolicy());*/
          case ApiStatus.noDataFound:
            return Center(child: Text("No data found!".tr));
          case ApiStatus.error:
          /*            return NoInternetCard(onTap: ()=>controller.getPrivacyPolicy());*/

          case ApiStatus.completed:
            return SingleChildScrollView(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildSection(AppStrings.companyNameAndLegalForm.tr, [
                    "MYTRAINERR GmbH",
                  ]),
                  _buildSection(AppStrings.companyAddress.tr, [
                    "Musterstrasse 123",
                    "10115 Berlin",
                    "Germany",
                  ]),
                  _buildSection(AppStrings.contact.tr, [
                    "contact@mytrainerr.app",
                    "+49 123 4567890",
                  ]),
                  _buildSection(AppStrings.representedBy.tr, ["Max Doe, CEO"]),
                  _buildSection(AppStrings.commercialRegister.tr, [
                    "Charlottenburg District Court",
                    "HRB 123456 B",
                  ]),
                  _buildSection(AppStrings.vatId.tr, ["DE123456789"]),
                ],
              ),
            );
        }
      }),
    );
  }

  Widget _buildSection(String title, List<String> content) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title.toUpperCase(),
            style: Theme.of(context).textTheme.labelSmall?.copyWith(
              color: AppColors.grayTextSecondaryColor,
              fontWeight: FontWeight.w500,
              letterSpacing: 0.5,
            ),
          ),
          const SizedBox(height: 8),
          ...content.map(
            (text) => Padding(
              padding: const EdgeInsets.only(bottom: 4),
              child: Text(
                text,
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: AppColors.blackMainTextColor,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
