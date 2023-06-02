import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:trad_doctors_new/presentation/common/custom_button.dart';
import 'package:trad_doctors_new/presentation/common/custom_textfield.dart';
import 'package:trad_doctors_new/presentation/pages/auth/screens/LandingSreen.dart';
import 'package:trad_doctors_new/presentation/pages/auth/widgets/custom_forms.dart';
import 'package:trad_doctors_new/presentation/pages/doctor_appointement/screen/doctor_appointment.dart';
import 'package:trad_doctors_new/presentation/pages/doctor_service/screen/add_service.dart';
import 'package:trad_doctors_new/presentation/pages/doctor_service/screen/doctor_screen.dart';
import 'package:trad_doctors_new/presentation/pages/home/doctor_home/screen/doctor_home.dart';

import '../lib/main.dart' as app;

void main() {
  //! test a login

  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  group('test the login', () {
    testWidgets('Verify the login and logout as doctor ', (tester) async {
      app.main();

      await tester.pumpAndSettle();
      await Future.delayed(Duration(seconds: 1));

      await tester.tap(find.byType(TextButton));

      await Future.delayed(Duration(seconds: 1));

      await tester.pumpAndSettle();

      await tester.enterText(find.byType(PhoneNumberInput), '949387908');
      await Future.delayed(Duration(seconds: 1));

      await tester.enterText(find.byType(PasswordInput), 'xxxxxx');
      await Future.delayed(Duration(seconds: 1));

      await tester.tap(find.byType(LoginButton));
      await Future.delayed(Duration(seconds: 1));

      await tester.pumpAndSettle();

      print('-------------------------|||||(((((((((1)))))))))');

      expect(find.byType(DoctorBottomBar), findsOneWidget);

      //!------------------- FIND SERVICE ---------

      await Future.delayed(Duration(seconds: 3));
      await tester.tap(find.byIcon(Icons.medical_services));
      await tester.pumpAndSettle();

      expect(find.byType(Services), findsOneWidget);

      //! ---------- add services
      // await tester.pumpAndSettle();

      await Future.delayed(Duration(seconds: 3));
      await tester.tap(find.byType(FloatingActionButton));
      await tester.pumpAndSettle();

      await tester.enterText(
          find.byType(CustomTextField).at(0), 'Integration Test Title 2');
      await Future.delayed(Duration(seconds: 1));

      await tester.enterText(find.byType(CustomTextField).at(1),
          ' this is a description added by the integration test 2');
      await Future.delayed(Duration(seconds: 1));

      await tester.enterText(find.byType(CustomTextField).at(2), '6667');
      await Future.delayed(Duration(seconds: 1));

      await tester.dragUntilVisible(
        find.byType(CustomButton), // what you want to find
        find.byType(AddServicepage), // widget you want to scroll
        const Offset(-250, 0), // delta to move
      );
      await Future.delayed(Duration(seconds: 3));

      await tester.tap(find.byType(CustomButton));
      await Future.delayed(Duration(seconds: 5));

      await tester.pumpAndSettle();

      expect(find.byType(Services), findsOneWidget);
      await Future.delayed(Duration(seconds: 4));
      await tester.tap(find.byIcon(Icons.delete).at(0));
      await tester.pumpAndSettle();

      //!------------------- FIND APPOINTMENT ---------

      await Future.delayed(Duration(seconds: 5));
      // tap the logout button
      await tester.tap(find.byIcon(Icons.lock_clock));
      await tester.pumpAndSettle();
      expect(find.byType(DoctorAppointment), findsOneWidget);

      // ! return to home
      await Future.delayed(Duration(seconds: 3));
      // tap the logout button
      await tester.tap(find.byIcon(Icons.home_outlined));
      await tester.pumpAndSettle();

      //!------------------ LOGOUT -----------------------------------------------
      await Future.delayed(Duration(seconds: 3));
      // tap the logout button
      await tester.tap(find.byType(ElevatedButton));
      await tester.pumpAndSettle();
      print('-------------------------|||||(((((((((&*********&)))))))))');
      expect(find.byType(LandingPage), findsOneWidget);
    });

    // testWidgets('logout', (tester) async {
    //   await app.main();

    // });

    // testWidgets('Verify the login with wrong password', (tester) async {
    //   await app.main();

    //   await tester.pumpAndSettle();
    //   await Future.delayed(Duration(seconds: 2));

    //   await tester.tap(find.byType(TextButton));

    //   await Future.delayed(Duration(seconds: 2));

    //   await tester.pumpAndSettle();

    //   await tester.enterText(find.byType(PhoneNumberInput), '949387908');
    //   await Future.delayed(Duration(seconds: 2));

    //   await tester.enterText(find.byType(PasswordInput), 'x');
    //   await Future.delayed(Duration(seconds: 2));

    //   await tester.tap(find.byType(LoginButton));
    //   await Future.delayed(Duration(seconds: 2));

    //   await tester.pumpAndSettle();

    //   print('-------------------------|||||(((((((((&*********&)))))))))');

    //   print('-------------------------|||||(((((((((&*********&)))))))))');

    //   expect(find.byType(DoctorBottomBar), findsOneWidget);
    // });
  });
}
