// ignore_for_file: use_key_in_widget_constructors, deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:sports_app/core/constant/auth_field_decoration.dart';
import 'package:sports_app/core/constant/colors.dart';
import 'package:sports_app/core/constant/text_style.dart';
import 'package:sports_app/ui/auth/register/register_view_model.dart';
import 'package:sports_app/widget/buttons/custom_button.dart';
import 'package:sports_app/widget/drop_down_expendable_button.dart';

class RegisterScreen extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => RegisterViewModel(),
      child: Consumer<RegisterViewModel>(
        builder:
            (context, model, child) => Scaffold(
              backgroundColor: whiteColor,
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
                    _registerSection(context, model),
                  ],
                ),
              ),
            ),
      ),
    );
  }

  Widget _registerSection(BuildContext context, RegisterViewModel model) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25.0),
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            _buildTextField(
              'Type your first name',
              model.firstNameController,
              (value) =>
                  value == null || value.isEmpty
                      ? 'First name is required'
                      : null,
            ),

            _buildTextField(
              'Type your last name',
              model.lastNameController,
              (value) =>
                  value == null || value.isEmpty
                      ? 'Last name is required'
                      : null,
            ),
            _buildTextField(
              'Type your email',
              model.emailController,
              (value) =>
                  !RegExp(
                        r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$',
                      ).hasMatch(value ?? '')
                      ? 'Enter a valid email'
                      : null,
            ),
            _buildPasswordField(
              'Password',
              model.passwordController,
              (value) =>
                  ((value?.length ?? 0) < 6)
                      ? 'Password must be at least 6 characters'
                      : null,
              model,
              model.visible,

              () {
                model.toogleVisiblity();
              },
              model.visible,
            ),
            _buildPasswordField(
              'Confirm Password',
              model.confirmPasswordController,
              (value) =>
                  value != model.passwordController.text
                      ? 'Passwords do not match'
                      : null,
              model,
              model.visibleConfirm,
              () {
                model.toogleVisiblityConfirm();
              },
              model.visibleConfirm,
            ),
            30.verticalSpace,
            Text(
              'Password should be at least 6 characters and contain at least one letter and one number',
              style: style16.copyWith(fontWeight: FontWeight.w400),
            ),
            30.verticalSpace,
            CustomButton(
              onPressed:
                  model.isLoading
                      ? null
                      : () {
                        if (_formKey.currentState?.validate() == true) {
                          model.register(
                            firstName: model.firstNameController.text,
                            lastName: model.lastNameController.text,
                            email: model.emailController.text,
                            password: model.passwordController.text,
                          );
                        }
                      },
              color:
                  !model.isFormValid
                      ? secondaryColor.withOpacity(0.2)
                      : secondaryColor,
              textColor: !model.isFormValid ? blackColor : whiteColor,

              title: model.isLoading ? 'Registering...' : 'Register',
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
    String? Function(String?) validator,
  ) {
    return Column(
      children: [
        TextFormField(
          controller: controller,
          decoration: authFieldDecoration.copyWith(hintText: hintText),
          validator: validator,
        ),
        20.verticalSpace,
      ],
    );
  }

  Widget _buildPasswordField(
    String hintText,
    TextEditingController controller,
    String? Function(String?) validator,
    RegisterViewModel model,
    bool? obscureText,
    VoidCallback onPressed,
    final visibleNonVisible,
  ) {
    return StatefulBuilder(
      builder: (context, setState) {
        return Column(
          children: [
            TextFormField(
              controller: controller,
              obscureText: obscureText!,
              decoration: authFieldDecoration.copyWith(
                hintText: hintText,
                suffixIconColor: lightgreyColor,
                suffixIcon: IconButton(
                  icon: Icon(
                    visibleNonVisible ? Icons.visibility : Icons.visibility_off,
                  ),
                  onPressed: onPressed,
                ),
              ),
              validator: validator,
            ),
            20.verticalSpace,
          ],
        );
      },
    );
  }
}
