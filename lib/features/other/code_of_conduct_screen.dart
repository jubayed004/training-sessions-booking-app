import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_trainer/features/other/controller/other_controller.dart';
import 'package:my_trainer/share/widgets/loading/loading_widget.dart';
import 'package:my_trainer/utils/app_strings/app_strings.dart';
import 'package:my_trainer/utils/color/app_colors.dart';
import 'package:my_trainer/utils/enum/app_enum.dart';

class CodeOfConductScreen extends StatefulWidget {
  const CodeOfConductScreen({super.key});

  @override
  State<CodeOfConductScreen> createState() => _CodeOfConductScreenState();
}

class _CodeOfConductScreenState extends State<CodeOfConductScreen> {
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
        title: Text(AppStrings.codeOfConduct.tr),
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
                  Text(
                    "Last updated: October 24, 2023",
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      color: AppColors.grayTextSecondaryColor,
                    ),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    "We are pleased about your interest in our app MYTRAINERR. Protecting your privacy is very important to us. Below we will inform you in detail about how your data is handled.",
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: AppColors.grayTextSecondaryColor,
                      height: 1.5,
                    ),
                  ),
                  const SizedBox(height: 24),
                  _buildSection(
                    "1. Responsible body",
                    "The responsible body for data processing in connection with this app is:\nMYTRAINERR GmbH\nMusterstrasse 1\n12345 Model City\nGermany\nEmail: privacy@mytrainerr.com",
                  ),
                  _buildSection(
                    "2. Collection and use of your data",
                    "We collect and use your personal data to ensure the functionality of the app and to provide our services. These include:\n\nAccount information: name, email address, password, profile picture.\n\nUsage data: Booked courses, preferred trainers, app interactions.\n\nPayment data: To process bookings via third-party providers.",
                  ),
                  _buildSection(
                    "3. Your rights",
                    "You have the right to information, correction, deletion, restriction of processing, objection to processing and the right to data portability. If you have any questions about the collection, processing or use of your personal data, please contact our data protection officer:\n\nEmail: dpo@mytrainerr.com",
                  ),
                  _buildSection(
                    "4. Data security",
                    "We take technical and organizational security measures to protect your data against accidental or unlawful deletion, alteration or loss and against unauthorized disclosure or access.",
                  ),
                ],
              ),
            );
        }
      }),
    );
  }

  Widget _buildSection(String title, String content) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
              fontWeight: FontWeight.bold,
              color: AppColors.blackMainTextColor,
              fontStyle: FontStyle.italic,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            content,
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
              color: AppColors.grayTextSecondaryColor,
              height: 1.5,
            ),
          ),
        ],
      ),
    );
  }
}
