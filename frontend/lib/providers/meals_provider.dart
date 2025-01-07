import 'package:chefs_book/models/meal.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:chefs_book/data/data.dart';

final mealsProvider = Provider((ref) {
  // this type of implementation it greate when a static data is provided
  return dummyMeals;
});

final dishesProvider =
    FutureProvider.family<List<Meal>, String>((ref, email) async {
  return await availableDishes(email);
});

final selectedPageIndexProvider = StateProvider<int>((ref) => 0);
