import 'package:chefs_book/providers/meals_provider.dart';
import 'package:chefs_book/screens/meals_details.dart';
import 'package:chefs_book/widgets/meal_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../models/meal.dart';

class ChefRecipeScreen extends ConsumerWidget {
  final String chefId; // Assuming this is the email
  final String chefName;

  const ChefRecipeScreen(
      {super.key, required this.chefId, required this.chefName});

  void selectedMeal(BuildContext context, Meal meal) {
    Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => MealsDetailsScreen(
              meal: meal,
            )));
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Watch the FutureProvider.family with the chefId
    final mealsAsyncValue = ref.watch(dishesProvider(chefId));

    return Scaffold(
      appBar: AppBar(
        title: Text('$chefName\'s Recipes'),
      ),
      body: mealsAsyncValue.when(
        data: (meals) {
          if (meals.isEmpty) {
            return Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'No recipes found...',
                    style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                          color: Theme.of(context).colorScheme.onSurface,
                        ),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    'Try selecting something else.',
                    style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                          color: Theme.of(context).colorScheme.onSurface,
                        ),
                  ),
                ],
              ),
            );
          }

          // Display the list of meals
          return ListView.builder(
            itemCount: meals.length,
            itemBuilder: (context, index) => MealItem(
              meal: meals[index],
              onSelectMeal: (meal) => selectedMeal(context, meal),
            ),
          );
        },
        loading: () => const Center(
          child: CircularProgressIndicator(),
        ),
        error: (error, stack) {
          return Center(
            child: Text(
              'Failed to fetch recipes: $error',
              style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                    color: Theme.of(context).colorScheme.error,
                  ),
              textAlign: TextAlign.center,
            ),
          );
        },
      ),
    );
  }
}
