import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sports_app/core/constant/app_assets.dart';
import 'package:sports_app/core/constant/colors.dart';
import 'package:sports_app/widget/custom_app_bar.dart';
import 'package:sports_app/widget/header.dart';

class SeatingDiagramScreen extends StatelessWidget {
  const SeatingDiagramScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      ///
      /// Start App Bar
      ///
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(60.h),
        child: CustomAppBar(title: 'Seating Diagram'),
      ),

      ///
      /// Start Body
      ///
      backgroundColor: scaffoldColor,
      body: Column(
        children: [
          30.verticalSpacingDiagonal,
          Image.asset(AppAssets().groundInfo, scale: 4),
          30.verticalSpace,
          Image.asset(AppAssets().seatingGround, scale: 4),
          40.verticalSpace,
        ],
      ),
    );
  }
}
