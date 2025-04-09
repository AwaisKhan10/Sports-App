import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sports_app/core/constant/app_assets.dart';
import 'package:sports_app/core/constant/colors.dart';
import 'package:sports_app/core/constant/text_style.dart';
import 'package:sports_app/widget/custom_app_bar.dart';

class FreshClassicScreen extends StatelessWidget {
  const FreshClassicScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: scaffoldColor,

      ///
      /// App Bar
      ///
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(60.h),
        child: CustomAppBar(title: 'Fresh Classic'),
      ),

      ///
      /// Start Body
      ///
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,

          children: [
            80.verticalSpace,
            CircleAvatar(
              radius: 60.r,
              backgroundColor: primaryColor,
              child: Padding(
                padding: EdgeInsets.all(20),
                child: Image.asset(AppAssets().spoons),
              ),
            ),
            30.verticalSpace,
            Text(
              'Under section 124',
              style: style25.copyWith(fontWeight: FontWeight.w700),
            ),
            Text(
              textAlign: TextAlign.center,
              'Favorites including Stadium Hotdogs, Pretzels,\n Nachos, Peanuts, Candy, Chips, Popcorn, Hot\n Chocolate, Soda, Coffee, Draft Beer, Snapple, Water.',
            ),

            ///
            ///      snakes section
            ///
            ///
            30.verticalSpace,
            Text(
              'Snakes',
              style: style25.copyWith(fontWeight: FontWeight.w700),
            ),
            Text(
              textAlign: TextAlign.center,
              'Stadium Dog - 6.25',
              style: style16,
            ),
            Text(textAlign: TextAlign.center, 'Nachos - 6.00', style: style16),
            Text(
              textAlign: TextAlign.center,
              'Tortilla Chips | Nacho Cheese Popcorn - 6.25',
              style: style16,
            ),
            Text(
              textAlign: TextAlign.center,
              'Bavarian Pretzel - 6.00',
              style: style16,
            ),
            Text(textAlign: TextAlign.center, 'Peanuts - 5.00', style: style16),
            Text(textAlign: TextAlign.center, 'Chips - 3.00', style: style16),
          ],
        ),
      ),
    );
  }
}
