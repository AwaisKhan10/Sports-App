import 'package:flutter/material.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';
import 'package:provider/provider.dart';
import 'package:sports_app/core/constant/app_assets.dart';
import 'package:sports_app/core/constant/auth_field_decoration.dart';
import 'package:sports_app/core/constant/colors.dart';
import 'package:sports_app/core/constant/text_style.dart';
import 'package:sports_app/ui/screens/profile/profile_view_model.dart';
import 'package:sports_app/widget/drop_down_expendable_button.dart';
import 'package:sports_app/widget/header.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sports_app/widget/register_button.dart';
import 'package:sports_app/widget/switch_button.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ProfileViewModel(),
      child: Consumer<ProfileViewModel>(
        builder: (context, model, child) {
          return Scaffold(
            appBar: AppBar(backgroundColor: whiteColor),
            backgroundColor: scaffoldColor,
            body: SingleChildScrollView(
              child: Column(
                children: [
                  CustomHeader(
                    title: 'My Profile',
                    icon: Icons.arrow_back_rounded,
                  ),
                  CustomDropDownExpendableButton(
                    text:
                        'Welcome to the Avaya App. For great in-app features such as posting to the Fan Engagement Wall and social sharing, please create a profile here. Digital Ticketing is a separate feature with your Earthquakes Ticketmaster Account login details.',
                  ),
                  //    _DropDownArrowContainer(),
                  30.verticalSpace,
                  _ProfileImage(),
                  30.verticalSpace,
                  _dataForm(model),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  ///
  ///     profile image section
  ///
  Container _ProfileImage() {
    return Container(
      height: 130.h,
      width: 130.w,
      decoration: BoxDecoration(),
      child: Padding(
        padding: EdgeInsets.all(5),
        child: Image.asset(AppAssets().profilePic, scale: 4),
      ),
    );
  }

  ///
  ///   user data forms
  ///
  ///
  Widget _dataForm(ProfileViewModel model) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25.0),
      child: Column(
        children: [
          TextFormField(
            decoration: authFieldDecoration.copyWith(hintText: 'Firs name '),
          ),
          20.verticalSpace,
          TextFormField(
            decoration: authFieldDecoration.copyWith(hintText: 'Firs name '),
          ),
          20.verticalSpace,
          TextFormField(
            decoration: authFieldDecoration.copyWith(hintText: 'Firs name '),
          ),
          40.verticalSpace,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'I would like to receive notification on this \n mobile app',
                style: style16.copyWith(fontWeight: FontWeight.w400),
              ),
              CustomSwitchButton(
                onChanged: (bool value) {
                  print("Switch is now: $value");
                },
                initialValue: false,
              ),
            ],
          ),
          40.verticalSpace,
          CustomRegisterButton(
            firstColor: primaryColor,
            secondColor: primaryColor,
            title: 'save changes',
            firstTextColor: whiteColor,
            secondTextColor: whiteColor,
          ),
          30.verticalSpace,
          CustomRegisterButton(
            firstColor: secondaryColor,
            secondColor: secondSecondaryColor,
            title: 'save changes',
            firstTextColor: whiteColor,
            secondTextColor: whiteColor,
          ),
        ],
      ),
    );
  }
}
