import 'package:flutter/material.dart';
import 'package:chefs_book/data/dummy_data.dart';
import 'package:chefs_book/models/meal.dart';
import 'package:chefs_book/screens/meals.dart';
import 'package:chefs_book/widgets/category_grid_item.dart';
import 'package:chefs_book/models/category.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key, required this.availableMeals});
  final List<Meal> availableMeals;

  void _selectedCategory(BuildContext context, Category category) {
    final filteredMeals = availableMeals
        .where((meal) => meal.categories.contains(category.id))
        .toList();
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => MealsScreen(
          title: category.title,
          meals: filteredMeals,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GridView(
      padding: const EdgeInsets.all(16),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 3 / 2,
        crossAxisSpacing: 20, // spacing b/w cols
        mainAxisSpacing: 20, // spcaing horizontally
      ), // simply number of columns
      children: [
        for (final category
            in availableCategories) //.map could also be used instead
          CategoryGridItem(
            category: category,
            onSelectCategory: () {
              _selectedCategory(context, category);
            },
          )
      ],
    );
  }
}
