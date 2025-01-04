import 'package:flutter/material.dart';
import 'package:chefs_book/models/category.dart';
import 'package:chefs_book/models/meal.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

const String baseUrl = 'http://172.20.47.106:3000'; //localhost also works

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

Future<List<Category>> get availableCategories async {
  return await _fetchCategories();
}

Future<List<Meal>> get dummyMeals async {
  return await _fetchMeals();
}
