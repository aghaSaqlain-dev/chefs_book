import 'dart:convert';
import 'package:chefs_book/constants/handle_error.dart';
import 'package:chefs_book/constants/global_variables.dart';
import 'package:chefs_book/screens/add_dish_screen.dart';
import 'package:chefs_book/screens/tabs.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:chefs_book/constants/handle_error.dart';
import 'package:chefs_book/constants/utils.dart';
import 'package:chefs_book/models/user.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthService {
  String? uri = 'http://localhost:3000';
  // sign up user
  void signUpUser({
    required BuildContext context,
    required String email,
    required String password,
    required String name,
    required String profilePictureUrl,
    required String phone,
    required List<String> specialties,
    required int experienceYears,
    required String currentRole,
    required String location,
    required String restaurantName,
    required String restaurantLocation,
    required String restaurantWebsite,
  }) async {
    try {
      User user = User(
        id: '',
        name: name,
        password: password,
        email: email,
        profilePictureUrl: profilePictureUrl,
        phone: phone,
        specialties: specialties,
        experienceYears: experienceYears,
        currentRole: currentRole,
        location: location,
        restaurantName: restaurantName,
        restaurantLocation: restaurantLocation,
        restaurantWebsite: restaurantWebsite,
      );
      // json post to backend
      http.Response res = await http.post(
        //uri from global variable
        Uri.parse('$uri/api/signup'),
        body: jsonEncode(user.toJson()),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
      );

      httpErrorHandle(
        response: res,
        context: context,
        onSuccess: () {
          showSnackBar(
            context,
            'Account created! Login with the same credentials!',
          );
        },
      );
    } catch (e) {
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
        Uri.parse('$uri/api/auth/signin'),
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
        // final token = responseData['token'];

        // final prefs = await SharedPreferences.getInstance();
        // await prefs.setString('token', token);

        Navigator.push(
            context, MaterialPageRoute(builder: (context) => AddDishScreen()));
      } else {
        throw Exception('Failed to sign in');
      }
    } catch (e) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(e.toString())));
    }
  }

//   // get user data
//   void getUserData(
//     BuildContext context,
//   ) async {
//     try {
//       SharedPreferences prefs = await SharedPreferences.getInstance();
//       String? token = prefs.getString('x-auth-token');

//       if (token == null) {
//         prefs.setString('x-auth-token', '');
//       }

//       var tokenRes = await http.post(
//         Uri.parse('$uri/tokenIsValid'),
//         headers: <String, String>{
//           'Content-Type': 'application/json; charset=UTF-8',
//           'x-auth-token': token!
//         },
//       );

//       var response = jsonDecode(tokenRes.body);

//       if (response == true) {
//         http.Response userRes = await http.get(
//           Uri.parse('$uri/'),
//           headers: <String, String>{
//             'Content-Type': 'application/json; charset=UTF-8',
//             'x-auth-token': token
//           },
//         );

//         var userProvider = Provider.of<UserProvider>(context, listen: false);
//         userProvider.setUser(userRes.body);
//       }
//     } catch (e) {
//       showSnackBar(context, e.toString());
//     }
//   }
}
