import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class AuthService {
  static const String apiUrl = 'http://10.0.2.2:8000/api';
  static const _storage = FlutterSecureStorage();

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
      // Check for valid JSON
      if (response.body.isNotEmpty) {
        final data = json.decode(response.body);
        if (response.statusCode == 200) {
          await _storage.write(key: 'auth_token', value: data['data']['token']);
          return {
            'status': 'success',
            'message': 'Login successful',
            'user': data['data']['pelanggan'],
          };
        } else {
          return {
            'status': 'error',
            'message': data['message'] ?? 'Login failed',
          };
        }
      } else {
        return {'status': 'error', 'message': 'Empty response from server'};
      }
    } catch (e) {
      return {'status': 'error', 'message': 'An error occurred: $e'};
    }
  }
}
