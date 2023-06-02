// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';
import 'package:equatable/equatable.dart';

class User extends Equatable {
  static const String userTable = 'userTable';

  const User(
      {required this.id,
      required this.fullname,
      required this.phoneNumber,
      required this.profilePicture,
      required this.businessName,
      required this.businessId,
      required this.address,
      required this.verified,
      required this.role,
      required this.token,
      required this.rating,
      required this.ratingCount,
      required this.answer,
      required this.question});

  final int id;
  final String question;
  final String answer;
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
  final int ratingCount;

  static const empty = User(
    id: 0,
    address: '',
    answer: '',
    businessId: '',
    businessName: '',
    fullname: '',
    phoneNumber: '',
    profilePicture: '',
    question: '',
    rating: 0,
    ratingCount: 0,
    role: '',
    token: '',
    verified: 0,
  );

  bool get isEmpty => this == User.empty;
  bool get isNotEmpty => this != User.empty;

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
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
      'ratingCount': ratingCount,
    };
  }

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
      ratingCount: map['ratingCount'] ?? 0,
      answer: map['answer'] ?? '',
      question: map['question'] ?? '',

      // id: map['id'] as int,
      // fullname: map['fullname'] != null ? map['fullname'] as String : null,
      // phoneNumber:
      //     map['phoneNumber'] != null ? map['phoneNumber'] as String : null,
      // profilePicture: map['profilePicture'] != null
      //     ? map['profilePicture'] as String
      //     : null,
      // businessName:
      //     map['businessName'] != null ? map['businessName'] as String : null,
      // businessId:
      //     map['businessId'] != null ? map['businessId'] as String : null,
      // address: map['address'] != null ? map['address'] as String : null,
      // verified: map['verified'] != null ? map['verified'] as int : null,
      // role: map['role'] != null ? map['role'] as String : null,
      // token: map['token'] != null ? map['token'] as String : null,
      // rating: map['rating'] != null ? map['rating'] as int : null,
      // ratingCount:
      //     map['ratingCount'] != null ? map['ratingCount'] as int : null,
      // answer: '',
      // question: '',
    );
  }

  String toJson() => json.encode(toMap());

  factory User.fromJson(String source) =>
      User.fromMap(json.decode(source) as Map<String, dynamic>);
  @override
  List<Object?> get props => [
        id,
        fullname,
        phoneNumber,
        profilePicture,
        businessName,
        businessId,
        address,
        verified,
        role,
        token,
        rating,
        ratingCount
      ];
}
