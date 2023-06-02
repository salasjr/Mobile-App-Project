import 'package:trad_doctors_new/domain/appointemt_dto.dart';
import 'package:trad_doctors_new/domain/patient_appoint_dto.dart';
import 'package:trad_doctors_new/infrustructure/provider/appointment_provider.dart';


abstract class AppointmentInterface {
  Future<List<PatientAppointment>> getPateintAppointments(String token, int id);
  Future<List<Appointment>> getPendingAppointment(String token, String status);
  Future<List<PatientAppointment>> getAcceptedAppointment(String token, int id);
  Future<List<PatientAppointment>> getRejectedAppointment(
      String token, String status);
  Future<List<PatientAppointment>> getCompletedAppointment(
      String token, String status);
  Future<bool> createAppointment(String token, Appointment appointment);
  Future<bool> updateAppointment(String token, int id, Map attributes);
  Future<bool> deleteAppointment(String token, int id);
  Future<bool> rateAppointment(
      String token, int doctor_id, int appointment_id, int rating);
}

class AppointmentImp implements AppointmentInterface {
  final AppointmentApi _appointmentApi = AppointmentApi();
  @override
  Future<bool> createAppointment(String token, Appointment appointment) async {
    return await _appointmentApi.createAppointments(token, appointment);
  }

  @override
  Future<bool> deleteAppointment(String token, int id) async {
    return await _appointmentApi.deleteAppointment(token, id);
  }

  @override
  Future<List<PatientAppointment>> getAcceptedAppointment(
      String token, int id) async {
    print("----------  ${id} object");
    return await _appointmentApi.getDoctorAppointments(token, id);
  }

  @override
  Future<List<PatientAppointment>> getCompletedAppointment(
      String token, String status) {
    throw UnimplementedError();
  }

  @override
  Future<List<Appointment>> getPendingAppointment(String token, String status) {
    throw UnimplementedError();
  }

  @override
  Future<List<PatientAppointment>> getRejectedAppointment(
      String token, String status) {
    throw UnimplementedError();
  }

  @override
  Future<bool> updateAppointment(String token, int id, Map attributes) async {
    return await _appointmentApi.updateAppointment(token, id, attributes);
  }

  @override
  Future<List<PatientAppointment>> getPateintAppointments(
      String token, int id) async {
    return await _appointmentApi.getPateintAppointments(token, id);
  }

  @override
  Future<bool> rateAppointment(
      String token, int doctor_id, int appointment_id, int rating) async {
    return await _appointmentApi.rateAppointment(
        token, doctor_id, appointment_id, rating);
  }
}
