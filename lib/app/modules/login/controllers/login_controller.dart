import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';


import '../../../../data/services/admin_service.dart';
import '../../BottomNavigationBar/views/bottom_navigation_bar_view.dart';


class LoginController extends GetxController {
  var email = ''.obs;
  var password = ''.obs;
  var username = ''.obs;
  var isPasswordHidden = true.obs;
  var isAdmin = false.obs; // Variable pour suivre le statut de l'administrateur
  late TextEditingController passwordController = TextEditingController();
   AdminService adminService = Get.put(AdminService());


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

  @override
  void onInit() {
    super.onInit();
    passwordController = TextEditingController();
  }

void  checkAdmin() {
    // Vérifiez si l'utilisateur est un administrateur en utilisant le service AdminService
  isAdmin.value = adminService.isAdmin(email.value, password.value) as bool ;
  }

  void register() {}

  @override
  void onClose() {
    super.onClose();
    email.close();
    password.close();
    username.close();
    isPasswordHidden.close();
  }
}
