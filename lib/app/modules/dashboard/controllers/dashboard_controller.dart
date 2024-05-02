import 'package:get/get.dart';

class DashboardController extends GetxController {
  final count = 0.obs;
  RxDouble participationRate = 0.0.obs;
  RxDouble averageCostPerEvent = 0.0.obs;
  RxList employeeFeedback = [].obs;

  @override
  void onInit() {
    super.onInit();
    fetchData();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void increment() => count.value++;

  // Méthode de récupération de données
  void fetchData() {
    // Données simulées pour la démonstration
    participationRate.value = 75.0; // Exemple de taux de participation
    averageCostPerEvent.value = 500.0; // Exemple de coût moyen par événement
    employeeFeedback.assignAll([
      'Feedback positif sur les nouvelles politiques de l\'entreprise',
      'Suggestion pour améliorer la communication au sein des équipes',
      'Demande de plus d\'activités de renforcement d\'équipe'
    ]);
  }
}
