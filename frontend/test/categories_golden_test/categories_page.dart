import "package:flutter_test/flutter_test.dart";
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:chefs_book/screens/categories.dart';

void main() {
  testWidgets("categories screen golden test", (WidgetTester tester) async {
    TestWidgetsFlutterBinding.ensureInitialized();
    GoogleFonts.config.allowRuntimeFetching = false;

    await tester.pumpWidget(MaterialApp(
      home: CategoriesScreen(availableMeals: []),
    ));

    await expectLater(
      find.byType(CategoriesScreen),
      matchesGoldenFile("categories_golden_test/categories.jpg"),
    );
  });
}
