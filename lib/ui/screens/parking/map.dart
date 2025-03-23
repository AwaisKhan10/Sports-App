import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:sports_app/core/constant/app_assets.dart';
import 'package:sports_app/core/constant/colors.dart';
import 'package:sports_app/core/constant/text_style.dart';

class Map_GettingHelpScreen extends StatelessWidget {
  const Map_GettingHelpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: scaffoldColor,
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(AppAssets().map),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          children: [
            40.verticalSpace,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () {
                    navigator!.pop(context);
                  },
                  child: Icon(
                    Icons.arrow_back_rounded,
                    size: 30,
                    color: blackColor,
                  ),
                ),
                Text(
                  'Getting Help',
                  style: style20.copyWith(
                    color: blackColor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(''),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
