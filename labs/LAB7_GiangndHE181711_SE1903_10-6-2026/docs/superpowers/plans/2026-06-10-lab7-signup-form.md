# Lab 7 Signup Form Implementation Plan

> **For agentic workers:** REQUIRED SUB-SKILL: Use superpowers:subagent-driven-development (recommended) or superpowers:executing-plans to implement this plan task-by-task. Steps use checkbox (`- [ ]`) syntax for tracking.

**Goal:** Replace the default Flutter counter template with a DartPad-friendly signup form that validates required fields, email format, password strength, confirm password, focus movement, keyboard dismissal, button state, and optional async email availability.

**Architecture:** Keep the demo in `lib/main.dart` so it can be pasted into DartPad. Organize responsibilities inside the file with focused classes and methods: `SignupScreen` owns UI state, `SignupFormValidators` owns validation logic, and small helper methods build fields/buttons. Tests verify validation and widget behavior without adding dependencies.

**Tech Stack:** Flutter, Dart, Material widgets, `Form`, `TextFormField`, `GlobalKey<FormState>`, `FocusNode`, `FocusScope`, `Future.delayed`.

---

### Task 1: Add widget tests for validation behavior

**Files:**
- Modify: `test/widget_test.dart`

- [ ] **Step 1: Write tests for required fields, email, password, confirm password, and async email**

```dart
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:lab7/main.dart';

void main() {
  testWidgets('shows required field errors', (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());

    await tester.tap(find.text('Sign Up'));
    await tester.pump();

    expect(find.text('Name is required'), findsOneWidget);
    expect(find.text('Enter a valid email'), findsOneWidget);
    expect(find.text('Password is required'), findsOneWidget);
    expect(find.text('Confirm password is required'), findsOneWidget);
  });

  testWidgets('shows password and confirm password errors', (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());

    await tester.enterText(find.byType(TextFormField).at(0), 'Nguyen Van A');
    await tester.enterText(find.byType(TextFormField).at(1), 'a@example.com');
    await tester.enterText(find.byType(TextFormField).at(2), 'abcdefgh');
    await tester.enterText(find.byType(TextFormField).at(3), 'abcdefghi');
    await tester.tap(find.text('Sign Up'));
    await tester.pump();

    expect(find.text('Password must contain at least one digit'), findsOneWidget);
    expect(find.text('Passwords do not match'), findsOneWidget);
  });

  testWidgets('checks email availability and shows taken email message', (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());

    await tester.enterText(find.byType(TextFormField).at(0), 'Nguyen Van A');
    await tester.enterText(find.byType(TextFormField).at(1), 'taken@example.com');
    await tester.enterText(find.byType(TextFormField).at(2), 'Password1');
    await tester.enterText(find.byType(TextFormField).at(3), 'Password1');
    await tester.tap(find.text('Sign Up'));
    await tester.pump();

    expect(find.text('Sign Up'), findsNothing);
    expect(find.text('Checking email...'), findsOneWidget);

    await tester.pump(const Duration(seconds: 2));

    expect(find.text('This email is already taken'), findsOneWidget);
  });
}
```

- [ ] **Step 2: Run tests to verify they fail**

Run: `flutter test test/widget_test.dart`

Expected: FAIL because `main.dart` still contains the default counter app and signup validation behavior is not implemented.

- [ ] **Step 3: Implement signup form in `lib/main.dart`**

Replace `lib/main.dart` with a single-file app containing:
- `MyApp` with `MaterialApp(home: SignupScreen())`
- `SignupScreen` with `GlobalKey<FormState>`
- `FocusNode` fields for name, email, password, confirm password
- `TextEditingController` fields for password and confirm password
- `bool isCheckingEmail`
- `autovalidateMode: AutovalidateMode.onUserInteraction`
- `Form`, `ListView`, `TextFormField`, `ElevatedButton`
- `SignupFormValidators.validateName`, `validateEmail`, `validatePassword`, `validateConfirmPassword`
- `_submit` that validates, checks email asynchronously, and shows success or taken-email `SnackBar`
- `GestureDetector(onTap: () => FocusScope.of(context).unfocus())`
- `FocusScope.of(context).requestFocus(...)` in `onFieldSubmitted`
- Button content that shows `CircularProgressIndicator` and disables submission while checking

- [ ] **Step 4: Run tests to verify they pass**

Run: `flutter test test/widget_test.dart`

Expected: PASS.

### Task 2: Verify Flutter analysis and formatting

**Files:**
- Modify: `lib/main.dart`
- Modify: `test/widget_test.dart`

- [ ] **Step 1: Format Dart files**

Run: `dart format lib/main.dart test/widget_test.dart`

Expected: Files are formatted without errors.

- [ ] **Step 2: Run analyzer**

Run: `flutter analyze`

Expected: No errors or warnings.

- [ ] **Step 3: Run widget tests**

Run: `flutter test`

Expected: PASS.

### Task 3: Final project structure review

**Files:**
- `lib/main.dart`
- `test/widget_test.dart`

- [ ] **Step 1: Confirm folder/file organization**

Expected structure:
- `lib/main.dart`: complete DartPad-friendly signup form
- `test/widget_test.dart`: focused widget tests for validation and async email
- `pubspec.yaml`: unchanged Flutter SDK dependencies, no third-party packages added
- `README.md`: unchanged unless user asks for documentation updates

- [ ] **Step 2: Confirm requirements coverage**

Expected:
- Required fields validate
- Email requires `@` and `.`
- Password requires 8+ characters and one digit
- Confirm password must match
- Inline errors appear under fields
- Submit is blocked while invalid or async check is running
- Focus moves Name -> Email -> Password -> Confirm
- Done action submits from confirm field
- Tapping outside dismisses keyboard
- Scrollable layout prevents keyboard overflow
- Async email check treats emails starting with `taken` as unavailable
