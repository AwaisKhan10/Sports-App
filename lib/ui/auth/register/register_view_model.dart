import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sports_app/core/services/auth_services.dart';
import 'package:sports_app/ui/auth/sign_in/sign_in_screen.dart';

class RegisterViewModel extends ChangeNotifier {
  final _authService = AuthService();
  bool _isLoading = false;
  String? _error;

  bool get isLoading => _isLoading;
  String? get error => _error;

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
        // Navigate to sign in screen after successful registration
        Get.off(() => SignInScreen());
      } else {
        _error = result.error ?? 'Registration failed';
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
}
