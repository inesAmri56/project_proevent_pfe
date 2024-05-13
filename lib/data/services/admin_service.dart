import 'package:http/http.dart' as http;

class AdminService {
  Future<bool> isAdmin(String email, String password) async {
    final response = await http.post(
      Uri.parse('10.0.2.2:8080'), // Remplacez YOUR_API_URL par votre URL d'API
      body: {'email': email, 'password': password},
    );

    if (response.statusCode == 200) {
      // Analyser la réponse et retourner true ou false en fonction de la logique de votre backend
      return true; // Exemple de réponse
    } else {
      // Gérer les erreurs ou les codes de statut non attendus
      throw Exception('Failed to check admin status');
    }
  }

// Ajoutez d'autres méthodes pour approuver ou rejeter un utilisateur
}
