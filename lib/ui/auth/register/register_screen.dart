// ignore_for_file: use_key_in_widget_constructors, deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/route_manager.dart';
import 'package:provider/provider.dart';
import 'package:sports_app/core/constant/auth_field_decoration.dart';
import 'package:sports_app/core/constant/colors.dart';
import 'package:sports_app/core/constant/text_style.dart';
import 'package:sports_app/ui/auth/register/register_view_model.dart';
import 'package:sports_app/ui/screens/drawer/drawer_screen.dart';
import 'package:sports_app/widget/drop_down_expendable_button.dart';
import 'package:sports_app/widget/header.dart';
import 'package:sports_app/widget/register_button.dart';

class RegisterScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => RegisterViewModel(),
      child: Consumer<RegisterViewModel>(
        builder:
            (context, model, child) => Scaffold(
              backgroundColor: scaffoldColor,
              appBar: AppBar(backgroundColor: whiteColor),

              ///
              /// Start Body
              ///
              body: SingleChildScrollView(
                child: Column(
                  children: [
                    CustomHeader(
                      title: ' Register a Profile ',
                      icon: Icons.arrow_back,
                      onTap: () {
                        navigator!.pop(context);
                      },
                    ),
                    CustomDropDownExpendableButton(
                      text:
                          'Welcome to the Avaya App. For great in-app features such as posting to the Fan Engagement Wall and social sharing, please create a profile here. Digital Ticketing is a separate feature with your Earthquakes Ticketmaster Account login details.',
                    ),
                    50.verticalSpace,

                    ///
                    ///  text form fields
                    ///
                    _registerSection(model),
                  ],
                ),
              ),
            ),
      ),
    );
  }

  ///
  ///
  ///
  Widget _registerSection(RegisterViewModel model) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          20.verticalSpace,
          TextFormField(
            decoration: authFieldDecoration.copyWith(
              hintText: 'type your first name',
            ),
          ),
          20.verticalSpace,
          TextFormField(
            decoration: authFieldDecoration.copyWith(
              hintText: 'type your last  name',
            ),
          ),
          20.verticalSpace,
          TextFormField(
            decoration: authFieldDecoration.copyWith(
              hintText: 'type your email',
            ),
          ),

          20.verticalSpace,
          TextFormField(
            obscureText: true,
            decoration: authFieldDecoration.copyWith(hintText: 'Password'),
          ),
          20.verticalSpace,
          TextFormField(
            obscureText: true,
            decoration: authFieldDecoration.copyWith(
              hintText: 'Confirm Password',
            ),
          ),

          30.verticalSpace,
          Text(
            'Password should be at least one characters and contain at least one letter and one number',
            style: style16.copyWith(fontWeight: FontWeight.w400),
          ),
          30.verticalSpace,

          CustomRegisterButton(
            onPressed: () {
              print('screen : $DrawerScreen');
              Get.to(() => DrawerScreen());
            },
            firstColor: thirdSecondaryColor,
            secondColor: secondaryColor,
            title: 'Register',
            firstTextColor: blackColor,
            secondTextColor: whiteColor,
          ),
          40.verticalSpace,
        ],
      ),
    );
  }
}
