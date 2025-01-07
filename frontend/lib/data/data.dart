import 'package:chefs_book/models/user.dart';
import 'package:flutter/material.dart';
import 'package:chefs_book/models/category.dart';
import 'package:chefs_book/models/meal.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

const String baseUrl = 'http://localhost:3000/api'; //ip address also works

Future<List<Category>> _fetchCategories() async {
  final response = await http.get(Uri.parse('$baseUrl/categories'));
  debugPrint("Response status: ${response.statusCode}");
  debugPrint("Response body: ${response.body}");
  if (response.statusCode == 200) {
    List<dynamic> data = jsonDecode(response.body);
    return data.map((category) => Category.fromJson(category)).toList();
  } else {
    throw Exception('Failed to load categories');
  }
}

Future<List<Meal>> _fetchMeals() async {
  final response = await http.get(Uri.parse('$baseUrl/meals'));
  debugPrint("Response status: ${response.statusCode}");
  debugPrint("Response body: ${response.body}");
  if (response.statusCode == 200) {
    List<dynamic> data = jsonDecode(response.body);
    return data.map((meal) => Meal.fromJson(meal)).toList();
  } else {
    throw Exception('Failed to load meals');
  }
}

Future<List<User>> _fetchChefs() async {
  final response = await http.get(Uri.parse('$baseUrl/chefs'));
  debugPrint("Response status: ${response.statusCode}");
  // debugPrint("Response body: ${response.body}");
  if (response.statusCode == 200) {
    List<dynamic> data = jsonDecode(response.body);
    debugPrint("Response body: ${data}");
    final List<User> chefs = data.map((chef) => User.fromMap(chef)).toList();

    return chefs;
  } else {
    throw Exception('Failed to load chefs');
  }
}

Future<List<Meal>> _fetchDishes(String email) async {
  final response = await http.get(Uri.parse('$baseUrl/dishes?email=$email'));
  debugPrint("Response status: ${response.statusCode}");
  debugPrint("Response body: ${response.body}");
  if (response.statusCode == 200) {
    List<dynamic> data = jsonDecode(response.body);
    debugPrint("Response body: ${data}");
    return data.map((meal) => Meal.fromJson(meal)).toList();
  } else {
    throw Exception('Failed to load dishes');
  }
}

Future<List<Meal>> availableDishes(String email) async {
  return await _fetchDishes(email);
}

Future<List<User>> get availableChefs async {
  return await _fetchChefs();
}

Future<List<Category>> get availableCategories async {
  return await _fetchCategories();
}

Future<List<Meal>> get dummyMeals async {
  return await _fetchMeals();
}
