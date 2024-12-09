import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:tubes_pbp_gym/entitiy/JenisMembership.dart';

class JenisMembershipClient {
  static const String url = '10.0.2.2:8000';
  static const String endpoint = '/api/jenis_membership';

  // Fetch all JenisMemberships
  static Future<List<JenisMembership>> fetchAll() async {
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
      return list.map((e) => JenisMembership.fromJson(e)).toList();
    } catch (e) {
      return Future.error(e.toString());
    }
  }

  // Fetch a single JenisMembership by ID
  static Future<JenisMembership> find(int id) async {
    try {
      var response = await http.get(
        Uri.http(url, '$endpoint/$id'),
      );

      if (response.statusCode == 404)
        throw Exception("JenisMembership not found");
      if (response.statusCode != 200) throw Exception(response.reasonPhrase);

      var decodedResponse = json.decode(response.body);
      if (!decodedResponse['status']) {
        throw Exception(decodedResponse['message']);
      }

      return JenisMembership.fromJson(decodedResponse['data']);
    } catch (e) {
      return Future.error(e.toString());
    }
  }

  // Create a new JenisMembership
  static Future<http.Response> create(JenisMembership jenisMembership) async {
    try {
      var response = await http.post(
        Uri.http(url, endpoint),
        headers: {"Content-Type": "application/json"},
        body: jenisMembership.toRawJson(),
      );

      if (response.statusCode != 201) throw Exception(response.reasonPhrase);

      return response;
    } catch (e) {
      return Future.error(e.toString());
    }
  }

  // Update an existing JenisMembership
  static Future<http.Response> update(JenisMembership jenisMembership) async {
    try {
      var response = await http.put(
        Uri.http(url, '$endpoint/${jenisMembership.idJenisMembership}'),
        headers: {"Content-Type": "application/json"},
        body: jenisMembership.toRawJson(),
      );

      if (response.statusCode == 404)
        throw Exception("JenisMembership not found");
      if (response.statusCode != 200) throw Exception(response.reasonPhrase);

      return response;
    } catch (e) {
      return Future.error(e.toString());
    }
  }

  // Delete a JenisMembership by ID
  static Future<http.Response> destroy(int id) async {
    try {
      var response = await http.delete(
        Uri.http(url, '$endpoint/$id'),
      );

      if (response.statusCode == 404)
        throw Exception("JenisMembership not found");
      if (response.statusCode != 200) throw Exception(response.reasonPhrase);

      return response;
    } catch (e) {
      return Future.error(e.toString());
    }
  }
}
