part of 'doctor_appointment_bloc.dart';

abstract class DoctorAppointmentEvent extends Equatable {
  const DoctorAppointmentEvent();

  @override
  List<Object> get props => [];
}

class CreateAppointement extends DoctorAppointmentEvent {
  final Appointment appointment;
  final String token;
  const CreateAppointement({required this.token, required this.appointment});

  @override
  List<Object> get props => [appointment];
}

class LoadDoctorAppointment extends DoctorAppointmentEvent {
  final String token;
  final int id;
  const LoadDoctorAppointment({
    required this.token,
    required this.id,
  });

  @override
  List<Object> get props => [token, id];
}

// CRUD OPERATION

class UpdateDoctorAppointment extends DoctorAppointmentEvent {
  final int id;
  final Map attribute;
  final String token;
  final List indexes;

  UpdateDoctorAppointment(
      {required this.token,
      required this.id,
      required this.attribute,
      required this.indexes});

  @override
  List<Object> get props => [id, attribute];
}

class DeleteDoctorAppointment extends DoctorAppointmentEvent {
  final int id;
  final String token;
  final List indexes;

  DeleteDoctorAppointment(
      {required this.token, required this.id, required this.indexes});

  @override
  List<Object> get props => [id, token, indexes];
}
