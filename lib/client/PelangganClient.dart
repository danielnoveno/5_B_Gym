import 'dart:convert';
import 'package:tubes_pbp_gym/entitiy/Pelanggan.dart';
import 'package:http/http.dart' as http;

class PelangganClient {
  static const String url = '10.0.2.2:8000'; // Base URL
  static const String endpoint = '/api/pelanggan'; // Base endpoint
  static const String loginEndpoint = '/api/login'; // Endpoint Login

  // Fungsi Login
  static Future<Map<String, dynamic>> login(
      String email, String password) async {
    try {
      var response = await http.post(
        Uri.http(url, loginEndpoint),
        headers: {"Content-Type": "application/json"},
        body: json.encode({
          "email": email,
          "password": password,
        }),
      );

      if (response.statusCode == 200) {
        return json
            .decode(response.body); // Return response with token and user data
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
      var response = await http.get(
        Uri.http(url, endpoint),
      );

      if (response.statusCode != 200) throw Exception(response.reasonPhrase);

      Iterable list =
          json.decode(response.body); // Laravel returns plain JSON array
      return list.map((e) => Pelanggan.fromJson(e)).toList();
    } catch (e) {
      return Future.error(e.toString());
    }
  }

  // Fetch a single pelanggan by ID
  static Future<Pelanggan> find(int id) async {
    try {
      var response = await http.get(
        Uri.http(url, '$endpoint/$id'),
      );

      if (response.statusCode == 404) throw Exception("Pelanggan not found");
      if (response.statusCode != 200) throw Exception(response.reasonPhrase);

      return Pelanggan.fromJson(json.decode(response.body));
    } catch (e) {
      return Future.error(e.toString());
    }
  }

  // Create a new pelanggan
  static Future<http.Response> create(Pelanggan pelanggan) async {
    try {
      var response = await http.post(
        Uri.http(url, endpoint),
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
  static Future<http.Response> update(Pelanggan pelanggan) async {
    try {
      var response = await http.put(
        Uri.http(url, '$endpoint/${pelanggan.idPelanggan}'),
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
  static Future<http.Response> destroy(int id) async {
    try {
      var response = await http.delete(
        Uri.http(url, '$endpoint/$id'),
      );

      if (response.statusCode == 404) throw Exception("Pelanggan not found");
      if (response.statusCode != 200) throw Exception(response.reasonPhrase);

      return response;
    } catch (e) {
      return Future.error(e.toString());
    }
  }
}
