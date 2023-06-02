part of 'patient_appointment_bloc.dart';

abstract class PatientAppointmentEvent extends Equatable {
  const PatientAppointmentEvent();

  @override
  List<Object> get props => [];
}

class CreateAppointment extends PatientAppointmentEvent {
  final Appointment appointment;
  final String token;
  const CreateAppointment({required this.token, required this.appointment});

  @override
  List<Object> get props => [appointment];
}

class LoadAppointment extends PatientAppointmentEvent {
  final int id;
  final String token;
  const LoadAppointment({required this.token, required this.id});

  @override
  List<Object> get props => [token, id];
}

class DeleteAppointment extends PatientAppointmentEvent {
  final int index;
  final int appointment_id;
  final String token;
  const DeleteAppointment(
      {required this.index, required this.token, required this.appointment_id});

  @override
  List<Object> get props => [token, appointment_id];
}

class UpdateAppointment extends PatientAppointmentEvent {
  final int id;
  final String token;
  final int index;
  final Map attribute;
  const UpdateAppointment(
      {required this.id,
      required this.token,
      required this.index,
      required this.attribute});
  @override
  List<Object> get props => [id, token, index, attribute];
}

class RateAppointment extends PatientAppointmentEvent {
  final int appointment_id;
  final int rating;
  final String token;
  final int index;
  final int doctorid;
  const RateAppointment(
      {required this.appointment_id,
      required this.rating,
      required this.token,
      required this.index,
      required this.doctorid});

  @override
  List<Object> get props => [token, rating, appointment_id];
}
