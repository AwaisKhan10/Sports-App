import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sports_app/core/others/base_view_model.dart';
import 'package:sports_app/core/services/auth_services.dart';
import 'package:sports_app/locator.dart';
import 'package:sports_app/ui/auth/sign_in/sign_in_screen.dart';

class RegisterViewModel extends BaseViewModel {
  final _authService = locator<AuthService>();

  // Controllers for text fields
  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  bool _isLoading = false;
  String? _error;
  bool _isFormValid = false;

  bool get isLoading => _isLoading;
  String? get error => _error;
  bool get isFormValid => _isFormValid;

  bool visible = false;
  bool visibleConfirm = false;

  toogleVisiblity() {
    visible = !visible;
    notifyListeners();
  }

  toogleVisiblityConfirm() {
    visibleConfirm = !visibleConfirm;
    notifyListeners();
  }

  RegisterViewModel() {
    // Add listeners to all controllers to validate form in real-time
    firstNameController.addListener(_validateForm);
    lastNameController.addListener(_validateForm);
    emailController.addListener(_validateForm);
    passwordController.addListener(_validateForm);
    confirmPasswordController.addListener(_validateForm);
  }

  void _validateForm() {
    _isFormValid =
        firstNameController.text.isNotEmpty &&
        lastNameController.text.isNotEmpty &&
        emailController.text.isNotEmpty &&
        passwordController.text.isNotEmpty &&
        confirmPasswordController.text.isNotEmpty &&
        passwordController.text == confirmPasswordController.text;
    notifyListeners();
  }

  Future<void> register({
    required String firstName,
    required String lastName,
    required String email,
    required String password,
  }) async {
    _isLoading = true;
    _error = null;
    notifyListeners();

    try {
      final result = await _authService.register(
        firstName: firstName,
        lastName: lastName,
        email: email,
        password: password,
      );

      if (result.success) {
        Get.snackbar('Sucessfully', "Your Account is Register Sucessfully");
        Get.off(() => SignInScreen());
      } else {
        _error = result.message ?? 'Registration failed';
        Get.snackbar('Error', "User already exists with this email.");
      }
    } catch (e) {
      _error = e.toString();
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  void clearError() {
    _error = null;
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
