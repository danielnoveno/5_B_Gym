import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:tubes_pbp_gym/entitiy/Pelanggan.dart';

class PelangganClient {
  static const String baseUrl = '10.0.2.2:8000'; // Base URL
  static const String endpoint = '/api/register'; // Base endpoint
  static const String loginEndpoint = '/api/login'; // Endpoint login

  // Fungsi Login
  static Future<Map<String, dynamic>> login(
      String email, String password) async {
    try {
      final response = await http.post(
        Uri.http(baseUrl, loginEndpoint),
        headers: {"Content-Type": "application/json"},
        body: json.encode({
          "email": email,
          "password": password,
        }),
      );

      if (response.statusCode == 200) {
        return json.decode(response.body); // Return token and user data
      } else {
        throw Exception("Login failed: ${response.reasonPhrase}");
      }
    } catch (e) {
      return Future.error(e.toString());
    }
  }

  // Fetch all pelanggans
  static Future<List<Pelanggan>> fetchAll() async {
    try {
      final response = await http.get(
        Uri.http(baseUrl, endpoint),
      );

      if (response.statusCode != 200) throw Exception(response.reasonPhrase);

      Iterable list = json.decode(response.body); // Expecting JSON array
      return list.map((json) => Pelanggan.fromJson(json)).toList();
    } catch (e) {
      return Future.error(e.toString());
    }
  }

  // Fetch a single pelanggan by ID
  static Future<Pelanggan> find(int id) async {
    try {
      final response = await http.get(
        Uri.http(baseUrl, '$endpoint/$id'),
      );

      if (response.statusCode == 404) throw Exception("Pelanggan not found");
      if (response.statusCode != 200) throw Exception(response.reasonPhrase);

      return Pelanggan.fromJson(json.decode(response.body));
    } catch (e) {
      return Future.error(e.toString());
    }
  }

  static Future<http.Response> create(Pelanggan pelanggan) async {
    try {
      final response = await http.post(
        Uri.http(baseUrl, endpoint),
        headers: {"Content-Type": "application/json"},
        body: pelanggan.toRawJson(),
      );

      if (response.statusCode != 201) throw Exception(response.reasonPhrase);
      return response;
    } catch (e) {
      return Future.error(e.toString());
    }
  }

  // Update an existing pelanggan
  static Future<Pelanggan> update(Pelanggan pelanggan) async {
    try {
      final response = await http.put(
        Uri.http(baseUrl, '$endpoint/${pelanggan.idPelanggan}'),
        headers: {"Content-Type": "application/json"},
        body: pelanggan.toRawJson(),
      );

      if (response.statusCode == 404) throw Exception("Pelanggan not found");
      if (response.statusCode != 200) throw Exception(response.reasonPhrase);

      return Pelanggan.fromJson(json.decode(response.body));
    } catch (e) {
      return Future.error(e.toString());
    }
  }

  // Delete a pelanggan by ID
  static Future<bool> destroy(int id) async {
    try {
      final response = await http.delete(
        Uri.http(baseUrl, '$endpoint/$id'),
      );

      if (response.statusCode == 404) throw Exception("Pelanggan not found");
      if (response.statusCode != 200) throw Exception(response.reasonPhrase);

      return true;
    } catch (e) {
      return Future.error(e.toString());
    }
  }
}
