import 'dart:convert';
import 'package:tubes_pbp_gym/entitiy/Membership.dart';
import 'package:http/http.dart' as http;

class MembershipClient {
  static const String url = 'http://10.0.2.2:8000'; // Base URL
  static const String endpoint = '/api/membership'; // Base endpoint

  // Fetch all memberships
  static Future<List<Membership>> fetchAll() async {
    try {
      var response = await http.get(
        Uri.http(url, endpoint),
      );

      if (response.statusCode != 200) throw Exception(response.reasonPhrase);

      Iterable list =
          json.decode(response.body); // Laravel returns plain JSON array
      return list.map((e) => Membership.fromJson(e)).toList();
    } catch (e) {
      return Future.error(e.toString());
    }
  }

  // Fetch a single membership by ID
  static Future<Membership> find(int id) async {
    try {
      var response = await http.get(
        Uri.http(url, '$endpoint/$id'),
      );

      if (response.statusCode == 404) throw Exception("Membership not found");
      if (response.statusCode != 200) throw Exception(response.reasonPhrase);

      return Membership.fromJson(json.decode(response.body));
    } catch (e) {
      return Future.error(e.toString());
    }
  }

  // Create a new membership
  static Future<http.Response> create(Membership membership) async {
    try {
      var response = await http.post(
        Uri.http(url, endpoint),
        headers: {"Content-Type": "application/json"},
        body: membership.toRawJson(),
      );

      if (response.statusCode != 201) throw Exception(response.reasonPhrase);

      return response;
    } catch (e) {
      return Future.error(e.toString());
    }
  }

  // Update an existing membership
  static Future<http.Response> update(Membership membership) async {
    try {
      var response = await http.put(
        Uri.http(url, '$endpoint/${membership.idMembership}'),
        headers: {"Content-Type": "application/json"},
        body: membership.toRawJson(),
      );

      if (response.statusCode == 404) throw Exception("Membership not found");
      if (response.statusCode != 200) throw Exception(response.reasonPhrase);

      return response;
    } catch (e) {
      return Future.error(e.toString());
    }
  }

  // Delete a membership by ID
  static Future<http.Response> destroy(int id) async {
    try {
      var response = await http.delete(
        Uri.http(url, '$endpoint/$id'),
      );

      if (response.statusCode == 404) throw Exception("Membership not found");
      if (response.statusCode != 200) throw Exception(response.reasonPhrase);

      return response;
    } catch (e) {
      return Future.error(e.toString());
    }
  }
}
