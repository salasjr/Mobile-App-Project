import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:trad_doctors_new/domain/patient_appoint_dto.dart';
import 'package:trad_doctors_new/presentation/constants/global_variables.dart';

class AppointmentApi {
  Future<bool> updateAppointment(token, id, attribute) async {
    try {
      http.Response response = await http.put(
        Uri.parse('$uri/appointment//update/$id'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'auth-token': token
        },
        body: jsonEncode(
          {"status": attribute["status"], "message": attribute["message"]},
        ),
      );

      if (response.statusCode == 200) {
        return true;
      } else {
        return false;
      }
    } catch (err) {
      rethrow;
    }
  }

  Future<bool> rateAppointment(token, doctor_id, appointment_id, rating) async {
    try {
      http.Response response = await http.put(
        Uri.parse('$uri/appointment//rate/$appointment_id'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'auth-token': token
        },
        body: jsonEncode(
          {"doctorID": doctor_id, "value": rating},
        ),
      );

      if (response.statusCode == 200) {
        return true;
      } else {
        return false;
      }
    } catch (err) {
      rethrow;
    }
  }

  Future<bool> createAppointments(token, appointment) async {
    try {
      http.Response response = await http.post(
        Uri.parse('$uri/appointment/createappointment'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'auth-token': token
        },
        body: jsonEncode(
          {
            "doctorId": appointment.doctor_id,
            "patientId": appointment.patient_id,
            "caseDescription": appointment.description
          },
        ),
      );

      if (response.statusCode == 200) {
        return true;
      } else {
        return false;
      }
    } catch (err) {
      rethrow;
    }
  }

  Future<List<PatientAppointment>> getPateintAppointments(token, id) async {
    try {
      http.Response response = await http.get(
        Uri.parse('$uri/appointment/patient/$id'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'auth-token': token
        },
      );

      if (response.statusCode == 200) {
        var appointmentJson = jsonDecode(response.body);
        List<PatientAppointment> patientAppointment =
            PatientAppointment.fromList(appointmentJson);
        return patientAppointment;
      } else {
        return [];
      }
    } catch (err) {
      rethrow;
    }
  }

  Future<List<PatientAppointment>> getDoctorAppointments(token, id) async {
    print(" ----------  server $id");
    try {
      http.Response response = await http.get(
        Uri.parse('$uri/appointment/doctor/$id'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'auth-token': token
        },
      );

      if (response.statusCode == 200) {
        var appointmentJson = jsonDecode(response.body);
        List<PatientAppointment> patientAppointment =
            PatientAppointment.fromList(appointmentJson);
        return patientAppointment;
      } else {
        return [];
      }
    } catch (err) {
      rethrow;
    }
  }

  Future<bool> deleteAppointment(token, id) async {
    try {
      http.Response response = await http.delete(
        Uri.parse('$uri/appointment/cancel/$id'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'auth-token': token
        },
      );

      if (response.statusCode == 200) {
        // bool isDeleted = jsonDecode(response.body);
        return true;
      } else {
        return false;
      }
    } catch (err) {
      rethrow;
    }
  }
}
