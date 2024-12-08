import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:tubes_pbp_gym/entitiy/HealthyClub.dart';

class KelasOlahragaClient {
  static const String url = '10.0.2.2:8000'; // Change to your backend URL
  static const String endpoint =
      '/api/kelas_olahragas'; // Update with your endpoint

  // Fetch all KelasOlahraga
  static Future<List<KelasOlahraga>> fetchAll() async {
    try {
      var response = await http.get(
        Uri.http(url, endpoint),
      );

      if (response.statusCode != 200) throw Exception(response.reasonPhrase);

      var decodedResponse = json.decode(response.body);
      if (!decodedResponse['status']) {
        throw Exception(decodedResponse['message']);
      }

      Iterable list = decodedResponse['data'];
      return list.map((e) => KelasOlahraga.fromJson(e)).toList();
    } catch (e) {
      return Future.error(e.toString());
    }
  }

  // Fetch a single KelasOlahraga by ID
  static Future<KelasOlahraga> find(int id) async {
    try {
      var response = await http.get(
        Uri.http(url, '$endpoint/$id'),
      );

      if (response.statusCode == 404)
        throw Exception("KelasOlahraga not found");
      if (response.statusCode != 200) throw Exception(response.reasonPhrase);

      var decodedResponse = json.decode(response.body);
      if (!decodedResponse['status']) {
        throw Exception(decodedResponse['message']);
      }

      return KelasOlahraga.fromJson(decodedResponse['data']);
    } catch (e) {
      return Future.error(e.toString());
    }
  }

  // Create a new KelasOlahraga
  static Future<http.Response> create(KelasOlahraga kelasOlahraga) async {
    try {
      var response = await http.post(
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

  // Update an existing KelasOlahraga
  static Future<http.Response> update(KelasOlahraga kelasOlahraga) async {
    try {
      var response = await http.put(
        Uri.http(url, '$endpoint/${kelasOlahraga.idKelas}'),
        headers: {"Content-Type": "application/json"},
        body: kelasOlahraga.toRawJson(),
      );

      if (response.statusCode == 404)
        throw Exception("KelasOlahraga not found");
      if (response.statusCode != 200) throw Exception(response.reasonPhrase);

      return response;
    } catch (e) {
      return Future.error(e.toString());
    }
  }

  // Delete a KelasOlahraga by ID
  static Future<http.Response> destroy(int id) async {
    try {
      var response = await http.delete(
        Uri.http(url, '$endpoint/$id'),
      );

      if (response.statusCode == 404)
        throw Exception("KelasOlahraga not found");
      if (response.statusCode != 200) throw Exception(response.reasonPhrase);

      return response;
    } catch (e) {
      return Future.error(e.toString());
    }
  }
}
