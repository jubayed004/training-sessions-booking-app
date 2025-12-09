import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_trainer/utils/color/app_colors.dart';

class EditBottomSheet extends StatefulWidget {
  final List<Map<String, dynamic>> timeSlots;
  final bool isDarkMode;

  const EditBottomSheet({
    Key? key,
    required this.timeSlots,
    required this.isDarkMode,
  }) : super(key: key);

  @override
  State<EditBottomSheet> createState() => _EditBottomSheetState();
}

class _EditBottomSheetState extends State<EditBottomSheet> {
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
                "Edit Tuesday, December 26th",
                style: GoogleFonts.montserrat(
                  fontWeight: FontWeight.w800,
                  fontSize: 16.sp,
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
            "Choose a time window you want to block",
            style: GoogleFonts.montserrat(
              fontSize: 12.sp,
              color: AppColors.grayTertiaryTextColor,
            ),
          ),
          Gap(16),
          Container(
            constraints: BoxConstraints(maxHeight: 400),
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: widget.timeSlots.length,
              itemBuilder: (context, index) {
                var slot = widget.timeSlots[index];
                bool isSelected = slot['isSelected'] ?? false;
                return Container(
                  margin: EdgeInsets.only(bottom: 12),
                  padding: EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: widget.isDarkMode
                        ? AppColors.blackMainTextColor.withOpacity(0.05)
                        : Color(0xFFF9FAFB),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Row(
                    children: [
                      Checkbox(
                        value: isSelected,
                        onChanged: (value) {
                          setState(() {
                            widget.timeSlots[index]['isSelected'] = value;
                          });
                        },
                        activeColor: AppColors.primaryColor,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            slot['time'],
                            style: GoogleFonts.montserrat(
                              fontWeight: FontWeight.w700,
                              fontSize: 14.sp,
                              color: widget.isDarkMode
                                  ? AppColors.white
                                  : AppColors.blackMainTextColor,
                            ),
                          ),
                          if (slot['hasMessage'])
                            Row(
                              children: [
                                CircleAvatar(
                                  radius: 10,
                                  backgroundImage: AssetImage(
                                    'assets/placeholder.png',
                                  ),
                                ),
                                Gap(8),
                                Text(
                                  slot['name'],
                                  style: GoogleFonts.montserrat(
                                    fontSize: 12.sp,
                                    color: AppColors.grayTertiaryTextColor,
                                  ),
                                ),
                              ],
                            )
                          else
                            Text(
                              "Available",
                              style: GoogleFonts.montserrat(
                                fontSize: 12.sp,
                                color: AppColors.primaryColor,
                              ),
                            ),
                        ],
                      ),
                      Spacer(),
                      if (slot['hasMessage'])
                        Icon(
                          Icons.arrow_forward_ios,
                          size: 16,
                          color: AppColors.grayTertiaryTextColor,
                        ),
                    ],
                  ),
                );
              },
            ),
          ),
          Gap(16),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.block,
                size: 20,
                color: AppColors.grayTertiaryTextColor,
              ),
              Gap(8),
              Text(
                "Block All Day",
                style: GoogleFonts.montserrat(
                  fontSize: 14.sp,
                  color: AppColors.grayTertiaryTextColor,
                ),
              ),
            ],
          ),
          Gap(20),
          SizedBox(
            width: double.infinity,
            height: 50,
            child: ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
                // Handle update logic here
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.primaryColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              child: Text(
                "Update",
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
