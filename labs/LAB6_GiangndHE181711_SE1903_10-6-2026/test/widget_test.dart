import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:lab6/data/movie_data.dart';
import 'package:lab6/main.dart';
import 'package:lab6/screens/genre_screen.dart';

void main() {
  test('sample movie data is available', () {
    expect(allMovies, hasLength(6));
    expect(allMovies.first.title, 'Inception');
    expect(allMovies.first.genres, contains('Action'));
  });

  testWidgets('search filters movies by title case-insensitively',
      (tester) async {
    await tester.pumpWidget(const ResponsiveMovieApp());

    await tester.enterText(find.byType(TextField), 'matrix');
    await tester.pump();

    expect(find.text('The Matrix'), findsOneWidget);
    expect(find.text('Inception'), findsNothing);
  });

  testWidgets('genre chips filter movies by selected genre', (tester) async {
    await tester.pumpWidget(const ResponsiveMovieApp());

    await tester.tap(find.descendant(
      of: find.byType(FilterChip),
      matching: find.text('Sci-Fi'),
    ));
    await tester.pump();

    expect(find.text('Inception'), findsOneWidget);
    expect(find.text('The Dark Knight'), findsNothing);
  });

  testWidgets('sort dropdown orders movies by rating', (tester) async {
    await tester.pumpWidget(const ResponsiveMovieApp());

    await tester.tap(find.byType(DropdownButton<String>));
    await tester.pump();
    await tester.tap(find.text('Rating').last);
    await tester.pump();

    expect(find.descendant(
      of: find.byType(ListView),
      matching: find.text('The Dark Knight'),
    ), findsOneWidget);
  });

  testWidgets('uses a list layout on narrow screens', (tester) async {
    await tester.pumpWidget(
      const MaterialApp(home: SizedBox(width: 600, height: 600, child: GenreScreen())),
    );

    expect(find.byType(ListView), findsOneWidget);
    expect(find.byType(GridView), findsNothing);
  });

  testWidgets('uses a grid layout on wide screens', (tester) async {
    tester.view.physicalSize = const Size(1000, 800);
    tester.view.devicePixelRatio = 1.0;
    addTearDown(() {
      tester.view.resetPhysicalSize();
      tester.view.resetDevicePixelRatio();
    });

    await tester.pumpWidget(
      const MaterialApp(home: SizedBox(width: 900, height: 700, child: GenreScreen())),
    );

    expect(find.byType(GridView), findsOneWidget);
    expect(find.byType(ListView), findsNothing);
  });
}
