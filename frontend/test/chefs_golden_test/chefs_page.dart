import "package:flutter_test/flutter_test.dart";
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:chefs_book/screens/chefs_screen.dart';

void main() {
  testWidgets("chefs screen golden test", (WidgetTester tester) async {
    TestWidgetsFlutterBinding.ensureInitialized();
    GoogleFonts.config.allowRuntimeFetching = false;

    await tester.pumpWidget(MaterialApp(
      home: ChefsScreen(),
    ));

    await expectLater(
      find.byType(ChefsScreen),
      matchesGoldenFile("chefs_golden_test/chefs.jpg"),
    );
  });
}
