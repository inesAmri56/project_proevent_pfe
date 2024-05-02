import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class RegistrationController extends GetxController {
  var email = ''.obs;
  var password = ''.obs;
  var username = ''.obs; // Ajoutez cette ligne pour le champ de saisie du nom d'utilisateur
  late TextEditingController passwordController = TextEditingController();
  var isPasswordVisible = false.obs;

  void togglePasswordVisibility() {
    isPasswordVisible.value = !isPasswordVisible.value;
  }
  @override
  void onInit() {
    super.onInit();
    passwordController = TextEditingController();
  }

  void login() {
    // Logique de connexion ici
    // Utilisez les valeurs de email et password
  }

  void register() {
    // Logique d'inscription ici
    // Utilisez les valeurs de email, password et username
  }

  @override
  void onClose() {
    super.onClose();
    email.close();
    password.close();
    username.close(); // Fermez également le contrôleur pour le champ de saisie du nom d'utilisateur
   isPasswordVisible.close();

  }
}
