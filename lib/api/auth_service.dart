import 'dart:convert';
import 'package:http/http.dart' as https;
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthService {
  static const String apiUrl = 'https://gym5api-production.up.railway.app/api';
  static const _storage = FlutterSecureStorage();

  static Future<Map<String, dynamic>> register(
      Map<String, dynamic> userData) async {
    try {
      final response = await https.post(
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
      final response = await https.post(
        Uri.parse('$apiUrl/login'),
        headers: {'Content-Type': 'application/json'},
        body: json.encode({
          'email': email,
          'password': password,
          'role': role ?? 'Pengguna',
        }),
      );

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        // Save the token and userId in SharedPreferences or secure storage
        await _storage.write(key: 'auth_token', value: data['data']['token']);
        final prefs = await SharedPreferences.getInstance();
        prefs.setInt('userId',
            data['data']['pelanggan']['id_pelanggan']); // Store userId

        return {
          'status': 'success',
          'message': 'Login successful',
          'user': data['data']['pelanggan'],
        };
      } else {
        return {
          'status': 'error',
          'message': 'Login failed: ${response.body}',
        };
      }
    } catch (e) {
      return {'status': 'error', 'message': 'An error occurred: $e'};
    }
  }
}
