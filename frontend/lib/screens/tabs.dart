import 'package:chefs_book/providers/meals_provider.dart';
import 'package:chefs_book/screens/chefs_screen.dart';
import 'package:flutter/material.dart';
import 'package:chefs_book/providers/favorites_provider.dart';
import 'package:chefs_book/screens/categories.dart';
import 'package:chefs_book/screens/filters.dart';
import 'package:chefs_book/screens/meals.dart';
import 'package:chefs_book/widgets/main_drawer.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:chefs_book/providers/filters_provider.dart';

class TabsScreen extends ConsumerStatefulWidget {
  const TabsScreen({super.key});

  @override
  ConsumerState<TabsScreen> createState() {
    return _TabsScreenState();
  }
}

class _TabsScreenState extends ConsumerState<TabsScreen> {
  void _selectedPage(int index) {
    ref.read(selectedPageIndexProvider.notifier).state = index;
  }

  void _setScreen(String identifier) async {
    Navigator.of(context).pop();
    if (identifier == 'filters') {
      await Navigator.of(context).push<Map<Filter, bool>>(
        MaterialPageRoute(
          builder: (context) => const FiltersScreen(),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    // watch :  To listen to changes in a provider's state and rebuild the widget whenever the provider's state updates. used When you want the UI to react to changes in the provider's state.

    //read : To access the current value of a provider without listening to its changes. When you only need to access the provider's value for a one-time operation, such as updating the state or performing an action.
    //       Does not cause the widget to rebuild if the provider's state changes

    // Watch the current page index from the provider
    final selectedPageIndex = ref.watch(selectedPageIndexProvider);
    //.when is a convenient method provided by riverpod package to handle 3 possible states of the provider
    Widget activePage = ref.watch(filteredMealsProvider).when(
          data: (meals) =>
              CategoriesScreen(availableMeals: meals), //(AsyncData)
          loading: () => const Center(
              child: CircularProgressIndicator()), //await state(AsyncLoading)
          error: (err, stack) => Center(
            //(AsyncError)
            child: Text(
              'Error: $err',
              style: const TextStyle(color: Colors.red),
            ),
          ),
        );

    var activePageTitle = 'Categories';

    if (selectedPageIndex == 2) {
      final favMeals = ref.watch(favoriteMealsprovider);
      activePage = MealsScreen(meals: favMeals);
      activePageTitle = 'Your Favorites';
    } else if (selectedPageIndex == 1) {
      activePage = ChefsScreen();
      activePageTitle = 'Master Chefs';
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(activePageTitle),
      ),
      drawer: MainDrawer(setScreen: _setScreen),
      body: activePage,
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectedPage,
        currentIndex: selectedPageIndex,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.set_meal),
            label: 'Categories',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.restaurant),
            label: 'Chefs',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.star),
            label: 'Favorites',
          ),
        ],
      ),
    );
  }
}
