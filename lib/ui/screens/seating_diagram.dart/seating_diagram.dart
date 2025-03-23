import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sports_app/core/constant/app_assets.dart';
import 'package:sports_app/core/constant/colors.dart';
import 'package:sports_app/widget/header.dart';

class SeatingDiagramScreen extends StatelessWidget {
  const SeatingDiagramScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: whiteColor),
      backgroundColor: scaffoldColor,
      body: Column(
        children: [
          CustomHeader(
            title: 'seating Diagram',
            icon: Icons.arrow_back_rounded,
          ),
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
