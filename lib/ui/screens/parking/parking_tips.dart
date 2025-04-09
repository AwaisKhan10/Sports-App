import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:sports_app/core/constant/colors.dart';
import 'package:sports_app/core/constant/text_style.dart';
import 'package:sports_app/ui/screens/parking/map.dart';
import 'package:sports_app/widget/custom_app_bar.dart';
import 'package:sports_app/widget/direction_form_my_location.dart';

class ParkingTipsScreen extends StatelessWidget {
  const ParkingTipsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      ///
      /// App Bar
      ///
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(60.h),
        child: CustomAppBar(title: "Parking tips"),
      ),

      ///
      /// Start Body
      ///
      backgroundColor: scaffoldColor,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          children: [
            30.verticalSpacingDiagonal,
            CustomDirectionContainer(
              onTap: () {
                Get.to(() => Map_GettingHelpScreen());
              },
            ),
            20.verticalSpace,
            _Tips('Event parking'),
            20.verticalSpace,
            _Tips('General Direction / Parking Tips '),
            20.verticalSpace,
            _Tips('ADA Parking'),
            20.verticalSpace,
            _Tips('Planing Ahead for Your Quick Exit'),
          ],
        ),
      ),
    );
  }

  Widget _Tips(String title, [IconData? icon]) {
    return Container(
      decoration: BoxDecoration(
        color: whiteColor,
        borderRadius: BorderRadius.circular(10),
      ),
      // height: 57.h,
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 15),
      alignment: Alignment.centerLeft,
      child: Row(
        children: [
          if (icon != null) ...[
            Icon(icon, size: 15),
            SizedBox(width: 8), // Add spacing between icon and text
          ],
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 15),
            child: Text(title, style: style16.copyWith()),
          ),
        ],
      ),
    );
  }
}
