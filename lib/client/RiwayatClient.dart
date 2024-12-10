import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:tubes_pbp_gym/entitiy/Riwayat.dart';

class RiwayatClient {
  static const String url = '10.0.2.2:8000'; // Base URL
  static const String endpoint = '/api/riwayat'; // Base endpoint

  // Fetch all riwayat
  static Future<List<Riwayat>> fetchAll() async {
    try {
      var response = await http.get(
        Uri.http(url, endpoint),
      );

      if (response.statusCode != 200) throw Exception(response.reasonPhrase);

      Iterable list =
          json.decode(response.body); // Laravel returns plain JSON array
      return list.map((e) => Riwayat.fromJson(e)).toList();
    } catch (e) {
      return Future.error(e.toString());
    }
  }

  // Fetch a single riwayat by ID
  static Future<Riwayat> find(int id) async {
    try {
      var response = await http.get(
        Uri.http(url, '$endpoint/$id'),
      );

      if (response.statusCode == 404) throw Exception("Riwayat not found");
      if (response.statusCode != 200) throw Exception(response.reasonPhrase);

      return Riwayat.fromJson(json.decode(response.body));
    } catch (e) {
      return Future.error(e.toString());
    }
  }

  // Create a new riwayat
  static Future<http.Response> create(Riwayat riwayat) async {
    try {
      var response = await http.post(
        Uri.http(url, endpoint),
        headers: {"Content-Type": "application/json"},
        body: riwayat.toRawJson(),
      );

      if (response.statusCode != 201) throw Exception(response.reasonPhrase);

      return response;
    } catch (e) {
      return Future.error(e.toString());
    }
  }

  // Update an existing riwayat
  static Future<http.Response> update(Riwayat riwayat) async {
    try {
      var response = await http.put(
        Uri.http(url, '$endpoint/${riwayat.idRiwayat}'),
        headers: {"Content-Type": "application/json"},
        body: riwayat.toRawJson(),
      );

      if (response.statusCode == 404) throw Exception("Riwayat not found");
      if (response.statusCode != 200) throw Exception(response.reasonPhrase);

      return response;
    } catch (e) {
      return Future.error(e.toString());
    }
  }

  // Delete a riwayat by ID
  static Future<http.Response> destroy(int id) async {
    try {
      var response = await http.delete(
        Uri.http(url, '$endpoint/$id'),
      );

      if (response.statusCode == 404) throw Exception("Riwayat not found");
      if (response.statusCode != 200) throw Exception(response.reasonPhrase);

      return response;
    } catch (e) {
      return Future.error(e.toString());
    }
  }

  // Fetch a single riwayat by ID (duplicate method for specific needs)
  static Future<Riwayat> fetchById(int id) async {
    try {
      var response = await http.get(
        Uri.http(url, '$endpoint/$id'),
      );

      if (response.statusCode == 404) throw Exception("Riwayat not found");
      if (response.statusCode != 200) throw Exception(response.reasonPhrase);

      return Riwayat.fromJson(json.decode(response.body));
    } catch (e) {
      return Future.error(e.toString());
    }
  }
}
