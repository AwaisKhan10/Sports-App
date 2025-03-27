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

              ///
              /// Start App Bar
              ///
              appBar: AppBar(
                backgroundColor: whiteColor,
                centerTitle: true,
                title: Text(
                  'SignIn',
                  style: style20B.copyWith(color: blackColor, fontSize: 22.sp),
                ),
              ),

              ///
              /// Start Body
              ///
              body: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    CustomDropDownExpendableButton(
                      text:
                          'Welcome to the Avaya App. For great in-app features such as posting to the Fan Engagement Wall and social sharing, please create a profile here. Digital Ticketing is a separate feature with your Earthquakes Ticketmaster Account login details.',
                    ),
                    50.verticalSpace,
                    _signInSection(context, model),
                  ],
                ),
              ),
            ),
      ),
    );
  }

  Widget _signInSection(BuildContext context, SignInViewModel model) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25.0),
      child: Form(
        key: model.formKey,
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
              onChanged: (value) {
                model.updateEmail(value);
                model.formKey.currentState?.validate();
              },
              validator: model.validateEmail,
            ),
            20.verticalSpace,
            TextFormField(
              obscureText: true,
              decoration: authFieldDecoration.copyWith(hintText: 'Password'),
              onChanged: (value) {
                model.updatePassword(value);
                model.formKey.currentState?.validate();
              },
              validator: model.validatePassword,
            ),
            Align(
              alignment: Alignment.bottomRight,
              child: TextButton(
                onPressed: () {},
                child: Text(
                  'Forget your password?',
                  style: style16B.copyWith(),
                ),
              ),
            ),
            30.verticalSpace,
            CustomRegisterButton(
              onPressed:
                  model.isFormValid
                      ? () {
                        if (model.formKey.currentState?.validate() ?? false) {
                          Get.to(() => DrawerScreen());
                        }
                      }
                      : null,
              title: 'Sign In with Email',
              color: model.isFormValid ? primaryColor : lightRedColor,
              textColor: model.isFormValid ? whiteColor : blackColor,
            ),
            20.verticalSpace,
            Row(
              children: [
                Text(
                  'Don\'t have profile? ',
                  style: style16.copyWith(fontWeight: FontWeight.w400),
                ),
                3.horizontalSpace,
                GestureDetector(
                  onTap: () {
                    Get.to(() => RegisterScreen());
                  },
                  child: Text(
                    'Create one now ',
                    style: style16.copyWith(fontWeight: FontWeight.w600),
                  ),
                ),
              ],
            ),
            40.verticalSpace,
            CustomLineWithText(text: 'or continue with', lineWidth: 120.w),
            40.verticalSpace,
            CustomRegisterButton(
              imageUrl: AppAssets().X,

              title: 'Sign In with X',
              color: blackColor,
              textColor: whiteColor,
            ),
            20.verticalSpace,
            CustomRegisterButton(
              imageUrl: AppAssets().linkedin,

              color: secondaryColor,
              title: 'Sign In with Linkedin',
              textColor: whiteColor,
            ),
            40.verticalSpace,
          ],
        ),
      ),
    );
  }
}
