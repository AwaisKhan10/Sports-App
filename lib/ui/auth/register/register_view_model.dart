import 'package:flutter/material.dart';
import 'package:sports_app/core/others/base_view_model.dart';

class RegisterViewModel extends BaseViewModel {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  bool isFormValid = false;
  String? firstNameError;
  String? lastNameError;
  String? emailError;
  String? passwordError;
  String? confirmPasswordError;

  bool isPasswordVisible = false;
  bool isConfirmPasswordVisible = false;

  void togglePasswordVisibility() {
    isPasswordVisible = !isPasswordVisible;
    notifyListeners();
  }

  void toggleConfirmPasswordVisibility() {
    isConfirmPasswordVisible = !isConfirmPasswordVisible;
    notifyListeners();
  }

  void validateForm() {
    firstNameError =
        firstNameController.text.isEmpty ? 'First name is required' : null;
    lastNameError =
        lastNameController.text.isEmpty ? 'Last name is required' : null;
    emailError =
        !RegExp(
              r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$',
            ).hasMatch(emailController.text)
            ? 'Enter a valid email (e.g., example@example.com)'
            : null;

    passwordError =
        passwordController.text.length < 6
            ? 'Password must be at least 6 characters long'
            : null;

    confirmPasswordError =
        passwordController.text != confirmPasswordController.text
            ? 'Passwords do not match'
            : null;

    isFormValid =
        firstNameError == null &&
        lastNameError == null &&
        emailError == null &&
        passwordError == null &&
        confirmPasswordError == null;
    notifyListeners();
  }

  @override
  void dispose() {
    firstNameController.dispose();
    lastNameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }
}
