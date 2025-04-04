import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sports_app/core/services/auth_services.dart';
import 'package:sports_app/ui/screens/drawer/drawer_screen.dart';
import 'package:sports_app/ui/screens/home/home_screen.dart';

class SignInViewModel extends ChangeNotifier {
  final _authService = AuthService();
  bool _isLoading = false;
  String? _error;

  bool get isLoading => _isLoading;
  String? get error => _error;

  Future<void> login({required String email, required String password}) async {
    _isLoading = true;
    _error = null;
    notifyListeners();

    try {
      final result = await _authService.login(email: email, password: password);

      if (result.success) {
        // Navigate to home screen or dashboard
        Get.offAll(
          () => DrawerScreen(),
        ); // Uncomment and import your home screen
      } else {
        _error = result.error ?? 'Login failed';
      }
    } catch (e) {
      _error = e.toString();
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<void> loginWithGoogle() async {
    _isLoading = true;
    _error = null;
    notifyListeners();

    try {
      final result = await _authService.loginWithGoogle();

      if (result.success) {
        Get.offAll(() => DrawerScreen());
      } else {
        _error = result.error ?? 'Google login failed';
      }
    } catch (e) {
      _error = e.toString();
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<void> loginWithApple() async {
    _isLoading = true;
    _error = null;
    notifyListeners();

    try {
      final result = await _authService.loginWithApple();

      if (result.success) {
        Get.offAll(() => DrawerScreen());
      } else {
        _error = result.error ?? 'Apple login failed';
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
