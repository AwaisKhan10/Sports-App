// ignore_for_file: unused_field

import 'package:sports_app/core/constant/api_end_points.dart';
import 'package:sports_app/core/model/app_user.dart';
import 'package:sports_app/core/model/response/request_response.dart';
import 'package:sports_app/core/services/api_services.dart';
import 'package:sports_app/core/services/database_services.dart';
import 'package:sports_app/core/services/local_storage.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:sign_in_with_apple/sign_in_with_apple.dart';

///
/// [AuthService] class contains all authentication related logic with following
/// methods:
///
/// [doSetup]: This method contains all the initial authentication like checking
/// login status, onboarding status and other related initial app flow setup.
///
/// [signupWithEmailAndPassword]: This method is used for signup with email and password.
///
/// [signupWithApple]:
///
/// [signupWithGmail]:
///
/// [signupWithFacebook]:
///
/// [logout]:
///

class AuthService {
  bool isLogin = false;
  final _localStorageService = LocalStorageService();
  final _dbService = DatabaseServices();
  final _apiService = ApiServices();
  final _googleSignIn = GoogleSignIn(scopes: ['email', 'profile']);
  AppUser appUser = AppUser();

  /// Check if user is logged in
  Future<bool> checkLoginStatus() async {
    final userId = _localStorageService.userId;
    print("UserId: $userId");
    if (userId != null) {
      appUser = _localStorageService.user ?? AppUser();
      print("AppUser: ${appUser.toJson().toString()}");
    }
    isLogin = userId != null;
    return isLogin;
  }

  /// Register a new user with email and password
  Future<RequestResponse<AppUser>> register({
    required String firstName,
    required String lastName,
    required String email,
    required String password,
  }) async {
    try {
      print(email);
      final response = await _apiService.post(
        url: EndPoints.register,
        data: {
          'first_name': firstName,
          'last_name': lastName,
          'email': email,
          'password': password,
        },
      );

      if (response.success) {
        final userId = response.data['data']['user_id'].toString();
        final user = AppUser(
          userId: userId,
          firstName: firstName,
          lastName: lastName,
          email: email,
        );
        appUser = user;
        // Store user data locally
        await _localStorageService.setUserId(userId);
        await _localStorageService.setUser(user);
        isLogin = true;

        return RequestResponse(true, data: user);
      } else {
        return RequestResponse(false, message: response.error);
      }
    } catch (e) {
      return RequestResponse(false, message: e.toString());
    }
  }

  /// Login with email and password
  Future<RequestResponse<AppUser>> login({
    required String email,
    required String password,
  }) async {
    try {
      final response = await _apiService.post(
        url: EndPoints.login,
        data: {'email': email, 'password': password},
      );
      if (response.success &&
          response.data != null &&
          response.data['data'] != null) {
        final userData = response.data['data'];
        final user = AppUser.fromJson(userData);
        appUser = user;
        // Store user data locally
        await _localStorageService.setUserId(user.userId!);
        await _localStorageService.setUser(user);
        isLogin = true;

        return RequestResponse(true, data: user);
      } else {
        return RequestResponse(false, message: response.error);
      }
    } catch (e) {
      return RequestResponse(false, message: e.toString());
    }
  }

  /// Login with Google
  Future<RequestResponse<AppUser>> loginWithGoogle() async {
    try {
      // Start Google Sign In flow
      final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
      if (googleUser == null) {
        return RequestResponse(false, message: 'Google sign in was cancelled');
      }

      // Get Google auth details
      final GoogleSignInAuthentication googleAuth =
          await googleUser.authentication;
      final accessToken = googleAuth.accessToken;

      if (accessToken == null) {
        return RequestResponse(
          false,
          message: 'Failed to get Google access token',
        );
      }

      // Call backend API with Google token
      final response = await _apiService.post(
        url: EndPoints.socialLogin,
        data: {
          'provider': 'google',
          'social_id': accessToken,
          'email': googleUser.email,
          'first_name': googleUser.displayName ?? '',
        },
      );

      if (response.success) {
        final userData = response.data['data'];
        final user = AppUser.fromJson(userData);

        // Store user data locally
        await _localStorageService.setUserId(user.userId!);
        await _localStorageService.setUser(user);
        isLogin = true;

        return RequestResponse(true, data: user);
      } else {
        return RequestResponse(false, message: response.error);
      }
    } catch (e) {
      return RequestResponse(false, message: e.toString());
    }
  }

  /// Login with Apple
  Future<RequestResponse<AppUser>> loginWithApple() async {
    try {
      // Check if Apple Sign In is available
      final isAvailable = await SignInWithApple.isAvailable();
      if (!isAvailable) {
        return RequestResponse(
          false,
          message: 'Apple sign in is not available on this device',
        );
      }

      // Start Apple Sign In flow
      final credential = await SignInWithApple.getAppleIDCredential(
        scopes: [
          AppleIDAuthorizationScopes.email,
          AppleIDAuthorizationScopes.fullName,
        ],
      );

      // Call backend API with Apple token
      final response = await _apiService.post(
        url: EndPoints.socialLogin,
        data: {
          'provider': 'apple',
          'social_id': credential.identityToken,
          'email': credential.email ?? '',
          'first_name': credential.givenName ?? '',
          'last_name': credential.familyName ?? '',
        },
      );

      if (response.success) {
        final userData = response.data['data'];
        final user = AppUser.fromJson(userData);

        // Store user data locally
        await _localStorageService.setUserId(user.userId!);
        await _localStorageService.setUser(user);
        isLogin = true;

        return RequestResponse(true, data: user);
      } else {
        return RequestResponse(false, message: response.error);
      }
    } catch (e) {
      return RequestResponse(false, message: e.toString());
    }
  }

  /// Logout user
  Future<void> logout() async {
    await _localStorageService.clearAll();
    isLogin = false;
  }
}
