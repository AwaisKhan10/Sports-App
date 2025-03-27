import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/instance_manager.dart';
import 'package:sports_app/core/constant/colors.dart';
import 'package:sports_app/core/constant/text_style.dart';
import 'package:sports_app/ui/screens/parking/map.dart';
import 'package:sports_app/widget/custom_app_bar.dart';
import 'package:sports_app/widget/direction_form_my_location.dart';
import 'package:sports_app/widget/header.dart';

class GettingHelpScreen extends StatelessWidget {
  const GettingHelpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      ///
      /// App Bar
      ///
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(60.h),
        child: CustomAppBar(title: "Getting Help"),
      ),

      ///
      /// Start Body
      ///
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Driving Direction',
              style: style18.copyWith(fontWeight: FontWeight.w500),
            ),
            20.verticalSpace,
            CustomDirectionContainer(
              onTap: () {
                Get.to(() => Map_GettingHelpScreen());
              },
            ),
            40.verticalSpace,
            Text(
              'PUBLIC TRANSIT: VTA',
              style: style18.copyWith(fontWeight: FontWeight.w500),
            ),
            30.verticalSpace,
            _Tips(
              'The VTA +10 Free Airport Flyer from Santa \nClara Transit Center to Metro Airport Light\n Rail Transit station has drop-off points at the \nstadium and parking lots',
              Icons.circle,
            ),
            20.verticalSpace,
            _Tips(
              'The VTA #231 Downtown San Jose to Avaya\n Stadium shuttle will run two hours before and\n one hour after each match and will be regular\n fare',
              Icons.circle,
            ),
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
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (icon != null) ...[
            Padding(
              padding: EdgeInsets.only(top: 10),
              child: Icon(icon, size: 8),
            ),
            SizedBox(width: 8),
          ],
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 4),
              child: Text(title, style: style16.copyWith()),
            ),
          ),
        ],
      ),
    );
  }
}
