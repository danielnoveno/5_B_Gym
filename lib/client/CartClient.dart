import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:tubes_pbp_gym/entitiy/Cart.dart';

class CartItemClient {
  static const String url = 'gym5api-production.up.railway.app'; // Base URL
  static const String endpoint = '/api/cart'; // Base endpoint

  // Fetch all cart items
  static Future<List<CartItem>> fetchAll() async {
    try {
      var response = await http.get(
        Uri.http(url, endpoint),
      );

      if (response.statusCode != 200) throw Exception(response.reasonPhrase);

      Iterable list = json.decode(response.body); // Laravel returns JSON array
      return list.map((e) => CartItem.fromJson(e)).toList();
    } catch (e) {
      return Future.error(e.toString());
    }
  }

  // Fetch a single cart item by ID
  static Future<CartItem> find(int id) async {
    try {
      var response = await http.get(
        Uri.http(url, '$endpoint/$id'),
      );

      if (response.statusCode == 404) throw Exception("Cart item not found");
      if (response.statusCode != 200) throw Exception(response.reasonPhrase);

      return CartItem.fromJson(json.decode(response.body));
    } catch (e) {
      return Future.error(e.toString());
    }
  }

  // Create a new cart item
  static Future<http.Response> create(CartItem cartItem) async {
    try {
      var response = await http.post(
        Uri.http(url, endpoint),
        headers: {"Content-Type": "application/json"},
        body: cartItem.toRawJson(),
      );

      if (response.statusCode != 201) throw Exception(response.reasonPhrase);

      return response;
    } catch (e) {
      return Future.error(e.toString());
    }
  }

  // Update an existing cart item
  static Future<http.Response> update(CartItem cartItem) async {
    try {
      var response = await http.put(
        Uri.http(url, '$endpoint/${cartItem.id}'),
        headers: {"Content-Type": "application/json"},
        body: cartItem.toRawJson(),
      );

      if (response.statusCode == 404) throw Exception("Cart item not found");
      if (response.statusCode != 200) throw Exception(response.reasonPhrase);

      return response;
    } catch (e) {
      return Future.error(e.toString());
    }
  }

  // Delete a cart item by ID
  static Future<http.Response> destroy(int id) async {
    try {
      var response = await http.delete(
        Uri.http(url, '$endpoint/$id'),
      );

      if (response.statusCode == 404) throw Exception("Cart item not found");
      if (response.statusCode != 200) throw Exception(response.reasonPhrase);

      return response;
    } catch (e) {
      return Future.error(e.toString());
    }
  }
}
