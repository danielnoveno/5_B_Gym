import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:tubes_pbp_gym/entitiy/Jadwal.dart';

class ActivityClient {
  static const String url = '10.0.2.2:8000'; // Base URL
  static const String endpoint = '/api/activity'; // Base endpoint

  // Fetch all activities
  static Future<List<Activity>> fetchAll() async {
    try {
      var response = await http.get(
        Uri.http(url, endpoint),
      );

      if (response.statusCode != 200) throw Exception(response.reasonPhrase);

      var decodedResponse = json.decode(response.body);

      // Check if the decoded response is a map
      if (decodedResponse is Map<String, dynamic>) {
        if (decodedResponse.containsKey('data')) {
          Iterable list = decodedResponse['data'];
          var activities = list.map((e) => Activity.fromJson(e)).toList();

          // Print ID of each activity
          for (var activity in activities) {
            print('Activity ID: ${activity.id}');
          }

          return activities;
        } else {
          throw Exception('Response does not contain "data" key');
        }
      } else if (decodedResponse is List) {
        var activities =
            decodedResponse.map((e) => Activity.fromJson(e)).toList();

        // Print ID of each activity
        for (var activity in activities) {
          print('Activity ID: ${activity.id}');
        }

        return activities;
      } else {
        throw Exception('Unexpected response format');
      }
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

      return Activity.fromJson(json.decode(response.body));
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

      print('Response status: ${response.statusCode}');
      print('Response body: ${response.body}');

      if (response.statusCode != 201) throw Exception(response.reasonPhrase);

      // Assuming the response contains the created activity with the ID in the body
      var decodedResponse = json.decode(response.body);

      // Access the 'data' field to get the 'id'
      if (decodedResponse.containsKey('data') &&
          decodedResponse['data'].containsKey('id')) {
        int activityId = decodedResponse['data']['id'];
        print('Activity created successfully with ID: $activityId');
      } else {
        throw Exception('ID not found in the response');
      }

      return response;
    } catch (e) {
      print('Error creating activity: $e');
      return Future.error(e.toString());
    }
  }

  // Update an existing activity
  static Future<http.Response> update(Activity activity) async {
    try {
      print('Updating activity with ID: ${activity.id}');
      if (activity.id == 0) {
        print('Error: Invalid activity ID (0)');
        return Future.error('Invalid activity ID');
      }

      var response = await http.put(
        Uri.http(url, '$endpoint/${activity.id}'),
        headers: {"Content-Type": "application/json"},
        body: activity.toRawJson(),
      );

      print('Response status: ${response.statusCode}');
      print('Response body: ${response.body}');

      if (response.statusCode == 404) throw Exception("Activity not found");
      if (response.statusCode != 200) throw Exception(response.reasonPhrase);

      return response;
    } catch (e) {
      print('Error: $e');
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
