import 'dart:convert';

class Appointment {
  final int appointmentid;
  final String patientid;
  final String doctorid;
  final String status;
  final String message;
  final String description;
  final int rating;

  Appointment({
    this.appointmentid = 0,
    required this.patientid,
    required this.doctorid,
    this.status = "pending",
    required this.description,
    this.message = "",
    this.rating = 0,
  });

  // converts class to map
  Map<String, dynamic> toMap() {
    return {
      'appointmentid': appointmentid,
      'patientid': patientid,
      'doctorid': doctorid,
      'status': status,
      'message': message,
      'description': description,
      'rating': rating,
    };
  }

  // converts map to class
  factory Appointment.fromMap(Map<String, dynamic> map) {
    return Appointment(
      appointmentid: map['appointmentid'] ?? 0,
      patientid: map['patientid'] ?? '',
      doctorid: map['doctorid'] ?? '',
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
