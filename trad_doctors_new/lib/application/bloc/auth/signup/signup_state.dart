// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'signup_cubit.dart';

enum SignupStatus { initial, submitting, success, error }

class SignupState extends Equatable {
  final String phoneNumber;
  final String password;
  final SignupStatus status;
  final String question;
  final String answer;
  final String fullName;
  final File profilePicture;
  final String businessName;
  final String businessId;
  final String address;
  final String role;

  const SignupState({
    required this.phoneNumber,
    required this.password,
    required this.status,
    required this.question,
    required this.answer,
    required this.fullName,
    required this.profilePicture,
    required this.businessName,
    required this.businessId,
    required this.address,
    required this.role,
  });

  factory SignupState.initial() {
    return SignupState(
      phoneNumber: "",
      password: "",
      question: "",
      answer: "",
      fullName: "",
      profilePicture: File(""),
      businessName: "",
      businessId: "",
      address: "",
      role: "",
      status: SignupStatus.initial,
    );
  }

  SignupState copyWith({
    String? phoneNumber,
    String? password,
    SignupStatus? status,
    String? question,
    String? answer,
    String? fullName,
    File? profilePicture,
    String? businessName,
    String? businessId,
    String? address,
    String? role,
  }) {
    return SignupState(
      phoneNumber: phoneNumber ?? this.phoneNumber,
      password: password ?? this.password,
      status: status ?? this.status,
      question: question ?? this.question,
      answer: answer ?? this.answer,
      fullName: fullName ?? this.fullName,
      profilePicture: profilePicture ?? this.profilePicture,
      businessName: businessName ?? this.businessName,
      businessId: businessId ?? this.businessId,
      address: address ?? this.address,
      role: role ?? this.role,
    );
  }

  @override
  List<Object> get props => [
        phoneNumber,
        password,
        status,
        question,
        answer,
        fullName,
        profilePicture,
        businessName,
        businessId,
        address,
        role
      ];
}
