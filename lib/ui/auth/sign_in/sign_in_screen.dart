// ignore_for_file: deprecated_member_use, use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/route_manager.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:provider/provider.dart';
import 'package:sports_app/core/constant/app_assets.dart';
import 'package:sports_app/core/constant/auth_field_decoration.dart';
import 'package:sports_app/core/constant/colors.dart';
import 'package:sports_app/core/constant/text_style.dart';
import 'package:sports_app/core/enums/view_state.dart';
import 'package:sports_app/ui/auth/register/register_screen.dart';
import 'package:sports_app/ui/auth/sign_in/sign_in_view_model.dart';
import 'package:sports_app/widget/buttons/custom_button.dart';
import 'package:sports_app/widget/drop_down_expendable_button.dart';
import 'package:sports_app/widget/line_withText.dart';
import 'package:sports_app/widget/buttons/register_button.dart';

class SignInScreen extends StatefulWidget {
  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _emailFocusNode = FocusNode();
  final _passwordFocusNode = FocusNode();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _emailFocusNode.dispose();
    _passwordFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => SignInViewModel(),
      child: Consumer<SignInViewModel>(
        builder:
            (context, model, child) => GestureDetector(
              onTap: () {
                FocusScope.of(context).unfocus();
              },
              child: ModalProgressHUD(
                inAsyncCall: model.state == ViewState.busy,
                child: Scaffold(
                  backgroundColor: whiteColor,

                  ///
                  /// Start AppBar
                  ///
                  appBar: AppBar(
                    backgroundColor: whiteColor,
                    centerTitle: true,
                    title: Text(
                      'Sign In',
                      style: style20B.copyWith(
                        color: blackColor,
                        fontSize: 22.sp,
                      ),
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
                        ///
                        /// Drop Down
                        ///
                        CustomDropDownExpendableButton(
                          text:
                              'Welcome to the Avaya App. For great in-app features such as posting to the Fan Engagement Wall and social sharing, please create a profile here. Digital Ticketing is a separate feature with your Earthquakes Ticketmaster Account login details.',
                        ),
                        50.verticalSpace,

                        ///
                        /// SignIn Section
                        ///
                        _signInSection(context, model),
                      ],
                    ),
                  ),
                ),
              ),
            ),
      ),
    );
  }

  ///
  /// SignIn Section
  ///
  Widget _signInSection(BuildContext context, SignInViewModel model) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25.0),
      child: Form(
        key: _formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text('Welcome to App', style: style25B),
            10.verticalSpace,
            Text(
              'Creating a profile and signing will allow you \n to use app',
              style: style18,
            ),
            20.verticalSpace,

            ///
            /// Email
            ///
            TextFormField(
              controller: _emailController,
              focusNode: _emailFocusNode,
              decoration: authFieldDecoration.copyWith(hintText: 'Email'),
              keyboardType: TextInputType.emailAddress,
              textInputAction: TextInputAction.next,
              onChanged: model.updateEmail,
              onFieldSubmitted: (_) {
                FocusScope.of(context).requestFocus(_passwordFocusNode);
              },
              validator:
                  (value) =>
                      value == null || value.isEmpty
                          ? 'Email is required'
                          : !RegExp(
                            r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$',
                          ).hasMatch(value)
                          ? 'Enter a valid email'
                          : null,
            ),
            20.verticalSpace,

            ///
            /// Password
            ///
            TextFormField(
              controller: _passwordController,
              focusNode: _passwordFocusNode,
              obscureText: model.visible,
              onChanged: model.updatePassword,
              decoration: authFieldDecoration.copyWith(
                hintText: 'Password',
                suffixIcon: IconButton(
                  onPressed: model.toogleVisiblity,
                  icon: Icon(
                    model.visible ? Icons.visibility_off : Icons.visibility,
                  ),
                ),
              ),
              validator:
                  (value) =>
                      value == null || value.isEmpty
                          ? 'Password is required'
                          : value.length < 6
                          ? 'Password must be at least 6 characters'
                          : null,
            ),

            ///
            /// Forgot Password
            ///
            Align(
              alignment: Alignment.bottomRight,
              child: TextButton(
                onPressed: () {
                  // TODO: Implement forgot password
                },
                child: Text('Forgot your password?', style: style16B),
              ),
            ),
            30.verticalSpace,

            ///
            /// SignIn Button
            ///
            CustomButton(
              onPressed:
                  model.isLoading || !model.isFormValid
                      ? null
                      : () {
                        if (_formKey.currentState?.validate() == true) {
                          model.login(
                            email: _emailController.text,
                            password: _passwordController.text,
                          );
                        }
                      },
              title: model.isLoading ? 'Signing in...' : 'Sign In with Email',
              color:
                  (model.isLoading || !model.isFormValid)
                      ? primaryColor.withOpacity(0.50)
                      : primaryColor,
              textColor:
                  (model.isLoading || !model.isFormValid)
                      ? blackColor
                      : whiteColor,
            ),
            20.verticalSpace,

            ///
            /// Donot Have Account
            ///
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Don\'t have profile? ',
                  style: style16.copyWith(fontWeight: FontWeight.w400),
                ),
                3.horizontalSpace,
                GestureDetector(
                  onTap: () => Get.to(() => RegisterScreen()),
                  child: Text(
                    'Create one now',
                    style: style16.copyWith(fontWeight: FontWeight.w600),
                  ),
                ),
              ],
            ),
            40.verticalSpace,
            CustomLineWithText(text: 'or continue with', lineWidth: 120.w),
            40.verticalSpace,

            ///
            /// Google Button
            ///
            CustomRegisterButton(
              imageUrl: AppAssets().google,
              title: 'Sign In with Google',
              color: blackColor,
              textColor: whiteColor,
              onPressed: () async {
                await model.loginWithGoogle();
              },
            ),
            20.verticalSpace,

            ///
            /// Apple Button
            ///
            CustomRegisterButton(
              imageUrl: AppAssets().apple,
              color: secondaryColor,
              title: 'Sign In with Apple',
              textColor: whiteColor,
              onPressed:
                  model.isLoading
                      ? null
                      : () async {
                        await model.loginWithApple();
                      },
            ),
            40.verticalSpace,
          ],
        ),
      ),
    );
  }
}
