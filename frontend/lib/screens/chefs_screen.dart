import 'package:chefs_book/constants/global_variables.dart';
import 'package:chefs_book/widgets/chef_profile.dart';
import 'package:flutter/material.dart';
import 'dart:math' as math;

class ChefsScreen extends StatelessWidget {
  int counter = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: 3, // Number of chef profiles to display
        itemBuilder: (ctx, index) {
          return ChefProfile(
              imagePosition: index,
              name: 'Chef ${index + 1}',
              email: 'chef${index + 1}@example.com',
              specialties: 'Specialty ${index + 1}, Specialty ${index + 2}',
              experienceYears: '${index + 5} years',
              currentRole: 'Role ${index + 1}',
              location: 'Location ${index + 1}',
              restaurantName: 'Restaurant ${index + 1}',
              restaurantLocation: 'City ${index + 1}',
              restaurantWebsite: 'www.restaurant${index + 1}.com',
              cardColor: GlobalVariables.blackShade);
        },
      ),
    );
  }
}
