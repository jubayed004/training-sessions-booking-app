import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_trainer/features/other/controller/other_controller.dart';
import 'package:my_trainer/share/widgets/loading/loading_widget.dart';
import 'package:my_trainer/share/widgets/no_internet/no_internet_card.dart';
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
appBar: AppBar(),
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
              child: Obx(() /*=> HtmlWidget(controller.privacyConditionsData.value.data?.description ?? ""),*/{return Text("fasdgfdasfg");}
              ),
            );
        }
      },
      ),
    );
  }
}
