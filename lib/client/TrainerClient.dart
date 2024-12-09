import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:tubes_pbp_gym/entity/Trainer.dart'; // Pastikan path ini sesuai dengan struktur project Anda

class TrainerClient {
  static const String url = '10.0.2.2:8000'; // Base URL
  static const String endpoint = '/api/trainers'; // Base endpoint

  // Fetch all trainers
  static Future<List<Trainer>> fetchAll() async {
    try {
      var response = await http.get(
        Uri.http(url, endpoint),
      );

      if (response.statusCode != 200) throw Exception(response.reasonPhrase);

      Iterable list = json.decode(response.body); // Laravel returns plain JSON array
      return list.map((e) => Trainer.fromJson(e)).toList();
    } catch (e) {
      return Future.error(e.toString());
    }
  }

  // Fetch a single trainer by ID
  static Future<Trainer> find(int id) async {
    try {
      var response = await http.get(
        Uri.http(url, '$endpoint/$id'),
      );

      if (response.statusCode == 404) throw Exception("Trainer not found");
      if (response.statusCode != 200) throw Exception(response.reasonPhrase);

      return Trainer.fromJson(json.decode(response.body));
    } catch (e) {
      return Future.error(e.toString());
    }
  }

  // Create a new trainer
  static Future<http.Response> create(Trainer trainer) async {
    try {
      var response = await http.post(
        Uri.http(url, endpoint),
        headers: {"Content-Type": "application/json"},
        body: trainer.toRawJson(),
      );

      if (response.statusCode != 201) throw Exception(response.reasonPhrase);

      return response;
    } catch (e) {
      return Future.error(e.toString());
    }
  }

  // Update an existing trainer
  static Future<http.Response> update(int id, Trainer trainer) async {
    try {
      var response = await http.put(
        Uri.http(url, '$endpoint/$id'),
        headers: {"Content-Type": "application/json"},
        body: trainer.toRawJson(),
      );

      if (response.statusCode != 200) throw Exception(response.reasonPhrase);

      return response;
    } catch (e) {
      return Future.error(e.toString());
    }
  }

  // Delete a trainer by ID
  static Future<http.Response> delete(int id) async {
    try {
      var response = await http.delete(
        Uri.http(url, '$endpoint/$id'),
      );

      if (response.statusCode != 200) throw Exception(response.reasonPhrase);

      return response;
    } catch (e) {
      return Future.error(e.toString());
    }
  }
}
