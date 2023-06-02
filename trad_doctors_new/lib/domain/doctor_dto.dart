import 'dart:convert';

class Doctor {
  final int id;
  final String fullname;
  final String phoneNumber;
  final String profilePicture;
  final String businessName;
  final String businessId;
  final String address;
  final int verified;
  final int rating;
  final int ratingCount;

  Doctor({
    this.id = 0,
    required this.fullname,
    required this.phoneNumber,
    required this.profilePicture,
    required this.businessName,
    required this.businessId,
    required this.address,
    required this.verified,
    required this.rating,
    required this.ratingCount,
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
      'rating': rating,
      'rating_count': ratingCount,
    };
  }

  // converts map to class
  factory Doctor.fromMap(Map<String, dynamic> map) {
    return Doctor(
      id: map['id'] ?? 0,
      fullname: map['fullname'] ?? '',
      phoneNumber: map['phoneNumber'] ?? '',
      profilePicture: map['profilePicture'] ?? '',
      businessName: map['businessName'] ?? '',
      businessId: map['businessId'] ?? '',
      address: map['address'] ?? '',
      verified: map['verified'] ?? 0,
      rating: map['rating'] ?? 0,
      ratingCount: map['rating_count'] ?? 0,
    );
  }

  static List<Doctor> fromList(List<dynamic> list) {
    return list.map((e) => Doctor.fromMap(e)).toList();
  }

  String toJson() => json.encode(toMap());

  factory Doctor.fromJson(String source) => Doctor.fromMap(json.decode(source));
}
