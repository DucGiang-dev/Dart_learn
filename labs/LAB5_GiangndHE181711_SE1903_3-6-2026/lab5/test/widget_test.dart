import 'package:flutter_test/flutter_test.dart';
import 'package:lab5/main.dart';

void main() {
  testWidgets('Movie app smoke test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const MovieDetailApp());

    // Verify that the title "Movies" is displayed.
    expect(find.text('Movies'), findsOneWidget);

    // Verify that some sample movies are rendered on screen.
    expect(find.text('Dune: Part Two'), findsOneWidget);
    expect(find.text('Deadpool & Wolverine'), findsOneWidget);
  });
}
