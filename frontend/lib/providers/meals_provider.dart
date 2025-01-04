import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:chefs_book/data/dummy_data.dart';

final mealsProvider = Provider((ref) {
  // this type of implementation it greate when a static data is provided
  return dummyMeals;
});
