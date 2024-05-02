import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:proevent_project/component/text_utils.dart';


class ContainerUnder extends StatelessWidget {
  final String text;
  final  String  textType;
  final Function() onPressed;
  const ContainerUnder({
    required this.text,
    required this.onPressed,
    required this.textType,
    super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 100,
      decoration: BoxDecoration(
         // color: Get.isDarkMode? mainColor:pinkClr,
        color: Colors.blue,
          borderRadius: BorderRadius.only(
            //khtr hajti bih men fou9 khaw
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20)
          )
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextUtils(text: text, fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.white,
              underline: TextDecoration.none),
          TextButton(
            onPressed:onPressed, child:

          Center(
            child: TextUtils(text: textType
                , fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.white,
                underline: TextDecoration.underline),
          ),)
        ],
      ),
    );
  }
}
