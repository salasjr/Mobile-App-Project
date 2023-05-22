import 'dart:convert';

class User {
  final int id;
  final String fullname;
  final String phoneNumber;
  final String profilePicture;
  final String businessName;
  final String businessId;
  final String address;
  final int verified;
  final String role;
  final String token;
  final int rating;
  final int rating_count;

  User({
    required this.id,
    required this.fullname,
    required this.phoneNumber,
    required this.profilePicture,
    required this.businessName,
    required this.businessId,
    required this.address,
    required this.token,
    required this.role,
    required this.verified,
    required this.rating,
    required this.rating_count,
  });

  // converts class to map
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'fullname': fullname,
      'phoneNumber': phoneNumber,
      'profilePicture': profilePicture,
      'businessName': businessName,
      'businessId': businessId,
      'address': address,
      'verified': verified,
      'role': role,
      'token': token,
      'rating': rating,
      'rating_count': rating_count,
    };
  }

  // converts map to class
  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      id: map['id'] ?? 0,
      fullname: map['fullname'] ?? '',
      phoneNumber: map['phoneNumber'] ?? '',
      profilePicture: map['profilePicture'] ?? '',
      businessName: map['businessName'] ?? '',
      businessId: map['businessId'] ?? '',
      address: map['address'] ?? '',
      verified: map['verified'] ?? 0,
      role: map['role'] ?? '',
      token: map['token'] ?? '',
      rating: map['rating'] ?? 0,
      rating_count: map['rating_count'] ?? 0,
    );
  }

  static List<User> fromList(List<dynamic> list) {
    return list.map((e) => User.fromMap(e)).toList();
  }

  String toJson() => json.encode(toMap());

  factory User.fromJson(String source) => User.fromMap(json.decode(source));
}
