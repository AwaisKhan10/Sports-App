// ignore_for_file: use_key_in_widget_constructors, deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/route_manager.dart';
import 'package:provider/provider.dart';
import 'package:sports_app/core/constant/app_assets.dart';
import 'package:sports_app/core/constant/auth_field_decoration.dart';
import 'package:sports_app/core/constant/colors.dart';
import 'package:sports_app/core/constant/text_style.dart';
import 'package:sports_app/ui/auth/register/register_screen.dart';
import 'package:sports_app/ui/auth/sign_in/sign_in_view_model.dart';
import 'package:sports_app/ui/screens/drawer/drawer_screen.dart';
import 'package:sports_app/widget/drop_down_expendable_button.dart';
import 'package:sports_app/widget/header.dart';
import 'package:sports_app/widget/line_withText.dart';
import 'package:sports_app/widget/register_button.dart';

class SignInScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => SignInViewModel(),
      child: Consumer<SignInViewModel>(
        builder:
            (context, model, child) => Scaffold(
              backgroundColor: scaffoldColor,
              appBar: AppBar(backgroundColor: whiteColor),

              ///
              /// Start Body
              ///
              body: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,

                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    CustomHeader(title: 'SignIn'),
                    CustomDropDownExpendableButton(
                      text:
                          'Welcome to the Avaya App. For great in-app features such as posting to the Fan Engagement Wall and social sharing, please create a profile here. Digital Ticketing is a separate feature with your Earthquakes Ticketmaster Account login details.',
                    ),
                    50.verticalSpace,

                    ///
                    ///  text form fields
                    ///
                    _signInSection(model),
                  ],
                ),
              ),
            ),
      ),
    );
  }

  Widget _signInSection(SignInViewModel model) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text('Welcome to App', style: style25B.copyWith()),
          10.verticalSpace,
          Text(
            'Creating a profile and signing will allow you \n to use app',
            style: style18.copyWith(),
          ),
          20.verticalSpace,
          TextFormField(
            decoration: authFieldDecoration.copyWith(hintText: 'Email'),
          ),
          20.verticalSpace,
          TextFormField(
            obscureText: true,
            decoration: authFieldDecoration.copyWith(hintText: 'Password'),
          ),
          20.verticalSpace,
          Align(
            alignment: Alignment.bottomRight,
            child: Text('Forget your password?', style: style16.copyWith()),
          ),
          30.verticalSpace,
          CustomRegisterButton(
            onPressed: () {
              Get.to(() => DrawerScreen()); // ✅ Now it will navigate
            },
            firstColor: lightRedColor,
            secondColor: primaryColor,
            title: 'Sign In with Email',
            firstTextColor: blackColor,
            secondTextColor: whiteColor,
          ),
          20.verticalSpace,
          Row(
            children: [
              Text(
                'Dont have profile? ',
                style: style16.copyWith(fontWeight: FontWeight.w400),
              ),
              3.horizontalSpace,
              GestureDetector(
                onTap: () {
                  Get.to(RegisterScreen());
                  print('Screen name $RegisterScreen');
                },
                child: Text(
                  'Create one now ',
                  style: style16.copyWith(fontWeight: FontWeight.w600),
                ),
              ),
            ],
          ),
          40.verticalSpace,
          CustomLineWithText(text: 'or continue with', lineWidth: 130.w),
          40.verticalSpace,
          CustomRegisterButton(
            imageUrl: AppAssets().X,
            firstColor: blackColor,
            secondColor: blackColor,
            title: 'Sign In with X',
            firstTextColor: whiteColor,
            secondTextColor: whiteColor,
          ),
          20.verticalSpace,
          CustomRegisterButton(
            imageUrl: AppAssets().linkedin,
            firstColor: secondaryColor,
            secondColor: secondaryColor,
            title: 'Sign In with Linkedin',
            firstTextColor: whiteColor,
            secondTextColor: whiteColor,
          ),
          40.verticalSpace,
        ],
      ),
    );
  }
}
