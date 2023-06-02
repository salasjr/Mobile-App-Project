import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:trad_doctors_new/presentation/common/custom_textfield.dart';


void main() {
  late TextEditingController controller;

  setUp(() {
    controller = TextEditingController();
  });

  tearDown(() {
    controller.dispose();
  });

  testWidgets('CustomTextField should validate input correctly',
      (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(
      home: Scaffold(
        body: Form(
          child: CustomTextField(
            controller: controller,
            hintText: 'Name',
          ),
        ),
      ),
    ));

    // Empty input should show validation error
    await tester.tap(find.byType(TextFormField));
    await tester.pump();
    await tester.enterText(find.byType(TextFormField), 'Jhon');
    await tester.pump();
    expect(find.text('Jhon'), findsOneWidget);

    // Non-empty input should not show validation error
    await tester.enterText(find.byType(TextFormField), '');
    await tester.pump();
    expect(find.text('Enter your Name'), findsNothing);
  });
}
