import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import '../../../../data/services/auth_service.dart';
import '../../pendingAccounts/bindings/pending_accounts_binding.dart';

class LoginController extends GetxController {
  var email = ''.obs;
  var password = ''.obs;
  var username = ''.obs;
  var isPasswordHidden = true.obs;
  var isAdmin = false.obs;
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final AuthService authService = Get.put(AuthService());
  final GetStorage storage = GetStorage();

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

  void login() async {
    final String emailValue = emailController.text.trim();
    final String passwordValue = passwordController.text.trim();

    try {
      final user = await authService.login(emailValue, passwordValue);
      if (user != null) {
        // Store credentials in local storage
        storage.write('email', emailValue);
        storage.write('password', passwordValue);

        // Navigate to the next page
        Get.offAll(() => PendingAccountsBinding());
      } else {
        // Handle login failure due to incorrect credentials
        Get.snackbar('Login Failed', 'Invalid credentials',
            snackPosition: SnackPosition.BOTTOM);
      }
    } catch (e) {
      // Handle errors during login
      Get.snackbar('Login Failed', e.toString(),
          snackPosition: SnackPosition.BOTTOM);
    }
  }

  void loadUserCredentials() {
    emailController.text = storage.read('email') ?? '';
    passwordController.text = storage.read('password') ?? '';
  }

  @override
  void onInit() {
    super.onInit();
    loadUserCredentials();
  }

  @override
  void onClose() {
    // Close observables when the controller is closed
    super.onClose();
    email.close();
    password.close();
    username.close();
    isPasswordHidden.close();
  }
}
