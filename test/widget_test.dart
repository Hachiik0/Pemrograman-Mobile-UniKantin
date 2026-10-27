import 'package:flutter_test/flutter_test.dart';

import 'package:unikantin/main.dart';

void main() {
  testWidgets('UniKantin app smoke test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const UniKantinApp());

    // Verify that our app shows UniKantin title.
    expect(find.text('UniKantin'), findsAtLeastNWidgets(1));
  });
}
