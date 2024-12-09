// lib/client/AlatGymClient.dart

import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:tubes_pbp_gym/entity/AlatGym.dart'; // Pastikan path sesuai dengan folder tempat file AlatGym.dart

class AlatGymClient {
  static const String url =
      '127.0.0.1:8000'; // Ganti dengan URL server API yang sesuai
  static const String endpoint =
      '/api/alat_gym'; // Endpoint API Laravel untuk mengambil alat gym

  // Fungsi untuk mengambil semua alat gym dari API
  static Future<List<AlatGym>> fetchAll() async {
    try {
      final response = await http.get(Uri.http(url, endpoint));

      if (response.statusCode == 200) {
        // Jika response berhasil, parsing JSON
        final data = json.decode(response.body)[
            'data']; // Ambil data dari key 'data' pada response JSON
        // Mengubah data JSON menjadi list of AlatGym
        return List<AlatGym>.from(data.map((item) => AlatGym.fromJson(item)));
      } else {
        throw Exception('Failed to load gym equipment');
      }
    } catch (e) {
      throw Exception('Error fetching data: $e');
    }
  }
}
