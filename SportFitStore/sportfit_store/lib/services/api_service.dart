import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService {
  // ⚙️ Cambia esta IP si tu XAMPP usa otra (debe coincidir con tu WiFi)
  static const String baseUrl =
      "http://192.168.18.7/SportFitStore/backend/users";

  // 🔹 LOGIN
  static Future<Map<String, dynamic>> login(
    String email,
    String password,
  ) async {
    try {
      final url = Uri.parse("$baseUrl/login.php");
      print("📡 Login URL: $url");

      final res = await http.post(
        url,
        headers: {'Content-Type': 'application/x-www-form-urlencoded'},
        body: {'email': email, 'password': password},
      );

      print("✅ Código: ${res.statusCode}");
      print("📩 Respuesta: ${res.body}");

      if (res.statusCode == 200 && res.body.isNotEmpty) {
        final data = json.decode(res.body);

        if (data is Map<String, dynamic>) {
          return {
            'success': data['success'] ?? false,
            'message': data['message'] ?? 'Error desconocido',
            'user': data['user'] ?? {},
          };
        } else {
          return {'success': false, 'message': 'Formato de respuesta inválido'};
        }
      } else {
        return {'success': false, 'message': 'Error del servidor'};
      }
    } catch (e) {
      print("❌ Error login: $e");
      return {'success': false, 'message': 'Error al conectar con el servidor'};
    }
  }

  // 🔹 REGISTRO
  static Future<Map<String, dynamic>> register(
    String name,
    String email,
    String password,
  ) async {
    try {
      final url = Uri.parse("$baseUrl/register.php");
      print("📡 Registro URL: $url");

      final res = await http.post(
        url,
        headers: {'Content-Type': 'application/x-www-form-urlencoded'},
        body: {'name': name, 'email': email, 'password': password},
      );

      print("✅ Código: ${res.statusCode}");
      print("📩 Respuesta: ${res.body}");

      if (res.statusCode == 200 && res.body.isNotEmpty) {
        final data = json.decode(res.body);

        if (data is Map<String, dynamic>) {
          return {
            'success': data['success'] ?? false,
            'message': data['message'] ?? 'Error desconocido',
          };
        } else {
          return {'success': false, 'message': 'Formato de respuesta inválido'};
        }
      } else {
        return {'success': false, 'message': 'Error del servidor'};
      }
    } catch (e) {
      print("❌ Error registro: $e");
      return {'success': false, 'message': 'Error al conectar con el servidor'};
    }
  }

  // 🔹 PRODUCTOS
  static Future<List<dynamic>> getProducts() async {
    try {
      final url = Uri.parse(
        "http://192.168.18.7/SportFitStore/backend/products/get_products.php",
      );

      final res = await http.get(url);

      if (res.statusCode == 200 && res.body.isNotEmpty) {
        final data = json.decode(res.body);
        return data is List ? data : [];
      } else {
        return [];
      }
    } catch (e) {
      print("❌ Error productos: $e");
      return [];
    }
  }
}
