import 'dart:convert';

class Appointment {
  final int appointment_id;
  final int patient_id;
  final int doctor_id;
  final String status;
  final String message;
  final String description;
  final int rating;
  

  Appointment({
    this.appointment_id = 0,
    required this.patient_id,
    required this.doctor_id,
    this.status = "pending",
    required this.description,
    this.message = "",
    this.rating = 0,
  });

  // converts class to map
  Map<String, dynamic> toMap() {
    return {
      'appointment_id': appointment_id,
      'patient_id': patient_id,
      'doctor_id': doctor_id,
      'status': status,
      'message': message,
      'description': description,
      'rating': rating,
    };
  }

  // converts map to class
  factory Appointment.fromMap(Map<String, dynamic> map) {
    return Appointment(
      appointment_id: map['appointment_id'] ?? 0,
      patient_id: map['patient_id'] ?? '',
      doctor_id: map['doctor_id'] ?? '',
      status: map['status'] ?? '',
      message: map['message'] ?? '',
      description: map['description'] ?? '',
      rating: map['rating'] ?? 0,
    );
  }

  static List<Appointment> fromList(List<dynamic> list) {
    return list.map((e) => Appointment.fromMap(e)).toList();
  }

  String toJson() => json.encode(toMap());

  factory Appointment.fromJson(String source) =>
      Appointment.fromMap(json.decode(source));
}
