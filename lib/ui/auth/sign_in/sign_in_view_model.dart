// ignore_for_file: avoid_print

import 'package:get/get.dart';
import 'package:sports_app/core/enums/view_state.dart';
import 'package:sports_app/core/others/base_view_model.dart';
import 'package:sports_app/core/services/auth_services.dart';
import 'package:sports_app/locator.dart';
import 'package:sports_app/ui/screens/drawer/drawer_screen.dart';

class SignInViewModel extends BaseViewModel {
  final _authService = locator<AuthService>();
  bool _isLoading = false;
  String? _error;
  bool visible = false;
  String _email = '';
  String _password = '';
  bool get isLoading => _isLoading;
  String? get error => _error;

  bool get isFormValid {
    final emailRegex = RegExp(
      r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$',
    );
    return emailRegex.hasMatch(_email) && _password.length >= 6;
  }

  toogleVisiblity() {
    visible = !visible;
    notifyListeners();
  }

  void updateEmail(String value) {
    _email = value;
    notifyListeners();
  }

  void updatePassword(String value) {
    _password = value;
    notifyListeners();
  }

  Future<void> login({required String email, required String password}) async {
    _isLoading = true;
    _error = null;
    notifyListeners();

    try {
      final result = await _authService.login(email: email, password: password);
      if (result.success) {
        Get.snackbar("Sucessfully", "Your Account is login Sucessfully");
        Get.offAll(() => DrawerScreen());
      } else {
        _error = result.message ?? 'Login failed';
        print("LOGIN => $_error");
        Get.snackbar('Login Message', "Please Check your Email and Password");
      }
    } catch (e) {
      _error = e.toString();
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<void> loginWithGoogle() async {
    setState(ViewState.busy);

    try {
      final result = await _authService.loginWithGoogle();

      if (result.success) {
        Get.snackbar("Sucess", "Google login Sucessfully");
        Get.offAll(() => DrawerScreen());
      } else {
        _error = result.message ?? 'Google login failed';
      }
    } catch (e) {
      _error = e.toString();
    } finally {
      setState(ViewState.idle);
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
        _error = result.message ?? 'Apple login failed';
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
