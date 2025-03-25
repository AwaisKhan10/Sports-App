import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sports_app/core/constant/app_assets.dart';
import 'package:sports_app/core/constant/colors.dart';
import 'package:sports_app/core/constant/text_style.dart';
import 'package:sports_app/widget/drop_down_expendable_button.dart';
import 'package:sports_app/widget/switch_button.dart';

class InfoSupportScreen extends StatelessWidget {
  const InfoSupportScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: scaffoldColor,
      appBar: AppBar(backgroundColor: whiteColor),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            CustomDropDownExpendableButton(
              text:
                  'Welcome to the Avaya App. For great in-app features such as posting to the Fan Engagement Wall and social sharing, please create a profile here. Digital Ticketing is a separate feature with your Earthquakes Ticketmaster Account login details.',
            ),
            30.verticalSpace,
            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              color: whiteColor, // Light background
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Column(
                      mainAxisAlignment:
                          MainAxisAlignment.center, // Move logo down
                      children: [
                        Image.asset(
                          AppAssets().dp,
                          width: 50,
                          height: 60,
                          fit: BoxFit.cover,
                        ),
                      ],
                    ),

                    20.horizontalSpace,
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Title
                          Text(
                            'Avaya Stadium Mobile App Powered by\n Avaya Technology ©2017 Avaya Inc. |\n v 2.0.40',
                            style: style16.copyWith(
                              color: blackColor,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            20.verticalSpace,
            _support('Feedback/Support'),
            20.verticalSpace,
            _qualityImprovementCard(),
            20.verticalSpace,
            _support('Legal'),
          ],
        ),
      ),
    );
  }

  Widget _support(String title) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: whiteColor,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 20),
        child: Text(title, style: style16),
      ),
    );
  }

  ///
  ///
  ///     quality improvmente
  ///
  Widget _qualityImprovementCard() {
    return Container(
      padding: EdgeInsets.all(16),

      decoration: BoxDecoration(
        color: whiteColor,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Quality Improvement",
                  style: style16.copyWith(
                    fontWeight: FontWeight.w700,
                    color: blackColor,
                  ),
                ),
                SizedBox(height: 4),
                Text(
                  "Allow Avaya Stadium App to collect data to improve the quality of this product",
                  style: style16.copyWith(color: Colors.black54, fontSize: 14),
                ),
              ],
            ),
          ),
          CustomSwitchButton(
            onChanged: (bool value) {
              print("Switch is now: $value");
            },
            initialValue: false,
          ),
        ],
      ),
    );
  }
}
