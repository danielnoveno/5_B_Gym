import 'dart:convert';
import 'package:tubes_pbp_gym/entitiy/Pelanggan.dart';
import 'package:http/http.dart' as https;

class PelangganClient {
  static const String url = 'gym5api-production.up.railway.app'; // Base URL
  static const String endpoint = '/api/register'; // Base endpoint

  // Fetch all pelanggans
  static Future<List<Pelanggan>> fetchAll(String token) async {
    try {
      var response = await https.get(
        Uri.https(url, endpoint),
        headers: {"Authorization": "Bearer $token"},
      );

      if (response.statusCode != 200) throw Exception(response.reasonPhrase);

      Iterable list = json.decode(response.body);
      return list.map((e) => Pelanggan.fromJson(e)).toList();
    } catch (e) {
      return Future.error(e.toString());
    }
  }

  // Fetch a single pelanggan by ID
  static Future<Pelanggan> find(int id) async {
    try {
      var response = await https.get(
        Uri.https(url, '$endpoint/$id'),
      );

      if (response.statusCode == 404) throw Exception("Pelanggan not found");
      if (response.statusCode != 200) throw Exception(response.reasonPhrase);

      return Pelanggan.fromJson(json.decode(response.body));
    } catch (e) {
      return Future.error(e.toString());
    }
  }

  // Create a new pelanggan
  static Future<https.Response> create(Pelanggan pelanggan) async {
    try {
      var response = await https.post(
        Uri.https(url, endpoint),
        headers: {"Content-Type": "application/json"},
        body: pelanggan.toRawJson(),
      );

      print("Response status: ${response.statusCode}");
      print("Response body: ${response.body}");

      if (response.statusCode != 201) {
        throw Exception('Failed to create: ${response.body}');
      }

      return response;
    } catch (e) {
      return Future.error(e.toString());
    }
  }

  // Update an existing pelanggan
  static Future<https.Response> update(Pelanggan pelanggan) async {
    try {
      var response = await https.put(
        Uri.https(url, '$endpoint/${pelanggan.idPelanggan}'),
        headers: {"Content-Type": "application/json"},
        body: pelanggan.toRawJson(),
      );

      if (response.statusCode == 404) throw Exception("Pelanggan not found");
      if (response.statusCode != 200) throw Exception(response.reasonPhrase);

      return response;
    } catch (e) {
      return Future.error(e.toString());
    }
  }

  // Delete a pelanggan by ID
  static Future<https.Response> destroy(int id) async {
    try {
      var response = await https.delete(
        Uri.https(url, '$endpoint/$id'),
      );

      if (response.statusCode == 404) throw Exception("Pelanggan not found");
      if (response.statusCode != 200) throw Exception(response.reasonPhrase);

      return response;
    } catch (e) {
      return Future.error(e.toString());
    }
  }
}
