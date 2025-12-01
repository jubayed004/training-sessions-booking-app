import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:my_trainer/features/other/controller/other_controller.dart';
import 'package:my_trainer/share/widgets/loading/loading_widget.dart';
import 'package:my_trainer/utils/app_strings/app_strings.dart';
import 'package:my_trainer/utils/enum/app_enum.dart';

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
        title: Text(
          AppStrings.imprint.tr,
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
              child: Obx(() {return Text("fasdgfdasfg");}
              ),
            );
        }
      },
      ),
    );
  }
}
