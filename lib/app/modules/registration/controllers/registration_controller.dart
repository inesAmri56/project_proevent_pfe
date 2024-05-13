import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../../../data/models/user.dart';
import '../../../../data/services/auth_service.dart';
import '../../login/views/login_view.dart';


class RegistrationController extends GetxController {
  var email = ''.obs;
  var password = ''.obs;
  var username = ''.obs;
  var isPasswordHidden = true.obs;

  late TextEditingController passwordController = TextEditingController();


  void togglePasswordVisibility() {
    isPasswordHidden.value = !isPasswordHidden.value;
  }


  String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return "* Required";
    } else if (!GetUtils.isEmail(value)) {
      return "Invalid email format";
    }
    return null;
  }
  String? validateUsername(String? value) {
    if (value == null || value.isEmpty) {
      return "* Required";
    } else if (!_isString(value)) {
      return "Username should be a string";
    }
    return null;
  }
  bool _isString(dynamic value) {
    return value is String;
  }
  String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return "* Required";
    } else if (value.length < 6) {
      return "Password should be at least 6 characters";
    } else if (value.length > 15) {
      return "Password should not exceed 15 characters";
    }
    return null;
  }
  final AuthService _authService = AuthService();
  final RxBool isLoading = false.obs;

  Future<void> signUp(String username, String email, String password) async {
    isLoading.value = true;
    try {
      User user = User(username: username, email: email, password: password);
      await _authService.signUp(user);
      // Navigate to the login view after successful registration
      Get.to(LoginView());
    } catch (e) {
      // Handle registration errors
      print('Failed to sign up: $e');
      // Show an error message to the user
      Get.snackbar(
        'Failed to Sign Up',
        'An error occurred while signing up. Please try again.',
        snackPosition: SnackPosition.BOTTOM,
      );
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> login(String email, String password) async {
    isLoading.value = true;
    try {
      await _authService.login(email, password);
      // Navigate to the next view after successful login
      // Replace `NextView` with the desired view to navigate to after login
      // Get.to();
    } catch (e) {
      // Handle login errors
      print('Failed to login: $e');
      // Show an error message to the user
      Get.snackbar(
        'Failed to Login',
        'An error occurred while logging in. Please try again.',
        snackPosition: SnackPosition.BOTTOM,
      );
    } finally {
      isLoading.value = false;
    }
  }
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
    email.close();
    password.close();
    username.close();
    isPasswordHidden.close();
  }

}
