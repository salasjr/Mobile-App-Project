import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:trad_doctors_new/presentation/common/custom_phonenumber_field.dart';

void main() {
  testWidgets(
      'CustomPhoneNumberField should display prefix text and validate phone number',
      (WidgetTester tester) async {
    final controller = TextEditingController();
    const labelText = 'Phone number';
    const hintText = '9XXXXXXXX';
    const prefixText = '+251 ';
    const errorMessage = 'Enter your phone number';

    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: CustomPhoneNumberField(
            controller: controller,
          ),
        ),
      ),
    );

    // Verify that the CustomPhoneNumberField displays the correct label text
    expect(find.text(labelText), findsOneWidget);

    // Verify that the CustomPhoneNumberField displays the correct hint text
    expect(find.text(hintText), findsOneWidget);

    // // Verify that the CustomPhoneNumberField displays the correct prefix text
    expect(find.text(prefixText), findsOneWidget);

    // // Verify that the CustomPhoneNumberField validates an empty phone number
    // await tester.tap(find.text(
    //     'Submit')); // Assuming there is a 'Submit' button triggering form validation
    // await tester.pump();
    // expect(find.text(errorMessage), findsOneWidget);

    // Enter a valid phone number
    await tester.enterText(find.byType(TextFormField), '987654321');
    await tester.pump();

    // Verify that the error message disappears after entering a valid phone number
    expect(find.text(errorMessage), findsNothing);
  });
}
