import 'package:flutter/material.dart';
import 'package:sports_app/core/constant/app_assets.dart';
import 'package:sports_app/core/constant/colors.dart';
import 'package:sports_app/widget/header.dart';

class ParkingDiagramScreen extends StatelessWidget {
  const ParkingDiagramScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: whiteColor),
      body: Column(
        children: [
          CustomHeader(
            title: 'Parking Diagram',
            icon: Icons.arrow_back_rounded,
          ),
          Image.asset(AppAssets().parkingDiagram, scale: 4),
        ],
      ),
    );
  }
}
