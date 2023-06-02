import 'package:test/test.dart';
import 'package:trad_doctors_new/domain/appointemt_dto.dart';

void main() {
  group('Appointment', () {
    test('should convert to map', () {
      final appointment = Appointment(
        appointment_id: 1,
        patient_id: 123,
        doctor_id: 456,
        status: 'confirmed',
        message: 'Appointment confirmed',
        description: 'Appointment description',
        rating: 4,
      );

      final map = appointment.toMap();

      expect(map['appointment_id'], equals(1));
      expect(map['patient_id'], equals(123));
      expect(map['doctor_id'], equals(456));
      expect(map['status'], equals('confirmed'));
      expect(map['message'], equals('Appointment confirmed'));
      expect(map['description'], equals('Appointment description'));
      expect(map['rating'], equals(4));
    });

    test('should create from map', () {
      final map = {
        'appointment_id': 1,
        'patient_id': 123,
        'doctor_id': 456,
        'status': 'confirmed',
        'message': 'Appointment confirmed',
        'description': 'Appointment description',
        'rating': 4,
      };

      final appointment = Appointment.fromMap(map);

      expect(appointment.appointment_id, equals(1));
      expect(appointment.patient_id, equals(123));
      expect(appointment.doctor_id, equals(456));
      expect(appointment.status, equals('confirmed'));
      expect(appointment.message, equals('Appointment confirmed'));
      expect(appointment.description, equals('Appointment description'));
      expect(appointment.rating, equals(4));
    });

    test('should create list of appointments from list of maps', () {
      final list = [
        {
          'appointment_id': 1,
          'patient_id': 123,
          'doctor_id': 456,
          'status': 'confirmed',
          'message': 'Appointment confirmed',
          'description': 'Appointment description',
          'rating': 4,
        },
        {
          'appointment_id': 2,
          'patient_id': 456,
          'doctor_id': 789,
          'status': 'pending',
          'message': 'Appointment pending',
          'description': 'Another appointment description',
          'rating': 3,
        },
      ];

      final appointments = Appointment.fromList(list);

      expect(appointments.length, equals(2));

      expect(appointments[0].appointment_id, equals(1));
      expect(appointments[0].patient_id, equals(123));
      expect(appointments[0].doctor_id, equals(456));
      expect(appointments[0].status, equals('confirmed'));
      expect(appointments[0].message, equals('Appointment confirmed'));
      expect(appointments[0].description, equals('Appointment description'));
      expect(appointments[0].rating, equals(4));

      expect(appointments[1].appointment_id, equals(2));
      expect(appointments[1].patient_id, equals(456));
      expect(appointments[1].doctor_id, equals(789));
      expect(appointments[1].status, equals('pending'));
      expect(appointments[1].message, equals('Appointment pending'));
      expect(appointments[1].description,
          equals('Another appointment description'));
      expect(appointments[1].rating, equals(3));
    });

    test('should convert to JSON', () {
      final appointment = Appointment(
        appointment_id: 1,
        patient_id: 123,
        doctor_id: 456,
        status: 'confirmed',
        message: 'Appointment confirmed',
        description: 'Appointment description',
        rating: 4,
      );

      final json = appointment.toJson();

      final expectedJson =
          '{"appointment_id":1,"patient_id":123,"doctor_id":456,"status":"confirmed","message":"Appointment confirmed","description":"Appointment description","rating":4}';

      expect(json, equals(expectedJson));
    });

    test('should create from JSON', () {
      final json =
          '{"appointment_id":1,"patient_id":123,"doctor_id":456,"status":"confirmed","message":"Appointment confirmed","description":"Appointment description","rating":4}';

      final appointment = Appointment.fromJson(json);

      expect(appointment.appointment_id, equals(1));
      expect(appointment.patient_id, equals(123));
      expect(appointment.doctor_id, equals(456));
      expect(appointment.status, equals('confirmed'));
      expect(appointment.message, equals('Appointment confirmed'));
      expect(appointment.description, equals('Appointment description'));
      expect(appointment.rating, equals(4));
    });
  });
}
