import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_trainer/utils/color/app_colors.dart';

class CancelBottomSheet extends StatefulWidget {
  final Map<String, dynamic> appointment;
  final bool isDarkMode;

  const CancelBottomSheet({
    Key? key,
    required this.appointment,
    required this.isDarkMode,
  }) : super(key: key);

  @override
  State<CancelBottomSheet> createState() => _CancelBottomSheetState();
}

class _CancelBottomSheetState extends State<CancelBottomSheet> {
  String? selectedReason;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: widget.isDarkMode ? AppColors.blackMainTextColor : Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "cancel",
                style: GoogleFonts.montserrat(
                  fontWeight: FontWeight.w800,
                  fontSize: 18.sp,
                  color: widget.isDarkMode
                      ? AppColors.white
                      : AppColors.blackMainTextColor,
                ),
              ),
              IconButton(
                icon: Icon(Icons.close),
                onPressed: () => Navigator.pop(context),
              ),
            ],
          ),
          Text(
            "Specify the reason for the cancellation",
            style: GoogleFonts.montserrat(
              fontSize: 13.sp,
              color: AppColors.grayTertiaryTextColor,
            ),
          ),
          Gap(20),
          ...[
            {'icon': Icons.sick, 'label': 'illness'},
            {'icon': Icons.flight, 'label': 'Travel'},
            {'icon': Icons.beach_access, 'label': 'Vacation'},
            {'icon': Icons.mood_bad, 'label': 'different reactions'},
          ].map((reason) {
            return InkWell(
              onTap: () {
                setState(() {
                  selectedReason = reason['label'] as String;
                });
              },
              child: Container(
                margin: EdgeInsets.only(bottom: 12),
                padding: EdgeInsets.symmetric(vertical: 12, horizontal: 16),
                decoration: BoxDecoration(
                  color: selectedReason == reason['label']
                      ? AppColors.primaryColor.withOpacity(0.1)
                      : Colors.transparent,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Row(
                  children: [
                    Radio<String>(
                      value: reason['label'] as String,
                      groupValue: selectedReason,
                      onChanged: (value) {
                        setState(() {
                          selectedReason = value;
                        });
                      },
                      activeColor: AppColors.primaryColor,
                    ),
                    Gap(12),
                    Icon(
                      reason['icon'] as IconData,
                      color: AppColors.grayTertiaryTextColor,
                      size: 20,
                    ),
                    Gap(12),
                    Text(
                      reason['label'] as String,
                      style: GoogleFonts.montserrat(
                        fontSize: 14.sp,
                        color: widget.isDarkMode
                            ? AppColors.white
                            : AppColors.blackMainTextColor,
                      ),
                    ),
                  ],
                ),
              ),
            );
          }).toList(),
          Gap(20),
          SizedBox(
            width: double.infinity,
            height: 50,
            child: ElevatedButton(
              onPressed: selectedReason != null
                  ? () {
                      // Handle cancel logic
                      Navigator.pop(context);
                    }
                  : null,
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.primaryColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              child: Text(
                "Cancel",
                style: GoogleFonts.montserrat(
                  fontWeight: FontWeight.w700,
                  fontSize: 16.sp,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          Gap(10),
        ],
      ),
    );
  }
}
