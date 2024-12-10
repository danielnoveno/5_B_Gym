import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:tubes_pbp_gym/entitiy/AlatGym.dart'; // Sesuaikan dengan path yang benar

class GymEquipmentClient {
  static const String baseUrl =
      'http://10.0.2.2:8000'; // Pastikan menggunakan http:// atau https://
  static const String endpoint =
      '/api/alat_gym'; // Ganti dengan endpoint yang sesuai

  // Fetch semua alat gym
  static Future<List<GymEquipment>> fetchAll() async {
    try {
      var response = await http.get(Uri.parse('$baseUrl$endpoint'));

      if (response.statusCode == 200) {
        // Jika responsnya mengandung objek JSON dengan field "data"
        Map<String, dynamic> jsonData = json.decode(response.body);

        // Pastikan "data" berisi list
        if (jsonData.containsKey('data')) {
          List<dynamic> data = jsonData['data'];
          return data.map((item) => GymEquipment.fromJson(item)).toList();
        } else {
          throw Exception('Tidak ada data ditemukan');
        }
      } else {
        throw Exception('Gagal mengambil data alat gym');
      }
    } catch (e) {
      rethrow;
    }
  }
}
