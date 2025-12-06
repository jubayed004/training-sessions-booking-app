import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:iconsax/iconsax.dart';
import 'package:my_trainer/utils/color/app_colors.dart';
import 'package:my_trainer/utils/extension/base_extension.dart';

import '../../../utils/app_strings/app_strings.dart';

class ConnectedAccountScreen extends StatefulWidget {
  const ConnectedAccountScreen({super.key});

  @override
  State<ConnectedAccountScreen> createState() => _ConnectedAccountScreenState();
}

class _ConnectedAccountScreenState extends State<ConnectedAccountScreen> {
  final ValueNotifier<bool> isConnect = ValueNotifier(true);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: AppBar(
        scrolledUnderElevation: 0,
        backgroundColor: Colors.transparent,
        title: Text(
          "Connected Account".tr,
        ),
        centerTitle: true,
      ),
      body: SafeArea(
          child: SingleChildScrollView(
            padding: EdgeInsets.symmetric(horizontal: 16,vertical: 20),
        child: Column(
          children: [
        Container(
        margin: EdgeInsets.only(bottom: 8),
        padding: EdgeInsets.all(12),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: Colors.white,
        ),
        child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                padding:EdgeInsets.all(14) ,
                decoration: BoxDecoration(
                  color: AppColors.backgroundsLinesColor,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Icon(Iconsax.ticket,color: AppColors.black,),
              ),
              Gap(16),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Stripe".tr,style: GoogleFonts.montserrat(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w800,
                      color: Color(0xFF635BFF)
                  ),),
                  Row(
                    spacing: 6,
                    children: [
                      Icon(Iconsax.wallet_3,size: 14,),
                      Text("0016563228",
                        style: context.labelSmall,),
                    ],
                  ),

                ],
              ),
              Spacer(),
           CircleAvatar(
             backgroundColor: AppColors.tertiaryTextColor,
             radius: 23,
             child: Icon(Iconsax.edit,color: Colors.white,size: 20,),
           )
            ]
        ),
      )
          ],
        ),
      )),
    );
  }
}
