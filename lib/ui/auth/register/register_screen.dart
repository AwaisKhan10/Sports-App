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
              appBar: AppBar(
                automaticallyImplyLeading: true,
                backgroundColor: whiteColor,
                centerTitle: true,
                title: Text(
                  'Register a Profile',
                  style: style20B.copyWith(color: blackColor, fontSize: 22.sp),
                ),
              ),
              body: SingleChildScrollView(
                child: Column(
                  children: [
                    CustomDropDownExpendableButton(
                      text:
                          'Welcome to the Avaya App. For great in-app features such as posting to the Fan Engagement Wall and social sharing, please create a profile here. Digital Ticketing is a separate feature with your Earthquakes Ticketmaster Account login details.',
                    ),
                    50.verticalSpace,
                    _registerSection(model),
                  ],
                ),
              ),
            ),
      ),
    );
  }

  Widget _registerSection(RegisterViewModel model) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25.0),
      child: Form(
        key: model.formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            _buildTextField(
              'Type your first name',
              model.firstNameController,
              model.validateForm,
              model.firstNameError,
            ),
            _buildTextField(
              'Type your last name',
              model.lastNameController,
              model.validateForm,
              model.lastNameError,
            ),
            _buildTextField(
              'Type your email',
              model.emailController,
              model.validateForm,
              model.emailError,
            ),
            _buildPasswordField(
              'Password',
              model.passwordController,
              model.validateForm,
              model.passwordError,
              model.isPasswordVisible,
              model.togglePasswordVisibility,
            ),
            _buildPasswordField(
              'Confirm Password',
              model.confirmPasswordController,
              model.validateForm,
              model.confirmPasswordError,
              model.isConfirmPasswordVisible,
              model.toggleConfirmPasswordVisibility,
            ),
            30.verticalSpace,
            Text(
              'Password should be at least one characters and contain at least one letter and one number',
              style: style16.copyWith(fontWeight: FontWeight.w400),
            ),
            30.verticalSpace,
            CustomRegisterButton(
              onPressed:
                  model.isFormValid ? () => Get.to(() => DrawerScreen()) : null,
              color:
                  model.isFormValid
                      ? secondaryColor
                      : secondaryColor.withOpacity(0.10),
              title: 'Register',
              textColor: model.isFormValid ? whiteColor : blackColor,
            ),
            40.verticalSpace,
          ],
        ),
      ),
    );
  }

  Widget _buildTextField(
    String hintText,
    TextEditingController controller,
    Function() onChanged,
    String? errorText, {
    bool isObscure = false,
  }) {
    return Column(
      children: [
        TextFormField(
          controller: controller,
          obscureText: isObscure,
          decoration: authFieldDecoration.copyWith(
            hintText: hintText,
            errorText: errorText,
          ),
          onChanged: (_) => onChanged(),
        ),
        20.verticalSpace,
      ],
    );
  }

  Widget _buildPasswordField(
    String hintText,
    TextEditingController controller,
    Function() onChanged,
    String? errorText,
    bool isPasswordVisible,
    Function() toggleVisibility,
  ) {
    return Column(
      children: [
        TextFormField(
          controller: controller,
          obscureText: !isPasswordVisible,
          decoration: authFieldDecoration.copyWith(
            hintText: hintText,
            errorText: errorText,
            suffixIconColor: lightgreyColor,
            suffixIcon: IconButton(
              icon: Icon(
                isPasswordVisible ? Icons.visibility : Icons.visibility_off,
              ),
              onPressed: toggleVisibility,
            ),
          ),
          onChanged: (_) => onChanged(),
        ),
        20.verticalSpace,
      ],
    );
  }
}
