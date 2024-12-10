import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:tubes_pbp_gym/entitiy/HealthyClub.dart';

class KelasOlahragaClient {
  static const String url =
      'http://10.0.2.2:8000'; // Ganti dengan URL backend
  static const String endpoint = '/api/kelas_olahraga'; // Endpoint API

  // Fetch semua KelasOlahragas
  static Future<List<KelasOlahragas>> fetchAll() async {
    try {
      final response = await http.get(Uri.http(url, endpoint));
      print('Response status: ${response.statusCode}');
      print('Response body: ${response.body}');

      if (response.statusCode != 200) throw Exception('Failed to load data');

      final decodedResponse = json.decode(response.body);
      if (!decodedResponse['status']) {
        throw Exception(decodedResponse['message']);
      }

      Iterable list = decodedResponse['data'];
      return list.map((e) => KelasOlahragas.fromJson(e)).toList();
    } catch (e) {
      print('Error: $e');
      return Future.error(e.toString());
    }
  }

  // Fetch satu KelasOlahragas berdasarkan ID
  static Future<KelasOlahragas> find(int id) async {
    try {
      final response = await http.get(Uri.http(url, '$endpoint/$id'));

      if (response.statusCode == 404)
        throw Exception("KelasOlahragas not found");
      if (response.statusCode != 200) throw Exception(response.reasonPhrase);

      final decodedResponse = json.decode(response.body);
      if (!decodedResponse['status']) {
        throw Exception(decodedResponse['message']);
      }

      return KelasOlahragas.fromJson(decodedResponse['data']);
    } catch (e) {
      return Future.error(e.toString());
    }
  }

  // Create KelasOlahragas baru
  static Future<http.Response> create(KelasOlahragas kelasOlahraga) async {
    try {
      final response = await http.post(
        Uri.http(url, endpoint),
        headers: {"Content-Type": "application/json"},
        body: kelasOlahraga.toRawJson(),
      );

      if (response.statusCode != 201) throw Exception(response.reasonPhrase);

      return response;
    } catch (e) {
      return Future.error(e.toString());
    }
  }

  // Update KelasOlahragas yang ada
  static Future<http.Response> update(KelasOlahragas kelasOlahraga) async {
    try {
      final response = await http.put(
        Uri.http(url, '$endpoint/${kelasOlahraga.idKelas}'),
        headers: {"Content-Type": "application/json"},
        body: kelasOlahraga.toRawJson(),
      );

      if (response.statusCode == 404)
        throw Exception("KelasOlahragas not found");
      if (response.statusCode != 200) throw Exception(response.reasonPhrase);

      return response;
    } catch (e) {
      return Future.error(e.toString());
    }
  }

  // Hapus KelasOlahragas berdasarkan ID
  static Future<http.Response> destroy(int id) async {
    try {
      final response = await http.delete(Uri.http(url, '$endpoint/$id'));

      if (response.statusCode == 404)
        throw Exception("KelasOlahragas not found");
      if (response.statusCode != 200) throw Exception(response.reasonPhrase);

      return response;
    } catch (e) {
      return Future.error(e.toString());
    }
  }
}
