import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:tubes_pbp_gym/entitiy/AlatGym.dart'; // Sesuaikan path sesuai struktur project kamu

class AlatGymClient {
  static const String url = '127.0.0.1:8000'; 
  static const String endpoint =
      '/api/alat-gym'; 

  // Mengambil semua alat gym
  static Future<List<AlatGym>> fetchAll() async {
    try {
      var response = await http.get(
        Uri.http(url, endpoint),
      );

      if (response.statusCode != 200) throw Exception(response.reasonPhrase);

      Iterable list =
          json.decode(response.body); // Menyaring data JSON dari response
      return list.map((e) => AlatGym.fromJson(e)).toList();
    } catch (e) {
      return Future.error(e.toString());
    }
  }

  // Mengambil satu alat gym berdasarkan ID
  static Future<AlatGym> find(int id) async {
    try {
      var response = await http.get(
        Uri.http(url, '$endpoint/$id'),
      );

      if (response.statusCode == 404) throw Exception("Alat Gym not found");
      if (response.statusCode != 200) throw Exception(response.reasonPhrase);

      return AlatGym.fromJson(json.decode(response.body));
    } catch (e) {
      return Future.error(e.toString());
    }
  }

  // Mengirim data alat gym baru ke server
  static Future<http.Response> create(AlatGym alatGym) async {
    try {
      var response = await http.post(
        Uri.http(url, endpoint),
        headers: {"Content-Type": "application/json"},
        body: alatGym.toRawJson(),
      );

      if (response.statusCode != 201) throw Exception(response.reasonPhrase);

      return response;
    } catch (e) {
      return Future.error(e.toString());
    }
  }
}
