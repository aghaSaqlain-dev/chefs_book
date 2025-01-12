import 'dart:convert';
import 'package:chefs_book/screens/add_dish_screen.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:chefs_book/models/chef.dart';
import 'package:shared_preferences/shared_preferences.dart';

void showSnackBar(BuildContext context, String message) {
  final snackBar = SnackBar(content: Text(message));
  ScaffoldMessenger.of(context).showSnackBar(snackBar);
}

class AuthService {
  String? uri = 'http://localhost:3000/api/auth';
  // sign up user
  void signUpUser({
    required BuildContext context,
    required String name,
    required String email,
    required String phone,
    required String profilePictureUrl,
    required List<String> specialties,
    required int experienceYears,
    required String currentRole,
    required String location,
    required double rating,
    required int worldRank,
    required String restaurantName,
    required String restaurantLocation,
    required String restaurantWebsite,
    required String password,
  }) async {
    try {
      User user = User(
        name: name,
        email: email,
        phone: phone,
        profilePictureUrl: profilePictureUrl,
        specialties: specialties,
        experienceYears: experienceYears,
        currentRole: currentRole,
        location: location,
        rating: rating,
        worldRank: worldRank,
        restaurantName: restaurantName,
        restaurantLocation: restaurantLocation,
        restaurantWebsite: restaurantWebsite,
        password: password,
      );

      // JSON post to backend
      http.Response res = await http.post(
        Uri.parse('$uri/signup'),
        body: user.toJson(), // Ensure this is correctly formatted
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
      );

      // Check if the HTTP response was successful (status code 200)
      if (res.statusCode == 200) {
        showSnackBar(
          context,
          'Account created! Login with the same credentials!',
        );
      } else {
        // If the status code is not 200, show an error with the response message
        showSnackBar(context, 'Error: ${res.body}');
      }
    } catch (e) {
      // Handle any other exceptions by showing the error message
      showSnackBar(context, e.toString());
    }
  }

  // sign in user
  void signInUser({
    required BuildContext context,
    required String email,
    required String password,
  }) async {
    try {
      final response = await http.post(
        Uri.parse('$uri/signin'),
        body: jsonEncode({
          'email': email,
          'password': password,
        }),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
      );

      if (response.statusCode == 200) {
        final responseData = jsonDecode(response.body);
        final token = responseData['token'];

        final prefs = await SharedPreferences.getInstance();
        await prefs.setString('token', token);
        debugPrint('Token: $token');
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => AddDishScreen()));
      } else {
        throw Exception(response.body);
      }
    } catch (e) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(e.toString())));
    }
  }
}
