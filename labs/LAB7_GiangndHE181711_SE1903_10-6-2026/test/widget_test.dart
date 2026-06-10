import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:lab7/main.dart';

Future<void> tapSignUp(WidgetTester tester) async {
  await tester.tap(find.text('Sign Up'));
  await tester.pump();
}

void main() {
  testWidgets('shows required field errors', (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());

    await tapSignUp(tester);

    expect(find.text('Name is required'), findsOneWidget);
    expect(find.text('Email is required'), findsOneWidget);
    expect(find.text('Password is required'), findsOneWidget);
    expect(find.text('Confirm password is required'), findsOneWidget);
  });

  testWidgets('shows password and confirm password errors', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(const MyApp());

    await tester.enterText(find.byType(TextFormField).at(0), 'Nguyen Van A');
    await tester.enterText(
      find.byType(TextFormField).at(1),
      'taken@example.com',
    );
    await tester.enterText(find.byType(TextFormField).at(2), 'abcdefgh');
    await tester.enterText(find.byType(TextFormField).at(3), 'abcdefghi');
    await tapSignUp(tester);

    expect(
      find.text('Password must contain at least one digit'),
      findsOneWidget,
    );
    expect(find.text('Passwords do not match'), findsOneWidget);
  });

  testWidgets('checks email availability and shows taken email message', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(const MyApp());

    const takenEmail = 'taken@example.com';

    await tester.enterText(find.byType(TextFormField).at(0), 'Nguyen Van A');
    await tester.enterText(find.byType(TextFormField).at(1), takenEmail);
    await tester.enterText(find.byType(TextFormField).at(2), 'Password1');
    await tester.enterText(find.byType(TextFormField).at(3), 'Password1');
    await tapSignUp(tester);

    expect(find.text('Sign Up'), findsNothing);
    expect(find.text('Checking email...'), findsOneWidget);

    await tester.pump(const Duration(seconds: 2));

    expect(find.text('This email is already taken'), findsOneWidget);
  });
}
