import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sports_app/core/constant/app_assets.dart';
import 'package:sports_app/widget/custom_app_bar.dart';

class ParkingDiagramScreen extends StatelessWidget {
  const ParkingDiagramScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      ///
      /// App Bar
      ///
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(60.h),
        child: CustomAppBar(title: "Parking Diagram"),
      ),

      ///
      /// Start Body
      ///
      body: Column(
        children: [Image.asset(AppAssets().parkingDiagram, scale: 4)],
      ),
    );
  }
}
