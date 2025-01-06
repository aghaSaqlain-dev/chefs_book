// filepath: /c:/Users/Lenovo/Desktop/chefs_book/frontend/lib/services/dish_service.dart
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

class DishService {
  String? uri = 'http://localhost:3000';

  Future<void> createDish({
    required BuildContext context,
    required String title,
    required String description,
    required List<String> ingredients,
    required List<String> steps,
  }) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final token = prefs.getString('token');

      final response = await http.post(
        Uri.parse('$uri/api/dishes'),
        body: jsonEncode({
          'title': title,
          'description': description,
          'ingredients': ingredients,
          'steps': steps,
        }),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'Authorization': 'Bearer $token',
        },
      );

      if (response.statusCode == 201) {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text('Dish created successfully')));
      } else {
        throw Exception('Failed to create dish');
      }
    } catch (e) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(e.toString())));
    }
  }
}
