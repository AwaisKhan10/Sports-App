import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:sports_app/core/constant/colors.dart';
import 'package:sports_app/core/constant/text_style.dart';
import 'package:sports_app/widget/drop_down_expendable_button.dart';
import 'package:sports_app/widget/header.dart';

class FaqsScreen extends StatelessWidget {
  const FaqsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: scaffoldColor,
      appBar: AppBar(backgroundColor: whiteColor),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          children: [
            CustomHeader(
              title: 'FAQs',
              icon: Icons.arrow_back_sharp,
              onTap: () {
                navigator!.pop(context);
              },
            ),
            CustomDropDownExpendableButton(
              text:
                  'Welcome to the Avaya App. For great in-app features such as posting to the Fan Engagement Wall and social sharing, please create a profile here. Digital Ticketing is a separate feature with your Earthquakes Ticketmaster Account login details.',
            ),
            30.verticalSpace,
            _services('Where is the stadium located?'),
            20.verticalSpace,
            _services('How long is the TCL 4K Bar?'),
            20.verticalSpace,
            _services('Can I bring a backpack into the stadium?'),
            20.verticalSpace,
            _services('What is the re-entry policy?'),
            20.verticalSpace,
            _services('What food or water can I bring into the stadium?'),
            20.verticalSpace,
            _services('Is there a designated smoking section in the stadium?'),
            20.verticalSpace,
            _services('Is there a designated smoking section in the stadium?'),
            20.verticalSpace,
          ],
        ),
      ),
    );
  }

  Widget _services(String title) {
    return Container(
      width: double.infinity,
      color: whiteColor,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 20),
        child: Text(title, style: style16),
      ),
    );
  }
}
