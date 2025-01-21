import 'package:chefs_book/screens/auth_Screen.dart';
import "package:flutter_test/flutter_test.dart";
import 'package:flutter/material.dart';

enum fakeAuth { signup, signin }

void main() {
  testWidgets("AuthScreen widget test", (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(
      home: AuthScreen(),
    ));

    expect(find.text("Welcome"), findsOneWidget);
    expect(find.text("sign in, chef!"), findsOneWidget);

    expect(find.byType(TextFormField), findsNWidgets(2));
    expect(find.widgetWithText(TextFormField, "Email"), findsOneWidget);
    expect(find.widgetWithText(TextFormField, "Password"), findsOneWidget);

    // await tester.tap(find.widgetWithText(Radio<fakeAuth>, "Create Account"));
    // await tester.pump();

    // expect(find.text("register account as a chef"), findsOneWidget);
    // expect(
    //     find.byType(TextFormField), findsNWidgets(14)); // Sign-up form fields
    // expect(find.widgetWithText(TextFormField, "Name"), findsOneWidget);
    // expect(find.widgetWithText(TextFormField, "Profile Picture URL"),
    //     findsOneWidget);
    // expect(find.widgetWithText(TextFormField, "Phone"), findsOneWidget);
    // expect(find.widgetWithText(TextFormField, "Specialties (comma separated)"),
    //     findsOneWidget);
    // expect(
    //     find.widgetWithText(TextFormField, "Experience Years"), findsOneWidget);
    // expect(find.widgetWithText(TextFormField, "Restaurant Website"),
    //     findsOneWidget);

    // // Fill out the sign-up form
    // await tester.enterText(
    //     find.widgetWithText(TextFormField, "Name"), "Gordon Ramsay");
    // await tester.enterText(find.widgetWithText(TextFormField, "Email"),
    //     "gordonramsay@example.com");
    // await tester.enterText(
    //     find.widgetWithText(TextFormField, "Password"), "gordonramsey123");
    // await tester.enterText(
    //     find.widgetWithText(TextFormField, "Phone"), "1234567890");
    // await tester.pump();

    // await tester.tap(find.widgetWithText(ElevatedButton, "Sign Up"));
    // await tester.pump();

    // await tester.tap(find.widgetWithText(Radio<Auth>, "Sign In"));
    // await tester.pump();

    expect(find.text("sign in, chef!"), findsOneWidget);
    expect(find.byType(TextFormField), findsNWidgets(2));
    expect(find.widgetWithText(TextFormField, "Email"), findsOneWidget);
    expect(find.widgetWithText(TextFormField, "Password"), findsOneWidget);

    // Fill sign-in form
    await tester.enterText(find.widgetWithText(TextFormField, "Email"),
        "gordonramsay@example.com");
    await tester.enterText(
        find.widgetWithText(TextFormField, "Password"), "gordonramsey123");
    await tester.pump();

    // Tap signin
    await tester.tap(find.widgetWithText(ElevatedButton, "Sign In"));
    await tester.pump();

    // // Verify navigation button works
    // expect(find.widgetWithText(ElevatedButton, "continue as user"),
    //     findsOneWidget);
    // await tester.tap(find.widgetWithText(ElevatedButton, "continue as user"));
    // await tester.pump();
  });
}
