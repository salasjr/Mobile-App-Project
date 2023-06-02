import 'package:test/test.dart';
import 'package:trad_doctors_new/domain/patient_appoint_dto.dart';

void main() {
  group('PatientAppointment', () {
    test('should convert to map', () {
      final patientAppointment = PatientAppointment(
        appointment_id: 1,
        patient_id: 123,
        doctor_id: 456,
        status: 'confirmed',
        message: 'Appointment confirmed',
        case_description: 'Case description',
        rating: 4,
        fullname: 'John Doe',
        phoneNumber: '1234567890',
        address: '123 Main St',
        profilePicture: 'profile.jpg',
      );

      final map = patientAppointment.toMap();

      expect(map['appointment_id'], equals(1));
      expect(map['patient_id'], equals(123));
      expect(map['doctor_id'], equals(456));
      expect(map['status'], equals('confirmed'));
      expect(map['message'], equals('Appointment confirmed'));
      expect(map['case_description'], equals('Case description'));
      expect(map['rating'], equals(4));
      expect(map['fullname'], equals('John Doe'));
      expect(map['phoneNumber'], equals('1234567890'));
      expect(map['address'], equals('123 Main St'));
      expect(map['profilePicture'], equals('profile.jpg'));
    });

    test('should create from map', () {
      final map = {
        'appointment_id': 1,
        'patient_id': 123,
        'doctor_id': 456,
        'status': 'confirmed',
        'message': 'Appointment confirmed',
        'case_description': 'Case description',
        'rating': 4,
        'fullname': 'John Doe',
        'phoneNumber': '1234567890',
        'address': '123 Main St',
        'profilePicture': 'profile.jpg',
      };

      final patientAppointment = PatientAppointment.fromMap(map);

      expect(patientAppointment.appointment_id, equals(1));
      expect(patientAppointment.patient_id, equals(123));
      expect(patientAppointment.doctor_id, equals(456));
      expect(patientAppointment.status, equals('confirmed'));
      expect(patientAppointment.message, equals('Appointment confirmed'));
      expect(patientAppointment.case_description, equals('Case description'));
      expect(patientAppointment.rating, equals(4));
      expect(patientAppointment.fullname, equals('John Doe'));
      expect(patientAppointment.phoneNumber, equals('1234567890'));
      expect(patientAppointment.address, equals('123 Main St'));
      expect(patientAppointment.profilePicture, equals('profile.jpg'));
    });

    test('should create list of patient appointments from list of maps', () {
      final list = [
        {
          'appointment_id': 1,
          'patient_id': 123,
          'doctor_id': 456,
          'status': 'confirmed',
          'message': 'Appointment confirmed',
          'case_description': 'Case description',
          'rating': 4,
          'fullname': 'John Doe',
          'phoneNumber': '1234567890',
          'address': '123 Main St',
          'profilePicture': 'profile.jpg',
        },
        {
          'appointment_id': 2,
          'patient_id': 456,
          'doctor_id': 789,
          'status': 'pending',
          'message': 'Appointment pending',
          'case_description': 'Another case description',
          'rating': 3,
          'fullname': 'Jane Smith',
          'phoneNumber': '9876543210',
          'address': '456 Elm St',
          'profilePicture': 'profile2.jpg',
        },
      ];

      final patientAppointments = PatientAppointment.fromList(list);

      expect(patientAppointments.length, equals(2));

      expect(patientAppointments[0].appointment_id, equals(1));
      expect(patientAppointments[0].patient_id, equals(123));
      expect(patientAppointments[0].doctor_id, equals(456));
      expect(patientAppointments[0].status, equals('confirmed'));
      expect(patientAppointments[0].message, equals('Appointment confirmed'));
      expect(
          patientAppointments[0].case_description, equals('Case description'));
      expect(patientAppointments[0].rating, equals(4));
      expect(patientAppointments[0].fullname, equals('John Doe'));
      expect(patientAppointments[0].phoneNumber, equals('1234567890'));
      expect(patientAppointments[0].address, equals('123 Main St'));
      expect(patientAppointments[0].profilePicture, equals('profile.jpg'));

      expect(patientAppointments[1].appointment_id, equals(2));
      expect(patientAppointments[1].patient_id, equals(456));
      expect(patientAppointments[1].doctor_id, equals(789));
      expect(patientAppointments[1].status, equals('pending'));
      expect(patientAppointments[1].message, equals('Appointment pending'));
      expect(patientAppointments[1].case_description,
          equals('Another case description'));
      expect(patientAppointments[1].rating, equals(3));
      expect(patientAppointments[1].fullname, equals('Jane Smith'));
      expect(patientAppointments[1].phoneNumber, equals('9876543210'));
      expect(patientAppointments[1].address, equals('456 Elm St'));
      expect(patientAppointments[1].profilePicture, equals('profile2.jpg'));
    });

    test('should convert to JSON', () {
      final patientAppointment = PatientAppointment(
        appointment_id: 1,
        patient_id: 123,
        doctor_id: 456,
        status: 'confirmed',
        message: 'Appointment confirmed',
        case_description: 'Case description',
        rating: 4,
        fullname: 'John Doe',
        phoneNumber: '1234567890',
        address: '123 Main St',
        profilePicture: 'profile.jpg',
      );

      final json = patientAppointment.toJson();

      final expectedJson =
          '{"fullname":"John Doe","phoneNumber":"1234567890","address":"123 Main St","appointment_id":1,"patient_id":123,"doctor_id":456,"status":"confirmed","message":"Appointment confirmed","case_description":"Case description","rating":4,"profilePicture":"profile.jpg"}';

      expect(json, equals(expectedJson));
    });

    test('should create from JSON', () {
      final json =
          '{"appointment_id":1,"patient_id":123,"doctor_id":456,"status":"confirmed","message":"Appointment confirmed","case_description":"Case description","rating":4,"fullname":"John Doe","phoneNumber":"1234567890","address":"123 Main St","profilePicture":"profile.jpg"}';

      final patientAppointment = PatientAppointment.fromJson(json);

      expect(patientAppointment.appointment_id, equals(1));
      expect(patientAppointment.patient_id, equals(123));
      expect(patientAppointment.doctor_id, equals(456));
      expect(patientAppointment.status, equals('confirmed'));
      expect(patientAppointment.message, equals('Appointment confirmed'));
      expect(patientAppointment.case_description, equals('Case description'));
      expect(patientAppointment.rating, equals(4));
      expect(patientAppointment.fullname, equals('John Doe'));
      expect(patientAppointment.phoneNumber, equals('1234567890'));
      expect(patientAppointment.address, equals('123 Main St'));
      expect(patientAppointment.profilePicture, equals('profile.jpg'));
    });
  });
}
