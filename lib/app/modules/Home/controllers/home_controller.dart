import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';

class HomeController extends GetxController {
  final count = 0.obs;

  // Liste des noms de catégories
  final List<String> catNames = [
    "Galerie",
    "Video",
    "Document",
  ];

  // Liste des couleurs de catégories
  final List<Color> catColors = [
    Color(0xFFF9CE69),
    Colors.deepPurple,
    Color(0xFF9BBBFC),
  ];

  // Liste des icônes de catégories
  final List<Icon> catIcons = [
    Icon(CupertinoIcons.photo, color: Colors.white, size: 30,),
    Icon(CupertinoIcons.videocam_circle_fill, color: Colors.white, size: 30,),
    Icon(CupertinoIcons.doc_text, color: Colors.white, size: 30,),
  ];

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
  }

  // Méthode pour vérifier si l'utilisateur est un administrateur
  bool get isAdmin {
    // Implémentez votre logique pour déterminer si l'utilisateur est un administrateur
    // Pour l'instant, nous allons juste simuler que l'utilisateur actuel est un administrateur
    return true; // Mettez à jour cette logique selon vos besoins
  }

  void increment() => count.value++;
}
