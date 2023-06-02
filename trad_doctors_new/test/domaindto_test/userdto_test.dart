import 'package:test/test.dart';
import 'package:trad_doctors_new/domain/user_dto.dart';

void main() {
  group('User', () {
    const userMap = {
      'id': 1,
      'fullname': 'John Doe',
      'phoneNumber': '1234567890',
      'profilePicture': 'profile.jpg',
      'businessName': 'My Business',
      'businessId': '123',
      'address': '123 Main St',
      'verified': 1,
      'role': 'admin',
      'token': 'token123',
      'rating': 4,
      'ratingCount': 10,
    };

    test('should create User instance from map', () {
      final user = User.fromMap(userMap);

      expect(user.id, equals(1));
      expect(user.fullname, equals('John Doe'));
      expect(user.phoneNumber, equals('1234567890'));
      expect(user.profilePicture, equals('profile.jpg'));
      expect(user.businessName, equals('My Business'));
      expect(user.businessId, equals('123'));
      expect(user.address, equals('123 Main St'));
      expect(user.verified, equals(1));
      expect(user.role, equals('admin'));
      expect(user.token, equals('token123'));
      expect(user.rating, equals(4));
      expect(user.ratingCount, equals(10));
    });

    test('should convert User instance to map', () {
      final user = User.fromMap(userMap);
      final userMapResult = user.toMap();

      expect(userMapResult, equals(userMap));
    });

    test('should create User instance from JSON', () {
      final userJson =
          '{"id": 1, "fullname": "John Doe", "phoneNumber": "1234567890", "profilePicture": "profile.jpg", "businessName": "My Business", "businessId": "123", "address": "123 Main St", "verified": 1, "role": "admin", "token": "token123", "rating": 4, "ratingCount": 10}';
      final user = User.fromJson(userJson);

      expect(user.id, equals(1));
      expect(user.fullname, equals('John Doe'));
      expect(user.phoneNumber, equals('1234567890'));
      expect(user.profilePicture, equals('profile.jpg'));
      expect(user.businessName, equals('My Business'));
      expect(user.businessId, equals('123'));
      expect(user.address, equals('123 Main St'));
      expect(user.verified, equals(1));
      expect(user.role, equals('admin'));
      expect(user.token, equals('token123'));
      expect(user.rating, equals(4));
      expect(user.ratingCount, equals(10));
    });

    test('should convert User instance to JSON', () {
      final user = User.fromMap(userMap);
      final userJsonResult = user.toJson();

      expect(
          userJsonResult,
          equals(
              '{"id":1,"fullname":"John Doe","phoneNumber":"1234567890","profilePicture":"profile.jpg","businessName":"My Business","businessId":"123","address":"123 Main St","verified":1,"role":"admin","token":"token123","rating":4,"ratingCount":10}'));
    });

    test('should return true for isEmpty when User is empty', () {
      final emptyUser = User.empty;

      expect(emptyUser.isEmpty, isTrue);
      expect(emptyUser.isNotEmpty, isFalse);
    });

    test('should return false for isEmpty when User is not empty', () {
      final user = User.fromMap(userMap);

      expect(user.isEmpty, isFalse);
      expect(user.isNotEmpty, isTrue);
    });
  });
}


