import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:trad_doctors_new/presentation/common/custom_button.dart';

void main() {
  testWidgets('CustomButton Test', (WidgetTester tester) async {
    // Build the CustomButton widget
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: CustomButton(
            text: 'Button',
            onTap: () {},
            color: Colors.blue,
          ),
        ),
      ),
    );

    // Verify that the CustomButton is rendered
    expect(find.byType(CustomButton), findsOneWidget);

    // Verify that the ElevatedButton is rendered
    expect(find.byType(ElevatedButton), findsOneWidget);

    // Verify that the Text widget with the given text is rendered
    expect(find.text('Button'), findsOneWidget);
  });
}
