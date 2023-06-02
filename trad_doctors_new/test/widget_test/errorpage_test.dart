import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:trad_doctors_new/presentation/common/errro_screen.dart';

void main() {
  testWidgets('ErrorScreen should display error message',
      (WidgetTester tester) async {
    final errorMessage = 'Page not found';
    Exception error = Exception('Error message');

    await tester.pumpWidget(
      MaterialApp(
        home: ErrorScreen(
          error: error,
        ),
      ),
    );

    // Verify that the ErrorScreen displays the provided error message
    expect(find.text(errorMessage), findsOneWidget);
  });
}
