import 'package:chefs_book/constants/global_variables.dart';
import 'package:chefs_book/data/data.dart';
import 'package:chefs_book/models/user.dart';
import 'package:chefs_book/widgets/chef_profile.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';

class ChefsScreen extends ConsumerWidget {
  int counter = 0;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: FutureBuilder<List<User>>(
        future: availableChefs,
        builder: (ctx, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(
                child: Text(
              'Error: ${snapshot.error}',
              style: TextStyle(color: Colors.red),
            ));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(
                child: Text('No chefs found',
                    style: TextStyle(color: Colors.red)));
          } else {
            final chefsList = snapshot.data!;
            return ListView.builder(
              itemCount: chefsList.length, // Number of chef profiles to display
              itemBuilder: (ctx, index) {
                final chef = chefsList[index];
                return ChefProfile(
                  imagePosition: index,
                  name: chef.name,
                  email: chef.email,
                  specialties: chef.specialties.join(', '),
                  experienceYears: '${chef.experienceYears} years',
                  currentRole: chef.currentRole,
                  location: chef.location,
                  restaurantName: chef.restaurantName,
                  restaurantLocation: chef.restaurantLocation,
                  restaurantWebsite: chef.restaurantWebsite,
                  cardColor: GlobalVariables.blackShade,
                  profilePictureUrl: chef.profilePictureUrl,
                  worldRank: chef.worldRank,
                  phone: chef.phone,
                );
              },
            );
          }
        },
      ),
    );
  }
}
