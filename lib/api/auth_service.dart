import 'dart:convert';
import 'package:http/http.dart' as http;

class AuthService {
  static const String apiUrl = 'https://your-api-url.com';

  static Future<Map<String, dynamic>> register(
      Map<String, dynamic> userData) async {
    try {
      final response = await http.post(
        Uri.parse('$apiUrl/register'),
        headers: {'Content-Type': 'application/json'},
        body: json.encode(userData),
      );

      if (response.statusCode == 201) {
        return {'status': 'success', 'message': 'Registration successful'};
      } else {
        return {
          'status': 'error',
          'message':
              json.decode(response.body)['message'] ?? 'Registration failed'
        };
      }
    } catch (e) {
      return {'status': 'error', 'message': 'An error occurred: $e'};
    }
  }

  static Future<Map<String, dynamic>> login({
    required String email,
    required String password,
    required String? role,
  }) async {
    try {
      final response = await http.post(
        Uri.parse('$apiUrl/login'),
        headers: {'Content-Type': 'application/json'},
        body: json.encode({
          'email': email,
          'password': password,
          'role': role ?? 'Pengguna',
        }),
      );

      if (response.statusCode == 200) {
        var data = json.decode(response.body);
        return {
          'status': 'success',
          'message': 'Login successful',
          'token': data['token'],
          'user': data['user'],
        };
      } else {
        return {
          'status': 'error',
          'message': 'Invalid email or password',
        };
      }
    } catch (e) {
      return {'status': 'error', 'message': 'An error occurred: $e'};
    }
  }
}
