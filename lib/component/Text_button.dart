import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:proevent_project/component/text_utils.dart';

class AuthButton extends StatelessWidget {
  final String text;
  final Function () onPressed;
  const AuthButton ({
    required this.onPressed,
    required this.text,
    super.key

  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
      primary: Get.isDarkMode? Colors.black:Colors.blue,
        minimumSize: const Size(360, 50),
      ),
      child: TextUtils(
        color: Colors.white,
        text:text ,
        fontSize: 18,
        fontWeight: FontWeight.bold,
        underline: TextDecoration.none,
      ),
    );
  }
}
