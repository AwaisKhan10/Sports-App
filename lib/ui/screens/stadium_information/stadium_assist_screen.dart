import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sports_app/core/constant/auth_field_decoration.dart';
import 'package:sports_app/core/constant/colors.dart';
import 'package:sports_app/core/constant/text_style.dart';
import 'package:sports_app/widget/drop_down_expendable_button.dart';
import 'package:sports_app/widget/header.dart';

class StadiumAssistScreen extends StatelessWidget {
  const StadiumAssistScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: scaffoldColor,
      appBar: AppBar(backgroundColor: whiteColor),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CustomHeader(
              title: 'Stadium Assist',
              icon: Icons.arrow_back_sharp,
              onTap: () {
                Navigator.pop(context);
              },
            ),
            CustomDropDownExpendableButton(
              text:
                  'Welcome to the Avaya App. For great in-app features such as posting to the Fan Engagement Wall and social sharing, please create a profile here. Digital Ticketing is a separate feature with your Earthquakes Ticketmaster Account login details.',
            ),
            40.verticalSpace,
            Text(
              'Welcome to Stadium Assistant',
              style: style25.copyWith(fontWeight: FontWeight.w700),
            ),
            // 10.verticalSpace,
            Text(
              textAlign: TextAlign.center,
              'Please type in a question below and tap Ask, Well \n find the best answer to assist you and point \n you to the information that you need! \n only',
            ),
            SizedBox(height: MediaQuery.of(context).size.height * 0.13),
            TextFormField(
              decoration: authFieldDecoration.copyWith(
                contentPadding: EdgeInsets.symmetric(
                  horizontal: 20.w,
                  vertical: 20.h,
                ),
                hintText: 'Type Your Question',
              ),
            ),
            20.verticalSpace,
            GestureDetector(
              onTap: () {},
              child: Container(
                height: 58.h,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: primaryColor,
                ),
                child: Center(
                  child: Text(
                    'Ask Question',
                    style: style16.copyWith(color: whiteColor),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
