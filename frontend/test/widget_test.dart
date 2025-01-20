import 'package:chefs_book/screens/chefs_screen.dart';
import "package:flutter_test/flutter_test.dart";
import 'package:flutter/material.dart';

void main() {
  testWidgets("home screen widget test", (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(
      home: ChefsScreen(),
    ));

    expect(find.text("Welcome to Chef's Book"), findsOneWidget);
  });
}
