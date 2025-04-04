import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sports_app/core/services/auth_services.dart';
import 'package:sports_app/ui/auth/sign_in/sign_in_screen.dart';
import 'package:sports_app/ui/screens/drawer/drawer_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final _authService = AuthService();

  @override
  void initState() {
    super.initState();
    _checkLoginStatus();
  }

  Future<void> _checkLoginStatus() async {
    // Add a small delay to show splash screen
    await Future.delayed(const Duration(seconds: 2));

    final isLoggedIn = await _authService.checkLoginStatus();

    if (mounted) {
      if (isLoggedIn) {
        Get.offAll(() => DrawerScreen());
      } else {
        Get.offAll(() => SignInScreen());
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Add your app logo here
            Image.asset(
              'assets/logo.png',
              width: 150,
              height: 150,
              errorBuilder:
                  (context, error, stackTrace) =>
                      const Icon(Icons.sports, size: 150),
            ),
            const SizedBox(height: 24),
            const CircularProgressIndicator(),
          ],
        ),
      ),
    );
  }
}
