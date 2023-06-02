import 'package:test/test.dart';
import 'package:trad_doctors_new/domain/doctor_dto.dart';

void main() {
  group('Doctor', () {
    test('should convert to map', () {
      final doctor = Doctor(
        id: 1,
        fullname: 'John Doe',
        phoneNumber: '1234567890',
        profilePicture: 'profile.jpg',
        businessName: 'ABC Clinic',
        businessId: 'abc123',
        address: '123 Main St',
        verified: 1,
        rating: 4,
        ratingCount: 10,
      );

      final map = doctor.toMap();

      expect(map['id'], equals(1));
      expect(map['fullname'], equals('John Doe'));
      expect(map['phoneNumber'], equals('1234567890'));
      expect(map['profilePicture'], equals('profile.jpg'));
      expect(map['businessName'], equals('ABC Clinic'));
      expect(map['businessId'], equals('abc123'));
      expect(map['address'], equals('123 Main St'));
      expect(map['verified'], equals(1));
      expect(map['rating'], equals(4));
      expect(map['rating_count'], equals(10));
    });

    test('should create from map', () {
      final map = {
        'id': 1,
        'fullname': 'John Doe',
        'phoneNumber': '1234567890',
        'profilePicture': 'profile.jpg',
        'businessName': 'ABC Clinic',
        'businessId': 'abc123',
        'address': '123 Main St',
        'verified': 1,
        'rating': 4,
        'rating_count': 10,
      };

      final doctor = Doctor.fromMap(map);

      expect(doctor.id, equals(1));
      expect(doctor.fullname, equals('John Doe'));
      expect(doctor.phoneNumber, equals('1234567890'));
      expect(doctor.profilePicture, equals('profile.jpg'));
      expect(doctor.businessName, equals('ABC Clinic'));
      expect(doctor.businessId, equals('abc123'));
      expect(doctor.address, equals('123 Main St'));
      expect(doctor.verified, equals(1));
      expect(doctor.rating, equals(4));
      expect(doctor.ratingCount, equals(10));
    });

    test('should create list of doctors from list of maps', () {
      final list = [
        {
          'id': 1,
          'fullname': 'John Doe',
          'phoneNumber': '1234567890',
          'profilePicture': 'profile.jpg',
          'businessName': 'ABC Clinic',
          'businessId': 'abc123',
          'address': '123 Main St',
          'verified': 1,
          'rating': 4,
          'rating_count': 10,
        },
        {
          'id': 2,
          'fullname': 'Jane Smith',
          'phoneNumber': '9876543210',
          'profilePicture': 'profile2.jpg',
          'businessName': 'XYZ Hospital',
          'businessId': 'xyz456',
          'address': '456 Elm St',
          'verified': 0,
          'rating': 3,
          'rating_count': 5,
        },
      ];

      final doctors = Doctor.fromList(list);

      expect(doctors.length, equals(2));

      expect(doctors[0].id, equals(1));
      expect(doctors[0].fullname, equals('John Doe'));
      expect(doctors[0].phoneNumber, equals('1234567890'));
      expect(doctors[0].profilePicture, equals('profile.jpg'));
      expect(doctors[0].businessName, equals('ABC Clinic'));
      expect(doctors[0].businessId, equals('abc123'));
      expect(doctors[0].address, equals('123 Main St'));
      expect(doctors[0].verified, equals(1));
      expect(doctors[0].rating, equals(4));
      expect(doctors[0].ratingCount, equals(10));

      expect(doctors[1].id, equals(2));
      expect(doctors[1].fullname, equals('Jane Smith'));
      expect(doctors[1].phoneNumber, equals('9876543210'));
      expect(doctors[1].profilePicture, equals('profile2.jpg'));
      expect(doctors[1].businessName, equals('XYZ Hospital'));
      expect(doctors[1].businessId, equals('xyz456'));
      expect(doctors[1].address, equals('456 Elm St'));
      expect(doctors[1].verified, equals(0));
      expect(doctors[1].rating, equals(3));
      expect(doctors[1].ratingCount, equals(5));
    });

    test('should convert to JSON', () {
      final doctor = Doctor(
        id: 1,
        fullname: 'John Doe',
        phoneNumber: '1234567890',
        profilePicture: 'profile.jpg',
        businessName: 'ABC Clinic',
        businessId: 'abc123',
        address: '123 Main St',
        verified: 1,
        rating: 4,
        ratingCount: 10,
      );

      final json = doctor.toJson();

      final expectedJson =
          '{"id":1,"fullname":"John Doe","phoneNumber":"1234567890","profilePicture":"profile.jpg","businessName":"ABC Clinic","businessId":"abc123","address":"123 Main St","verified":1,"rating":4,"rating_count":10}';

      expect(json, equals(expectedJson));
    });

    test('should create from JSON', () {
      final json =
          '{"id":1,"fullname":"John Doe","phoneNumber":"1234567890","profilePicture":"profile.jpg","businessName":"ABC Clinic","businessId":"abc123","address":"123 Main St","verified":1,"rating":4,"rating_count":10}';

      final doctor = Doctor.fromJson(json);

      expect(doctor.id, equals(1));
      expect(doctor.fullname, equals('John Doe'));
      expect(doctor.phoneNumber, equals('1234567890'));
      expect(doctor.profilePicture, equals('profile.jpg'));
      expect(doctor.businessName, equals('ABC Clinic'));
      expect(doctor.businessId, equals('abc123'));
      expect(doctor.address, equals('123 Main St'));
      expect(doctor.verified, equals(1));
      expect(doctor.rating, equals(4));
      expect(doctor.ratingCount, equals(10));
    });
  });
}
