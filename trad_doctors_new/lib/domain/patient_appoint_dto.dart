import 'dart:convert';

class PatientAppointment {
  final int appointment_id;
  final int patient_id;
  final int doctor_id;
  final String status;
  final String message;
  final String case_description;
  final int rating;
  final String fullname;
  final String phoneNumber;
  final String address;
  final String profilePicture;

  PatientAppointment({
    required this.profilePicture,
    required this.fullname,
    required this.phoneNumber,
    required this.address,
    required this.appointment_id,
    required this.patient_id,
    required this.doctor_id,
    required this.status,
    required this.case_description,
    required this.message,
    required this.rating,
  });

  // converts class to map
  Map<String, dynamic> toMap() {
    return {
      'fullname': fullname,
      'phoneNumber': phoneNumber,
      'address': address,
      'appointment_id': appointment_id,
      'patient_id': patient_id,
      'doctor_id': doctor_id,
      'status': status,
      'message': message,
      'case_description': case_description,
      'rating': rating,
      'profilePicture': profilePicture,
    };
  }

  // converts map to class
  factory PatientAppointment.fromMap(Map<String, dynamic> map) {
    return PatientAppointment(
      appointment_id: map['appointment_id'] ?? 0,
      patient_id: map['patient_id'] ?? 0,
      doctor_id: map['doctor_id'] ?? '',
      status: map['status'] ?? '',
      message: map['message'] ?? '',
      case_description: map['case_description'] ?? '',
      rating: map['rating'] ?? 0,
      address: map['address'] ?? 0,
      fullname: map['fullname'] ?? '',
      phoneNumber: map['phoneNumber'] ?? '',
      profilePicture: map['profilePicture'] ?? '',
    );
  }

  static List<PatientAppointment> fromList(List<dynamic> list) {
    return list.map((e) => PatientAppointment.fromMap(e)).toList();
  }

  String toJson() => json.encode(toMap());

  factory PatientAppointment.fromJson(String source) =>
      PatientAppointment.fromMap(json.decode(source));
}
