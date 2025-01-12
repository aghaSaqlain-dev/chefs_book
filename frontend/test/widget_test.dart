import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:chefs_book/widgets/category_grid_item.dart';
import 'package:chefs_book/models/category.dart';
import 'package:chefs_book/widgets/chef_profile.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  final testTheme = ThemeData(
    useMaterial3: true,
    colorScheme: ColorScheme.fromSeed(
      brightness: Brightness.dark,
      seedColor: const Color.fromARGB(255, 131, 57, 0),
    ),
    textTheme: GoogleFonts.latoTextTheme(),
  );
  // Sample data
  final availableCategoriesFuture = Future<List<Category>>.value([
    Category(id: 'c1', title: 'Italian', color: Colors.red),
    Category(id: 'c2', title: 'Quick and Easy', color: Colors.green),
    Category(id: 'c3', title: 'Elegant', color: Colors.blue),
  ]);

  testWidgets('Displays categories in a GridView', (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(
      theme: testTheme,
      home: FutureBuilder<List<Category>>(
        future: availableCategoriesFuture,
        builder: (context, snapshot) {
          if (snapshot.hasData && snapshot.data!.isNotEmpty) {
            return GridView.builder(
              padding: const EdgeInsets.all(16),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 3 / 2,
                crossAxisSpacing: 20,
                mainAxisSpacing: 20,
              ),
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                final category = snapshot.data![index];
                return CategoryGridItem(
                  category: category,
                  onSelectCategory: () {},
                );
              },
            );
          }
          return const SizedBox.shrink();
        },
      ),
    ));

    expect(find.byType(GridView), findsOneWidget);
    expect(find.byType(CategoryGridItem), findsNWidgets(2));
  });

  testWidgets('ChefProfile expands when tapped', (WidgetTester tester) async {
    final chefProfile = ChefProfile(
      imagePosition: 1,
      name: 'agha',
      email: 'agha@example.com',
      specialties: 'pakistani',
      experienceYears: '10',
      currentRole: 'Head Chef',
      location: 'New York',
      restaurantName: 'The quetta cafe',
      restaurantLocation: 'NYC',
      restaurantWebsite: 'https://italianbistro.com',
      cardColor: Colors.orange,
      profilePictureUrl: 'https://example.com/profile.jpg',
      worldRank: 5,
      phone: '0310-0000000',
    );

    await tester.pumpWidget(MaterialApp(
      home: Scaffold(body: chefProfile),
    ));

    expect(find.text('agha'), findsOneWidget);
    expect(find.text('5'), findsOneWidget);
    expect(find.text('agha@example.com'), findsNothing);

    await tester.tap(find.byType(ChefProfile));
    await tester.pumpAndSettle();

    expect(find.text('Specialty: pakistani'), findsOneWidget);
    expect(find.text('Experience: 10'), findsOneWidget);
    expect(find.text('Current Role: Head Chef'), findsOneWidget);
    expect(find.text('Restaurants: The quetta cafe'), findsOneWidget);
    expect(find.text('Location: NYC'), findsOneWidget);

    expect(find.text('recipes'), findsOneWidget);
  });
}
