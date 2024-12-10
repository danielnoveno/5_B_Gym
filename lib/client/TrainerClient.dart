import 'dart:convert';
import 'package:tubes_pbp_gym/entitiy/Trainers.dart';
import 'package:http/http.dart' as http;

class TrainerClient {
  static const String url = '10.0.2.2:8000'; // Base URL
  static const String endpoint = '/api/trainer'; // Base endpoint

    // Fetch all trainers
  static Future<List<Trainers>> fetchAll() async {
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
      return list.map((e) => Trainers.fromJson(e)).toList();
    } catch (e) {
      return Future.error(e.toString());
    }
  }

  // Fetch satu Trainers berdasarkan ID
  static Future<Trainers> find(int id) async {
    try {
      final response = await http.get(Uri.http(url, '$endpoint/$id'));

      if (response.statusCode == 404)
        throw Exception("Trainer not found");
      if (response.statusCode != 200) throw Exception(response.reasonPhrase);

      final decodedResponse = json.decode(response.body);
      if (!decodedResponse['status']) {
        throw Exception(decodedResponse['message']);
      }

      return Trainers.fromJson(decodedResponse['data']);
    } catch (e) {
      return Future.error(e.toString());
    }
  }

    // Create Trainers baru
  static Future<http.Response> create(Trainers trainers) async {
    try {
      final response = await http.post(
        Uri.http(url, endpoint),
        headers: {"Content-Type": "application/json"},
        body: trainers.toRawJson(),
      );

      if (response.statusCode != 201) throw Exception(response.reasonPhrase);

      return response;
    } catch (e) {
      return Future.error(e.toString());
    }
  }

  // Update Trainers yang ada
  static Future<http.Response> update(Trainers trainers) async {
    try {
      final response = await http.put(
        Uri.http(url, '$endpoint/${trainers.idTrainer}'),
        headers: {"Content-Type": "application/json"},
        body: trainers.toRawJson(),
      );

      if (response.statusCode == 404)
        throw Exception("Trainer not found");
      if (response.statusCode != 200) throw Exception(response.reasonPhrase);

      return response;
    } catch (e) {
      return Future.error(e.toString());
    }
  }

  // Hapus Trainers berdasarkan ID
  static Future<http.Response> destroy(int id) async {
    try {
      final response = await http.delete(Uri.http(url, '$endpoint/$id'));

      if (response.statusCode == 404)
        throw Exception("Trainer not found");
      if (response.statusCode != 200) throw Exception(response.reasonPhrase);

      return response;
    } catch (e) {
      return Future.error(e.toString());
    }
  }
}