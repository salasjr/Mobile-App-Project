import 'package:test/test.dart';
import 'package:trad_doctors_new/domain/service_dto.dart';


void main() {
  group('Service', () {
    test('should convert to map', () {
      final service = Service(
        id: 1,
        title: 'Medical Checkup',
        description: 'Routine medical examination',
        price: 100.0,
        doctor_id: 123,
      );

      final map = service.toMap();

      expect(map['id'], equals(1));
      expect(map['title'], equals('Medical Checkup'));
      expect(map['description'], equals('Routine medical examination'));
      expect(map['price'], equals(100.0));
      expect(map['doctor_id'], equals(123));
    });

    test('should create from map', () {
      final map = {
        'id': 1,
        'title': 'Medical Checkup',
        'description': 'Routine medical examination',
        'price': 100.0,
        'doctor_id': 123,
      };

      final service = Service.fromMap(map);

      expect(service.id, equals(1));
      expect(service.title, equals('Medical Checkup'));
      expect(service.description, equals('Routine medical examination'));
      expect(service.price, equals(100.0));
      expect(service.doctor_id, equals(123));
    });

    test('should create list of services from list of maps', () {
      final list = [
        {
          'id': 1,
          'title': 'Medical Checkup',
          'description': 'Routine medical examination',
          'price': 100.0,
          'doctor_id': 123,
        },
        {
          'id': 2,
          'title': 'Dental Cleaning',
          'description': 'Professional teeth cleaning',
          'price': 75.0,
          'doctor_id': 456,
        },
      ];

      final services = Service.fromList(list);

      expect(services.length, equals(2));

      expect(services[0].id, equals(1));
      expect(services[0].title, equals('Medical Checkup'));
      expect(services[0].description, equals('Routine medical examination'));
      expect(services[0].price, equals(100.0));
      expect(services[0].doctor_id, equals(123));

      expect(services[1].id, equals(2));
      expect(services[1].title, equals('Dental Cleaning'));
      expect(services[1].description, equals('Professional teeth cleaning'));
      expect(services[1].price, equals(75.0));
      expect(services[1].doctor_id, equals(456));
    });

    test('should convert to JSON', () {
      final service = Service(
        id: 1,
        title: 'Medical Checkup',
        description: 'Routine medical examination',
        price: 100.0,
        doctor_id: 123,
      );

      final json = service.toJson();

      final expectedJson =
          '{"id":1,"title":"Medical Checkup","description":"Routine medical examination","price":100.0,"doctor_id":123}';

      expect(json, equals(expectedJson));
    });

    test('should create from JSON', () {
      final json =
          '{"id":1,"title":"Medical Checkup","description":"Routine medical examination","price":100.0,"doctor_id":123}';

      final service = Service.fromJson(json);

      expect(service.id, equals(1));
      expect(service.title, equals('Medical Checkup'));
      expect(service.description, equals('Routine medical examination'));
      expect(service.price, equals(100.0));
      expect(service.doctor_id, equals(123));
    });
  });
}
