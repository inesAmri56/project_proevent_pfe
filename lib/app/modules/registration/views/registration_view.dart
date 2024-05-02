import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter/cupertino.dart';
import '../../../../component/Text_button.dart';
import '../../../../component/my_string.dart';
import '../../../../component/text_utils.dart';
import '../../../../component/auth_text_field.dart';
import '../../../../component/container_under.dart';
import '../controllers/registration_controller.dart';
import '../../Home/views/home_view.dart';
import '../../login/views/login_view.dart';

class RegistrationView extends GetView<RegistrationController> {
  RegistrationView({Key? key}) : super(key: key);
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                width: double.infinity,
                height: MediaQuery.of(context).size.height / 1.3,
                child: Padding(
                  padding: EdgeInsets.only(left: 25, right: 25, top: 40),
                  child: Form(
                    key: formKey,
                    child: Column(
                      children: [
                        Row(
                          children: [
                            TextUtils(
                              text: 'LOG',
                              fontSize: 28,
                              fontWeight: FontWeight.w500,
                              color: Colors.black,
                              underline: TextDecoration.none,
                            ),
                            SizedBox(width: 3),
                            TextUtils(
                              text: 'IN',
                              fontSize: 28,
                              fontWeight: FontWeight.w500,
                              color: Colors.black,
                              underline: TextDecoration.none,
                            ),
                          ],
                        ),
                        SizedBox(height: 50),
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.grey[200], // Couleur de fond de la boîte de texte
                            borderRadius: BorderRadius.circular(10), // Bord arrondi
                          ),
                          child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 10),
                            child: AuthTextFromField(
                              controller: TextEditingController(text: controller.email.value),
                              obscuredText: false,
                              validator: (value) {
                                if (!RegExp(validationEmail).hasMatch(value ?? '')) {
                                  return "E-mail invalide";
                                } else
                                  return null;
                              },
                              prefixIcon: Icon(CupertinoIcons.mail, color: Colors.blue, size: 30),
                              hintText: "E-mail",
                              //border: InputBorder.none, // Supprime la bordure par défaut
                            ),
                          ),
                        ),
                        SizedBox(height: 40),
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.grey[200], // Couleur de fond de la boîte de texte
                            borderRadius: BorderRadius.circular(10), // Bord arrondi
                          ),
                          child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 10),
                            child: AuthTextFromField(
                              controller: controller.passwordController,
                              obscuredText: !controller.isPasswordVisible.value,
                              validator: (value) {
                                if (value.toString().length < 6) {
                                  return "Le mot de passe doit contenir au moins 6 caractères";
                                } else
                                  return null;
                              },
                              prefixIcon: Icon(CupertinoIcons.lock, color: Colors.blue, size: 30),
                              suffixIcon: IconButton(
                                onPressed: () {
                                  controller.togglePasswordVisibility();
                                },
                                icon: Icon(controller.isPasswordVisible.value ? CupertinoIcons.eye : CupertinoIcons.eye_slash, color: Colors.black),
                              ),
                              hintText: "Mot de passe",
                             // border: InputBorder.none, // Supprime la bordure par défaut
                            ),
                          ),
                        ),
                        SizedBox(height: 100),
                        ElevatedButton(
                          onPressed: () {
                            if (formKey.currentState?.validate() ?? false) {
                              // Si le formulaire est valide, enregistrez l'utilisateur
                              controller.register();
                              // Ensuite, naviguez vers la page d'accueil
                              Get.off(() => HomeView());
                            }
                          }, child: AuthButton(onPressed: () {
                          Get.off(HomeView());
                        }, text: "Log In"),

                        ),

                      ],
                    ),
                  ),
                ),
              ),
              Center(
                child: ContainerUnder(
                  text: "You don't have an Account?",
                  textType: "Sign Up",
                  onPressed: () {
                    Get.to(() => LoginView());
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
