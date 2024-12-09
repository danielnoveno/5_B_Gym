import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:tubes_pbp_gym/entitiy/Jadwal.dart';

class ActivityClient {
  static const String url = '10.0.2.2:8000'; // Base URL untuk Android Emulator
  static const String endpoint = '/api/activity'; // Endpoint Laravel

  // Fetch all activities
  static Future<List<Activity>> fetchAll({String? date}) async {
    try {
      final uri = date != null
          ? Uri.http(url, endpoint, {"date": date})
          : Uri.http(url, endpoint);

      var response = await http.get(uri);

      if (response.statusCode != 200) throw Exception(response.reasonPhrase);

      Iterable list = json.decode(response.body)['data'];
      return list.map((e) => Activity.fromJson(e)).toList();
    } catch (e) {
      return Future.error(e.toString());
    }
  }

  // Fetch a single activity by ID
  static Future<Activity> find(int id) async {
    try {
      var response = await http.get(
        Uri.http(url, '$endpoint/$id'),
      );

      if (response.statusCode == 404) throw Exception("Activity not found");
      if (response.statusCode != 200) throw Exception(response.reasonPhrase);

      return Activity.fromJson(json.decode(response.body)['data']);
    } catch (e) {
      return Future.error(e.toString());
    }
  }

  // Create a new activity
  static Future<http.Response> create(Activity activity) async {
    try {
      var response = await http.post(
        Uri.http(url, endpoint),
        headers: {"Content-Type": "application/json"},
        body: activity.toRawJson(),
      );

      if (response.statusCode != 201) throw Exception(response.reasonPhrase);

      return response;
    } catch (e) {
      return Future.error(e.toString());
    }
  }

  // Update an existing activity
  static Future<http.Response> update(Activity activity) async {
    try {
      var response = await http.put(
        Uri.http(url, '$endpoint/${activity.id}'),
        headers: {"Content-Type": "application/json"},
        body: activity.toRawJson(),
      );

      if (response.statusCode == 404) throw Exception("Activity not found");
      if (response.statusCode != 200) throw Exception(response.reasonPhrase);

      return response;
    } catch (e) {
      return Future.error(e.toString());
    }
  }

  // Delete an activity by ID
  static Future<http.Response> destroy(int id) async {
    try {
      var response = await http.delete(
        Uri.http(url, '$endpoint/$id'),
      );

      if (response.statusCode == 404) throw Exception("Activity not found");
      if (response.statusCode != 200) throw Exception(response.reasonPhrase);

      return response;
    } catch (e) {
      return Future.error(e.toString());
    }
  }
}
