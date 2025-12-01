import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_trainer/features/other/controller/other_controller.dart';
import 'package:my_trainer/share/widgets/loading/loading_widget.dart';
import 'package:my_trainer/share/widgets/no_internet/no_internet_card.dart';
import 'package:my_trainer/utils/app_strings/app_strings.dart';
import 'package:my_trainer/utils/enum/app_enum.dart';

class TermsAndConditionsScreen extends StatefulWidget {
  const TermsAndConditionsScreen({super.key});

  @override
  State<TermsAndConditionsScreen> createState() => _TermsAndConditionsScreenState();
}

class _TermsAndConditionsScreenState extends State<TermsAndConditionsScreen> {
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
        title: Text(
          AppStrings.termsOfUse.tr,
        ),
        centerTitle: true,
      ),
      body: Obx(() {
        switch (controller.privacyLoading.value) {
          case ApiStatus.loading:
            return const LoadingWidget();
          case ApiStatus.internetError:
          /*  return NoInternetCard(onTap: ()=>controller.getPrivacyPolicy());*/
          case ApiStatus.noDataFound:
            return Center(child: Text( "No data found!".tr));
          case ApiStatus.error:
/*            return NoInternetCard(onTap: ()=>controller.getPrivacyPolicy());*/

          case ApiStatus.completed:
            return SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                child: Text(
                    maxLines: 30,
                    "What is lorem ipsum, and when did publishers begin using it?The standard lorem ipsum passage has been a printer's friend for centuries. Like stock photos today, it served as a placeholder for actual content. The original text comes from Cicero's philosophical work  written in 45 BC.The use of the lorem ipsum passage dates back to the 1500s. When printing presses required painstaking hand-setting of type, workers needed something to show clients how their pages would look. To save time, they turned to Cicero's words, creating sample books filled with preset paragraphs.However, it wasn't until the 1960s that the passage became common when Letraset revolutionized the advertising industry with its transfer sheets. These innovative sheets allowed designers to apply pre-printed lorem ipsum text in various fonts and formats directly onto their mockups and prototypes.What does Lorem Ipsum text say?Printers in the 1500s scrambled the words from Cicero's De Finibus Bonorum et Malorum'' after mixing the words in each sentence. The familiar lorem ipsum dolor sit amet text emerged when 16th-century printers adapted Cicero's original work, beginning with the phrase  were rearranged to create the standard dummy text that has become a fundamental tool in design and typography across generations.The short answer is that lorem ipsum text doesn't actually say anything meaningful. It's deliberately scrambled Latin that doesn't form coherent sentences. While it comes from Cicero's De Finibus Bonorum et Malorum,the text has been modified so extensively that it's nonsensical.Why scrambled text? That's exactly the point. By using text that's unreadable but maintains the general pattern of regular writing — including normal word length, spacing, and punctuation — designers can focus on the visual elements of a layout without the actual content getting in the way. The pseudo-Latin appearance gives it a natural feel while ensuring it won't distract from the design itself.")
            );
        }
      },
      ),
    );
  }
}
