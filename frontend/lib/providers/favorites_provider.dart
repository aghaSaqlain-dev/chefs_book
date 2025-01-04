import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:chefs_book/models/meal.dart';

//the stateNotifireProvider works with another class just like stateFul widgets class works with state object
class FavoriteMealsNotifier extends StateNotifier<List<Meal>> {
  FavoriteMealsNotifier() : super([]);

  /// initial data is passed in super, the data should be the same type as the type in angle brackets
  bool toggleMealFavStatus(Meal meal) {
    // we cannot add or rmeove values from the inital list, every time we need to pass the whole list
    //state.add(); the state has out data, but .add or .remove is not allowed
    final isMealInFav = state.contains(meal);

    if (isMealInFav) {
      // if meal in fav
      state = state.where((m) => m.id != meal.id).toList();
      return false;
    } else {
      // if meal not in fav
      state = [...state, meal];
      return true;
    }
  }
}

//optimized for the data that can change
final favoriteMealsprovider =
    StateNotifierProvider<FavoriteMealsNotifier, List<Meal>>((ref) {
  // <returning obj, the data type obj is yielding>
  return FavoriteMealsNotifier();
});
