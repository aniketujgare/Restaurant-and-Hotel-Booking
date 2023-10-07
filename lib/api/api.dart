import 'dart:convert';
import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:resto_hoel_book/models/restaurant_model.dart';

import '../models/menu_model.dart';

class ApiService {
  static String baseUrl = 'https://amused-pink-hose.cyclic.cloud/';
  // static String usersEndpoint = '/users';
  var client = http.Client();
  Future<RestaurnatModel?> getRestaurants() async {
    try {
      var url = Uri.parse(baseUrl);
      var response = await client.get(url);
      if (response.statusCode == 200) {
        var json = response.body;
        return restaurnatModelFromJson(json);
      }
    } catch (e) {
      log(e.toString());
    }
    return null;
  }

  Future<MenuModel?> getMenu({required String restaurantId}) async {
    try {
      var url = Uri.parse('$baseUrl/$restaurantId');
      var response = await client.get(url);
      if (response.statusCode == 200) {
        var json = response.body;
        return menuModelFromJson(json);
      }
    } catch (e) {
      log(e.toString());
    }
    return null;
  }

  Future<void> addMenu(
      {required String restaurantId,
      required Map<String, dynamic> newMenu}) async {
        
    var url = Uri.parse('$baseUrl/menu/add/$restaurantId');
    // Send a POST request to add the new food item
    final response = await http.post(
      url,
      headers: <String, String>{
        'Content-Type': 'application/json',
      },
      body: jsonEncode(newMenu), // Encode the JSON
    );

    if (response.statusCode == 200) {
      debugPrint(newMenu["dishName"] + 'is added in restaruant' + restaurantId);
    } else {
      // If the server did not return a 200 OK response, handle the error
      debugPrint(
          'Failed to add food item. Status code: ${response.statusCode}');
      debugPrint('Response body: ${response.body}');
    }
  }
}
