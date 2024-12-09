import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tubes_pbp_gym/entitiy/Pelanggan.dart';
import 'package:tubes_pbp_gym/client/PelangganClient.dart';
import 'package:shared_preferences/shared_preferences.dart';

final profileProvider = FutureProvider<Pelanggan>((ref) async {
  final prefs = await SharedPreferences.getInstance();
  int? userId = prefs.getInt('userId');

  if (userId == null) {
    throw Exception('User not logged in');
  }

  return await PelangganClient.find(userId);
});
